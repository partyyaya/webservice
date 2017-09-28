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


@WebServlet("/checkSame")
public class checkSame extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		
		System.out.println(user);
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		String sql = "SELECT * FROM member where user=? ";
		try (
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake",prop);
				PreparedStatement pstmt2=conn.prepareStatement(sql);
				)
			{	
			pstmt2.setString(1, user);
			System.out.println(user);
			ResultSet rs = pstmt2.executeQuery();
				if(rs.next()) {
					out.println("0");
					System.out.println("no");
				}
				else {					
					out.println("1");
					System.out.println("yes");
				}
			}
			catch (Exception e){
				System.out.println(e);
			}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
