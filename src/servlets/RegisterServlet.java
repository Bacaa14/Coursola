package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import objects.Person;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	String url = "jdbc:postgresql://hopper.cs.wlu.edu/corsola";   
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// anything?
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("usernamesignup");
		String umail = request.getParameter("emailsignup");
		String upass = request.getParameter("passwordsignup");
		String upass_confirm = request.getParameter("passwordsignup_confirm");
		
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String docType = "<!DOCTYPE html>";
		String html = "<html>\n";
		request.setAttribute("name", uname);
		request.setAttribute("mail", umail);
		request.setAttribute("pass", upass);
		PrintWriter output = response.getWriter();
		Boolean authenticated = false;
		
		try {
			
			PreparedStatement pstmt = con
					.prepareStatement("INSERT INTO users (username, password, email) " +
							"VALUES (?, ?, ?)");
			PreparedStatement pstmt2 = con
					.prepareStatement("SELECT * FROM users");
			
			// Check DB for existing/duplicate data
			// Can implement this with JavaScript 
			ResultSet rs2 = pstmt2.executeQuery();
			while (rs2.next()) {
				if (rs2.getString("username").equals(uname) && 
						rs2.getString("password").equals(upass) || rs2.getString("email").equals(uname)
						&& rs2.getString("password").equals(upass)) {
							output.println("You are already registered. Please log in at the " +
									"Login Page.");
				} else if (rs2.getString("username").equals(uname))
					output.println("This username already exists.");
				else if (rs2.getString("email").equals(umail))
					output.println("This email is already registered.");
			}

			if (upass.equals(upass_confirm)) {
				pstmt.setString(1, uname);
				pstmt.setString(2, upass);
				pstmt.setString(3, umail);
				pstmt.executeUpdate();
				authenticated = true;
				session.setAttribute("authenticated", authenticated);
				session.setMaxInactiveInterval(60);
				request.getRequestDispatcher("registeredPage.jsp").forward(request, response);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
