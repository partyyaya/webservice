package tw.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Properties;

public class getearthData {
//	public static void main(String[] args) {
//		getearthData.scaleGetData("8","2015");
//	}
//	
	public static LinkedList<quakedata> timeGetData(String year){
		LinkedList<quakedata> list = new LinkedList<>();//使用list存放資料
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		String sql = "SELECT * FROM data where date like ?";
		
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake?useUnicode=true&characterEncoding=UTF-8",prop);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,year+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				quakedata data = new quakedata();
				data.setNumber(rs.getString("number"));
				data.setDate(rs.getString("date"));
				data.setLon(rs.getString("lon"));
				data.setLat(rs.getString("lat"));
				data.setScale(rs.getString("scale"));
				data.setDepth(rs.getString("depth"));
				data.setPosition(rs.getString("position"));
				list.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(list.get(list.size()-1).getDate());
		return list;
	}
	
	public static LinkedList<quakedata> timeGetData(String year,String month){
		LinkedList<quakedata> list = new LinkedList<>();//使用list存放資料
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		String sql = "SELECT * FROM data where date like ?";
		
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake?useUnicode=true&characterEncoding=UTF-8",prop);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,year+"/"+month+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				quakedata data = new quakedata();
				data.setNumber(rs.getString("number"));
				data.setDate(rs.getString("date"));
				data.setLon(rs.getString("lon"));
				data.setLat(rs.getString("lat"));
				data.setScale(rs.getString("scale"));
				data.setDepth(rs.getString("depth"));
				data.setPosition(rs.getString("position"));
				list.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.get(list.size()-1).getDate());
		return list;
	}

	public static LinkedList<quakedata> timeGetData(String year,String month,String scale){
		LinkedList<quakedata> list = new LinkedList<>();//使用list存放資料
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		String sql = "SELECT * FROM data where date like ? and scale like ?";
		
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake?useUnicode=true&characterEncoding=UTF-8",prop);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,year+"/"+month+"%");
			pstmt.setString(2,scale+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				quakedata data = new quakedata();
				data.setNumber(rs.getString("number"));
				data.setDate(rs.getString("date"));
				data.setLon(rs.getString("lon"));
				data.setLat(rs.getString("lat"));
				data.setScale(rs.getString("scale"));
				data.setDepth(rs.getString("depth"));
				data.setPosition(rs.getString("position"));
				list.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.get(list.size()-1).getScale());
		return list;
	}
	
	public static LinkedList<quakedata> scaleGetData(String scale){
		LinkedList<quakedata> list = new LinkedList<>();//使用list存放資料
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		String sql = "SELECT * FROM data where scale like ?";
		
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake?useUnicode=true&characterEncoding=UTF-8",prop);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,scale+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				quakedata data = new quakedata();
				data.setNumber(rs.getString("number"));
				data.setDate(rs.getString("date"));
				data.setLon(rs.getString("lon"));
				data.setLat(rs.getString("lat"));
				data.setScale(rs.getString("scale"));
				data.setDepth(rs.getString("depth"));
				data.setPosition(rs.getString("position"));
				list.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.get(0).getScale());
		return list;
	}

	public static LinkedList<quakedata> scaleGetData(String scale,String year){
		LinkedList<quakedata> list = new LinkedList<>();//使用list存放資料
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		String sql = "SELECT * FROM data where scale like ? and date like ?";
		
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake?useUnicode=true&characterEncoding=UTF-8",prop);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,scale+"%");
			pstmt.setString(2,year+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				quakedata data = new quakedata();
				data.setNumber(rs.getString("number"));
				data.setDate(rs.getString("date"));
				data.setLon(rs.getString("lon"));
				data.setLat(rs.getString("lat"));
				data.setScale(rs.getString("scale"));
				data.setDepth(rs.getString("depth"));
				data.setPosition(rs.getString("position"));
				list.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.get(0).getDate()+","+list.get(0).getScale());
		return list;
	}

	public static LinkedList<quakedata> positionGetData(String position,String year){
		LinkedList<quakedata> list = new LinkedList<>();//使用list存放資料
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		String sql = "SELECT * FROM data where position like ? and date like ?";
		
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake?useUnicode=true&characterEncoding=UTF-8",prop);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+position+"%");
			pstmt.setString(2,year+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				quakedata data = new quakedata();
				data.setNumber(rs.getString("number"));
				data.setDate(rs.getString("date"));
				data.setLon(rs.getString("lon"));
				data.setLat(rs.getString("lat"));
				data.setScale(rs.getString("scale"));
				data.setDepth(rs.getString("depth"));
				data.setPosition(rs.getString("position"));
				list.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.get(0).getDate()+","+list.get(0).getScale());
		return list;
	}
	
	
}
