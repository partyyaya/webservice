package tw.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Properties;

public class getearthData {
	public static void main(String[] args) {
		LinkedList<quakedata> list = getearthData.getAllData();
		System.out.println(list.get(list.size()-1).getDate());
//		String date="2016/1/16";
//		String dates[]=date.split("/");
//		System.out.println(dates[0]+":"+dates[1]+":"+dates[2]);
	}
	
	public static LinkedList<quakedata> getAllData(){
		LinkedList<quakedata> list = new LinkedList<>();//使用list存放資料
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		String sql = "SELECT * FROM data ";

		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake?useUnicode=true&characterEncoding=UTF-8",prop);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs = null;
				rs = pstmt.executeQuery();
				String rsdate=null;
			while(rs.next()) {
				quakedata data = new quakedata();
				rsdate = rs.getString("date").substring(0,19);
				data.setNumber(rs.getString("number"));
				data.setDate(rsdate);
				data.setLon(rs.getFloat("lon"));
				data.setLat(rs.getFloat("lat"));
				data.setScale(rs.getFloat("scale"));
				data.setDepth(rs.getFloat("depth"));
				data.setPosition(rs.getString("position"));
				list.add(data);
			}
			rs.close();			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public static LinkedList<quakedata> timeGetData(String date,String todate){
		LinkedList<quakedata> list = new LinkedList<>();//使用list存放資料
		String dates[]=date.split("-");
		String todates[]=todate.split("-");
		//若日期不正確則回傳
		//System.out.println(dates[0]);
		if(Integer.parseInt(dates[0])>Integer.parseInt(todates[0])) {
			System.out.println(dates[0]);
			return list;
		}else if(Integer.parseInt(dates[1])>Integer.parseInt(todates[1])) {
			System.out.println(dates[1]);
			return list;
		}else if(Integer.parseInt(dates[2])>Integer.parseInt(todates[2])) {
			System.out.println(dates[2]);
			return list;
		}
		if(Integer.parseInt(dates[0])<1995) {date="1995-1-1";}
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		String sql = "SELECT * FROM data where date between ? and ?";

		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake?useUnicode=true&characterEncoding=UTF-8",prop);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs = null;
				pstmt.setString(1,date);
				pstmt.setString(2,todate);
				rs = pstmt.executeQuery();
				String rsdate=null;
			while(rs.next()) {
				quakedata data = new quakedata();
				rsdate = rs.getString("date").substring(0,19);
				data.setNumber(rs.getString("number"));
				data.setDate(rsdate);
				data.setLon(rs.getFloat("lon"));
				data.setLat(rs.getFloat("lat"));
				data.setScale(rs.getFloat("scale"));
				data.setDepth(rs.getFloat("depth"));
				data.setPosition(rs.getString("position"));
				list.add(data);
			}
			rs.close();			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static LinkedList<quakedata> scaleGetData(String scale,String toscale,LinkedList<quakedata> list){
		LinkedList<quakedata> list2 = new LinkedList<>();
		if(Float.parseFloat(scale)>Float.parseFloat(toscale)) {
			return list;
		}
		for(int i=0;i<=list.size()-1;i++) {
			if(list.get(i).getScale()>=Float.parseFloat(scale) && list.get(i).getScale()<=Float.parseFloat(toscale)) {
				list2.add(list.get(i));
			}
		}		
		return list2;
	}
	
	public static LinkedList<quakedata> depthGetData(String depth,String todepth,LinkedList<quakedata> list){
		LinkedList<quakedata> list2 = new LinkedList<>();
		if(Float.parseFloat(depth)>Float.parseFloat(todepth)) {
			return list;
		}
		for(int i=0;i<=list.size()-1;i++) {
			if(list.get(i).getDepth()>=Float.parseFloat(depth) && list.get(i).getDepth()<=Float.parseFloat(todepth)) {
				list2.add(list.get(i));
			}
		}		
		return list2;
	}
	
	public static LinkedList<quakedata> latGetData(String lat,String tolat,LinkedList<quakedata> list){
		LinkedList<quakedata> list2 = new LinkedList<>();
		if(Float.parseFloat(lat)>Float.parseFloat(tolat)) {
			return list;
		}
		for(int i=0;i<=list.size()-1;i++) {
			if(list.get(i).getLat()>=Float.parseFloat(lat) && list.get(i).getLat()<=Float.parseFloat(tolat)) {
				list2.add(list.get(i));
			}
		}		
		return list2;
	}
	
	public static LinkedList<quakedata> lonGetData(String lon,String tolon,LinkedList<quakedata> list){
		LinkedList<quakedata> list2 = new LinkedList<>();
		if(Float.parseFloat(lon)>Float.parseFloat(tolon)) {
			return list;
		}
		for(int i=0;i<=list.size()-1;i++) {
			if(list.get(i).getLon()>=Float.parseFloat(lon) && list.get(i).getLon()<=Float.parseFloat(tolon)) {
				list2.add(list.get(i));
			}
		}		
		return list2;
	}

	public static LinkedList<quakedata> positionGetData(String position,LinkedList<quakedata> list){
		LinkedList<quakedata> list2 = new LinkedList<>();//使用list存放資料
		for(int i=0;i<=list.size()-1;i++) {
			if(list.get(i).getPosition().contains(position)) {
				list2.add(list.get(i));
			}
		}
		return list2;
	}
	
	private static String getday(int year,int month) {
		String day = null;
		switch(month) {
			case 1:case 3:case 5:case 7:case 8:case 10:case 12:day="31";break;
			case 4:case 6:case 9:case 11:day="30";break;
			case 2:
				if ((year%400==0)||(year%4==0)&&(year%100!=0)){
					    day = 29+"";
					 }else{
						day = 28+"";
				}
				break;
		}
		
		return day;
	}
}
