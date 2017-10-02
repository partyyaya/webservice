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
import javax.servlet.http.HttpSession;


@WebServlet("/loginMember")
public class loginMember extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String passwd = request.getParameter("passwd");
		
		//若沒有已存在session,就會自動新創立一個
		HttpSession session = request.getSession();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		String sql = "SELECT * FROM member where user=? and passwd=?";
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}		
		try (
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake"
				                       ,prop);
				PreparedStatement pstmt=conn.prepareStatement(sql);			
				)
			{					
				pstmt.setString(1, user);
				pstmt.setString(2, passwd);
				ResultSet rs = pstmt.executeQuery();
				System.out.println("123");
				if(rs.next()) {
					//將名稱傳回主頁
					if(Integer.parseInt(rs.getString("authority"))==0) {
						request.setAttribute("close","0");
						request.getRequestDispatcher("login.jsp").forward(request, response);
					}else {
					session.setAttribute("user", user);
					session.setAttribute("authority", rs.getString("authority"));
					request.getRequestDispatcher("getData.jsp").forward(request, response);
					}
				}else {					
						request.setAttribute("miss","0");
						request.getRequestDispatcher("login.jsp").forward(request, response);					
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
