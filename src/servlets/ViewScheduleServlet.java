package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import objects.Course;

/**
 * Servlet implementation class ViewScheduleServlet
 */
@WebServlet("/ViewScheduleServlet")
public class ViewScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	String url = "jdbc:postgresql://hopper.cs.wlu.edu/corsola";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		super.init();
		try {
			Class.forName("org.postgresql.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO replace with appropriate url
		try {
			con = DriverManager.getConnection(url, "web", "");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		super.destroy();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user = request.getParameter("username");
		String[] courses = request.getParameterMap().get("courses??"); 
		/**
		 * I'm unsure of what to use for the parameter here^^. In courseHistory.jsp, we're selecting
		 * the term to view the schedule of. From the term that we want to see, how do we get the
		 * courses from that term? 
		 */
		
		
		ArrayList<Course> courseList = new ArrayList<Course>();
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM course_lists WHERE list_id = ? AND " +
					"user_id = ?");
			
			//get user id
			PreparedStatement pstmt2 = con.prepareStatement("SELECT user_id FROM users WHERE username= ?");
			
			//get course_list using user_id
			PreparedStatement pstmt3 = con.prepareStatement("SELECT course_list_text FROM course_lists WHERE " +
					"user_id = ? AND list_id = ?");
							
					
			for (String cs : courses){
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					Course course = new Course();
					course.setID(rs.getInt("id"));
					course.setDepartment(rs.getString("department"));
					course.setNumber(rs.getString("number"));
					course.setSection(rs.getString("section"));
					course.setTitle(rs.getString("title"));
					
					/**(from corsola servlet, idk if we need) 
					 * 
					timePstmt.setInt(1, course.getID());
					ResultSet timeRs = timePstmt.executeQuery();
					while (timeRs.next()) {
						course.addTime(timeRs.getString("day").charAt(0),
								timeRs.getInt("starttime"),
								timeRs.getInt("endtime"));
					} */
					
					courseList.add(course);
				}
			}

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("courseList", courseList);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
