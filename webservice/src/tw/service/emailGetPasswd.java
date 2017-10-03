package tw.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class emailGetPasswd
 */
@WebServlet("/emailGetPasswd")
public class emailGetPasswd extends HttpServlet {
	private email smtp = new email(); 
	private String number;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String email = request.getParameter("email");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		String sql = "SELECT * FROM member where user=? and email=?";
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}		
		try (
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake",prop);
				PreparedStatement pstmt=conn.prepareStatement(sql);				
				//PreparedStatement pstmt2=conn.prepareStatement(upsql);	
				)
			{					
				pstmt.setString(1, user);
				pstmt.setString(2, email);
				ResultSet rs = pstmt.executeQuery();	
				if(rs.next()) {						
					number=smtp.smtp(email);						
					request.setAttribute("number", number);
					request.setAttribute("user", user);					
					request.getRequestDispatcher("newpasswd.jsp").forward(request, response);				
					}else {
					request.setAttribute("nothing","0");					
					request.getRequestDispatcher("forgetPasswd.jsp").forward(request, response);
				}
				//System.out.println("222");
			}
			catch (Exception e){
				System.out.println(e);
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
