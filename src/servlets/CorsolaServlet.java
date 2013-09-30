package servlets;


import java.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import objects.Course;
import objects.Time;

/**
 * Servlet implementation class CorsolaServlet
 */
@WebServlet("/CorsolaServlet")
public class CorsolaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	String url = "jdbc:postgresql://hopper.cs.wlu.edu/corsola";
    
	@Override
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
    public CorsolaServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.sendError(405);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Get info from Pref
		String[] prefIDStrings = request.getParameterMap().get("prefIDs");
		ArrayList<Course> prefCourses = new ArrayList<Course>();
		try {
			PreparedStatement pstmt = con
					.prepareStatement("SELECT * FROM courses WHERE id = ?");
			PreparedStatement timePstmt = con
					.prepareStatement("SELECT * FROM times WHERE course_id = ?");
			for (String prefIDString : prefIDStrings) {
				try {
					pstmt.setInt(1, Integer.valueOf(prefIDString));
				} catch (NumberFormatException e) {
					System.out.println("yeah");
					System.out.println(prefIDString);
					System.out.println("no");
					
				}
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					Course course = new Course();
					course.setID(rs.getInt("id"));
					course.setDepartment(rs.getString("department"));
					course.setNumber(rs.getString("number"));
					course.setSection(rs.getString("section"));
					course.setTitle(rs.getString("title"));
					timePstmt.setInt(1, course.getId());
					ResultSet timeRs = timePstmt.executeQuery();
					while (timeRs.next()) {
						course.addTime(timeRs.getString("day").charAt(0),
								timeRs.getInt("starttime"),
								timeRs.getInt("endtime"));
					}
					prefCourses.add(course);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("courses", prefCourses);
		// TODO send this to proper jsp file
		request.getRequestDispatcher("selection.jsp")
				.forward(request, response);

	}

}
