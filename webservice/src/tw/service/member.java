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


@WebServlet("/member")
public class member extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user = request.getParameter("user");
		String passwd = request.getParameter("passwd");
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
		
		String insql = "INSERT INTO member(user,passwd,authority) values(?,?,?)";
		String sql = "SELECT * FROM member where user=? ";
		synchronized(request) {
		try (
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake",prop);
				PreparedStatement pstmt=conn.prepareStatement(insql);
				PreparedStatement pstmt2=conn.prepareStatement(sql);
				)
			{	
			pstmt2.setString(1, user);
			
			ResultSet rs = pstmt2.executeQuery();
				if(rs.next()) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('此帳號名稱已有人使用!');");
					out.println("location='addMember.jsp';");
					out.println("</script>");
				}
				else {
					pstmt.setString(1, user);
					pstmt.setString(2, passwd);
					pstmt.setString(3,"0");
					pstmt.execute();
					out.println("<script type=\"text/javascript\">");
					out.println("location='login.jsp';");
					out.println("</script>");
				}
			}
			catch (Exception e){
				System.out.println(e);
			}
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
