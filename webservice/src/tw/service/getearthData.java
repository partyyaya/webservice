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
		LinkedList<quakedata> list = getearthData.timeGetData("2016/1/16","2017/8/20");
		System.out.println(list.get(0).getPosition());
//		String date="2016/1/16";
//		String dates[]=date.split("/");
//		System.out.println(dates[0]+":"+dates[1]+":"+dates[2]);
	}
	
	public static LinkedList<quakedata> timeGetData(String date,String todate){
		LinkedList<quakedata> list = new LinkedList<>();//使用list存放資料
		int begin = 0,end=0;
		String dates[]=date.split("/");
		String todates[]=todate.split("/");
		//若日期不正確則回傳
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
		try {			
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (Exception e) {
			System.out.println(e);
		}	
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		String sql = "SELECT * FROM data where date like ?";
		String insql = "SELECT * FROM data where id between ? and ?";
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake?useUnicode=true&characterEncoding=UTF-8",prop);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			PreparedStatement pstmt2=conn.prepareStatement(sql);
			PreparedStatement pstmt3=conn.prepareStatement(insql);
			
			ResultSet rs = null;
			//將開始日期找到
			System.out.println("ok");
			while(begin==0) {
				pstmt.setString(1,date+" %");
				rs = pstmt.executeQuery();
				//將最後日期找到
				if(rs.next()) {
					begin = rs.getInt("id");
				}
				//若日期沒有找到
				if(begin==0) {
					//如果前一個月都沒發生地震
					dates=date.split("/");
					if(Integer.parseInt(dates[2])==Integer.parseInt(getday(Integer.parseInt(dates[0]),Integer.parseInt(dates[1])))) {
						date = dates[0]+"/"+(Integer.parseInt(dates[1])+1)+"/"+1;
						System.out.println(date);
					}else {
						date = dates[0]+"/"+dates[1]+"/"+(Integer.parseInt(dates[2])+1);
					}
				}
			}
			System.out.println("ok2 "+date);
			ResultSet rs2 = null;			
			while(end==0) {
				pstmt2.setString(1,todate+" %");
				rs2 = pstmt2.executeQuery();
				//將最後日期找到
				while(rs2.next()) {
					end = rs2.getInt("id");
				}
				//若日期沒有找到
				if(end==0) {
					todates=todate.split("/");
					if(Integer.parseInt(todates[2])==1) {//若當月都沒發生地震,則到前一個月的最後開始尋找
						todate = todates[0]+"/"+(Integer.parseInt(todates[1])-1)+"/"+getday(Integer.parseInt(todates[0]),(Integer.parseInt(todates[1])-1));
					}else {
						todate = todates[0]+"/"+todates[1]+"/"+(Integer.parseInt(todates[2])-1);
						System.out.println("ok3 "+todate);
					}
				}
			}
			
			if(begin>end) {
				return list;
			}
			pstmt3.setInt(1,begin);
			pstmt3.setInt(2,end);
			ResultSet rs3 = pstmt3.executeQuery();
			while(rs3.next()) {
				quakedata data = new quakedata();
				data.setNumber(rs3.getString("number"));
				data.setDate(rs3.getString("date"));
				data.setLon(rs3.getString("lon"));
				data.setLat(rs3.getString("lat"));
				data.setScale(rs3.getString("scale"));
				data.setDepth(rs3.getString("depth"));
				data.setPosition(rs3.getString("position"));
				list.add(data);
			}
			rs.close();
			rs2.close();
			rs3.close();
			pstmt.close();
			pstmt2.close();
			pstmt3.close();
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
			if(Float.parseFloat(list.get(i).getScale())>=Float.parseFloat(scale) && Float.parseFloat(list.get(i).getScale())<=Float.parseFloat(toscale)) {
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
			if(Float.parseFloat(list.get(i).getDepth())>=Float.parseFloat(depth) && Float.parseFloat(list.get(i).getDepth())<=Float.parseFloat(todepth)) {
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
			if(Float.parseFloat(list.get(i).getLat())>=Float.parseFloat(lat) && Float.parseFloat(list.get(i).getLat())<=Float.parseFloat(tolat)) {
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
			if(Float.parseFloat(list.get(i).getLon())>=Float.parseFloat(lon) && Float.parseFloat(list.get(i).getLon())<=Float.parseFloat(tolon)) {
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
