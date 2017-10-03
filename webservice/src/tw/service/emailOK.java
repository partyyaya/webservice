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


@WebServlet("/emailOK")
public class emailOK extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String passwd = request.getParameter("passwd");
		String user = request.getParameter("user");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		String upsql = "UPDATE member SET  passwd=? WHERE user=?";

		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}		
		try (
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake",prop);
				PreparedStatement pstmt=conn.prepareStatement(upsql);				
				)
			{					
				pstmt.setString(1, passwd);
				pstmt.setString(2, user);
				pstmt.executeUpdate();
				System.out.println(user+"="+passwd);
				out.println("<script type=\"text/javascript\">");
				out.println("alert('已更改密碼,請至登入頁面登入');");
				out.println("location='login.jsp';");
				out.println("</script>");
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
