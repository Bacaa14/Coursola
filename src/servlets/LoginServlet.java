package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import objects.Course;
import objects.Person;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	String url = "jdbc:postgresql://hopper.cs.wlu.edu/corsola";   
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

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
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// anything?	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("username");
		String upass = request.getParameter("password");
		String umail = request.getParameter("email");
		request.setAttribute("loginUname", uname);
		request.setAttribute("loginUpass", upass);
		request.setAttribute("loginUmail", umail);
		
		HttpSession session = request.getSession();
		String docType = "<!DOCTYPE html>";
		String html = "<html>\n";

		// get the output stream to send response back to the client
		PrintWriter output = response.getWriter();
		Boolean authenticated = false;
		
		try {
			PreparedStatement pstmt = con
					.prepareStatement("SELECT * FROM users");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("username").equals(uname) && 
						rs.getString("password").equals(upass) || rs.getString("email").equals(uname)
						&& rs.getString("password").equals(upass)) {
							authenticated = true;
							session.setAttribute("authenticated", authenticated);
							session.setMaxInactiveInterval(60);
							request.getRequestDispatcher("registeredPage.jsp").forward(request, response);
				} 
			}
			output.println("<h1>Not Authenticated</h1>");
			output.println("<p>You are not supposed to be here.  You must login first.</p>");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
