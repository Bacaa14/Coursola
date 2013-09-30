package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import objects.Course;
import objects.Time;

/**
 * Servlet implementation class PreferredCourses
 */
@WebServlet("/PreferredCourses")
public class PreferredCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	String url = "jdbc:postgresql://hopper.cs.wlu.edu/corsola";

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			Class.forName("org.postgresql.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(url, "web", "");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		super.destroy();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PreferredCourses() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Course> courses = new ArrayList<Course>();
		try {
			Statement stmt = con.createStatement();
			ResultSet courseResult = stmt
					.executeQuery("SELECT id, department, number, section, title, credit, fdr, type, faculty, consent, capacity, location FROM courses;");

			while (courseResult.next()) {
				Course course = new Course();
				course.setID(courseResult.getInt("id"));
				course.setDepartment(courseResult.getString("department"));
				course.setNumber(courseResult.getString("number"));
				course.setSection(courseResult.getString("section"));
				course.setTitle(courseResult.getString("title"));
				course.setCredits(courseResult.getString("credit"));
				course.setFDR(courseResult.getString("fdr"));
				course.setType(courseResult.getString("type"));
				course.setFaculty(courseResult.getString("faculty"));
				course.setInstrConsent(0 == courseResult.getInt("consent") ? "N" : "Y");
				course.setExpectCap(courseResult.getInt("capacity"));
				course.setLocation(courseResult.getString("location"));
				courses.add(course);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {

			for (Course course : courses) {
				PreparedStatement pstmt = con
						.prepareStatement("SELECT day, starttime, endtime FROM times WHERE course_id = ?");
				pstmt.setInt(1, course.getId());
				ResultSet timesResult = pstmt.executeQuery();
				while (timesResult.next()) {
					char day = timesResult.getString("day").charAt(0);
					int starttime = timesResult.getInt("starttime");
					int endtime = timesResult.getInt("endtime");
					course.addTime(day, starttime, endtime);
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("courses", courses);
		request.getRequestDispatcher("preference.jsp").forward(request,
				response);
		return;

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
