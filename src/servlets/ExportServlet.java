package servlets;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import objects.Course;
import objects.Time;
import net.fortuna.ical4j.data.CalendarOutputter;
import net.fortuna.ical4j.model.*;
import net.fortuna.ical4j.model.component.VEvent;
import net.fortuna.ical4j.model.component.VTimeZone;
import net.fortuna.ical4j.model.property.*;
import net.fortuna.ical4j.util.UidGenerator;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Calendar;
import java.sql.*;
/**
 * Servlet implementation class ExportServlet
 * Covers all functionality for posting an .ics file (for use with iCal) to be downloaded by a user
 * containing their selected courses.  Accessed by hitting the export button on the course scheduler.
 * Submitted as a post request. Each course in the preferred course list has a corresponding hidden checkbox,
 * with the course id as its id (see newObjectDefinitions.jsp).  This is how the information is submitted.
 * 
 * Components:
 * -java.util.Calendar for setting times
 * -iCal4j API for converting times and days to iCal events and creating an iCal compatible calendar
 * -SQL for accessing course and time information from the server  (could be later moved to a DatabaseServlet)
 * 
 * Comments for how the ExportServlet converts the incoming list of ids to an iCal file are given in the getPost
 * function below.
 */
@WebServlet("/ExportServlet")
public class ExportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;   
	String url = "jdbc:postgresql://hopper.cs.wlu.edu/corsola";
	net.fortuna.ical4j.model.Calendar ical= new net.fortuna.ical4j.model.Calendar();
	private static final HashMap<Character, WeekDay> dayMap = new HashMap<Character, net.fortuna.ical4j.model.WeekDay>();
	static{
		dayMap.put('M', WeekDay.MO);
		dayMap.put('T', WeekDay.TU);
		dayMap.put('W', WeekDay.WE);
		dayMap.put('R', WeekDay.TH);
		dayMap.put('F', WeekDay.FR);
	}
	TimeZoneRegistry registry;
	TimeZone timezone;
	VTimeZone tz;
	private String filePath;
	private static final int BUFSIZE = 4096;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		filePath = getServletContext().getRealPath("") + File.separator + "schedule.ics";
		try{
			ical.getProperties().add(new ProdId("-//Ben Fortuna//iCal4j 1.0//EN"));
			ical.getProperties().add(Version.VERSION_2_0);
			ical.getProperties().add(CalScale.GREGORIAN);
		}
		catch(Exception e){
			System.out.println("iCalendar failed to import");
		}
		registry = TimeZoneRegistryFactory.getInstance().createRegistry();
		timezone = registry.getTimeZone("America/New_York");
		tz = timezone.getVTimeZone();
		
		try {
			// Register the driver.
			Class.forName("org.postgresql.Driver").newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String url = "jdbc:postgresql://hopper.cs.wlu.edu/corsola";
		try {
			con = DriverManager.getConnection(url, "web", "");
		}
		catch (SQLException e) {
		e.printStackTrace();
		}

	}


	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.destroy();
	}
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] courseids = request.getParameterValues("courses");
		//Saving the course ids as a session attribute (not necessary, might be better for saving)

		HttpSession session = request.getSession(true);	
		session.setAttribute("courses", courseids);

		//Get course and time info for each id
		if(courseids == null){
			
		}
		else{
		try{
			for(String id: courseids){
					Integer courseid = Integer.parseInt(id);
					PreparedStatement getCourse = con.prepareStatement("SELECT title, department, number, section " +
							"FROM courses WHERE id=?;");
					getCourse.setInt(1,courseid);
					PreparedStatement getTime = con.prepareStatement("SELECT day, starttime, endtime FROM times " +
							"WHERE course_id=?;");
					getTime.setInt(1, courseid);
					ResultSet courseResult = getCourse.executeQuery();
					ResultSet timesResult = getTime.executeQuery();
					while(courseResult.next()){
						//Generating the course from the DB, lets us utilize timeblocks
						Course course = new Course();
						course.setTitle(courseResult.getString("title"));
						course.setDepartment(courseResult.getString("department"));
						course.setNumber(courseResult.getString("number"));
						course.setSection(courseResult.getString("section"));
						String courseTitle = course.getDepartment() + course.getNumber() + "-" + 
								course.getSection() + ": " + course.getTitle();
						while(timesResult.next()){
							course.addTime(timesResult.getString("day").charAt(0), timesResult.getInt("starttime"), 
									timesResult.getInt("endtime"));
						}
		
						//Now parse the timeshttp://ical4j.sourceforge.net/introduction.html for the timeblocks
						Map<String, Set<Character>> timeblocks = course.getTimeBlocks();
						for(String startend: timeblocks.keySet()){
							String[] StartEnd = startend.split("-");
							Integer startInt = Integer.parseInt(StartEnd[0]);
							Integer endInt = Integer.parseInt(StartEnd[1]);
							java.util.Calendar startDate = this.getTimeCalendar(startInt);
							java.util.Calendar endDate = this.getTimeCalendar(endInt);
							DateTime startTime = new DateTime(startDate.getTime());
							DateTime endTime = new DateTime(endDate.getTime());

							VEvent courseEvent = new VEvent(startTime, endTime, courseTitle);
							Recur recur = new Recur(Recur.WEEKLY, null);
							//add the proper days to the recurrence
							for(char day: timeblocks.get(startend)){
								recur.getDayList().add(dayMap.get(day));
							}
							courseEvent.getProperties().add(new RRule(recur));
							//Get unique identifier
							UidGenerator ug = new UidGenerator("uidGen");
							Uid uid = ug.generateUid();
							courseEvent.getProperties().add(uid);
							//Finally, add the time block to the calendar
							this.ical.getComponents().add(courseEvent);
						}
					}
				}
			}
		catch (SQLException e) {
			e.printStackTrace();
		}
		}
		//Time to handle file download
		try {
			//making the file and outputting the calendar info
			File file = new File("mycalendar.ics");
			int length   = 0;
			FileOutputStream fout = new FileOutputStream(file);
			CalendarOutputter outputter = new CalendarOutputter();
			outputter.output(ical, fout);
			ServletOutputStream outStream = response.getOutputStream();
			response.setContentType("text/calendar");
			response.setContentLength((int)file.length());
	        // sets HTTP header
	        response.setHeader("Content-Disposition", "attachment; filename=calendar.ics");
	        byte[] byteBuffer = new byte[BUFSIZE];
	        DataInputStream in = new DataInputStream(new FileInputStream(file));
	        
	        // reads the file's bytes and writes them to the response stream
	        while ((in != null) && ((length = in.read(byteBuffer)) != -1))
	        {
	            outStream.write(byteBuffer,0,length);
	        }
	        
	        in.close();
	        outStream.close();
		} catch (ValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
	
	
	private java.util.Calendar getTimeCalendar(Integer time){
		//May let date be parameter for future application.
		Integer hours = this.getHours(time);
		Integer minutes = this.getMinutes(time);
		java.util.Calendar timeCal = Calendar.getInstance();
		timeCal.set(timeCal.get(timeCal.YEAR), timeCal.get(timeCal.MONTH),timeCal.get(timeCal.DATE), hours, minutes);
		timeCal.set(Calendar.MILLISECOND, 0);
		return timeCal;
		
	}
	private Integer getHours(Integer time){
		return (int) Math.floor(time/60);
	}
	
	private Integer getMinutes(Integer time){
		return time % 60;
	}
	
}
