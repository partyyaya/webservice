<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!--設寬度為硬體寬的一倍( initial-scale=1)-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--設最大寬度為一倍,使用者不可用2指拉大(user-scalable=no)-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="switch/bootstrapSwitch.css">
<script src="switch/bootstrapSwitch.js"></script>

<link rel="shortcut icon" href="img/logo.png">
<title>地震查詢</title>

<style>
.list-group-item{
    background-color:#000;
	border:none;
}
.list-group{	
	padding:0px;
	height:100%;
	text-align:center;
	 background-color:#000;
	 margin-bottom:0px;
	 border: 1px solid rgba(0, 0, 0,0.7);
}

#gettime{
	color:#ccc;
}

.list-group a{	
	color:#CCC;
}

#tablecontent{
	border: 1px solid rgba(0, 0, 0,0.4);
	border-right-width:0px;
	height:100%;
	text-align:center;
}

#logout{
	color:#000;
}

#logout:hover{
		color:#800000;
}

th,td{
	text-align:center;
}

input{
	text-align:center;
	border-width:0px;
}

.switch {height:28px; }

.col-xs-offset-right-12 {
  margin-right: 100%;
}
.col-xs-offset-right-11 {
  margin-right: 91.66666667%;
}
.col-xs-offset-right-10 {
  margin-right: 83.33333333%;
}
.col-xs-offset-right-9 {
  margin-right: 75%;
}
.col-xs-offset-right-8 {
  margin-right: 66.66666667%;
}
.col-xs-offset-right-7 {
  margin-right: 58.33333333%;
}
.col-xs-offset-right-6 {
  margin-right: 50%;
}
.col-xs-offset-right-5 {
  margin-right: 41.66666667%;
}
.col-xs-offset-right-4 {
  margin-right: 33.33333333%;
}
.col-xs-offset-right-3 {
  margin-right: 25%;
}
.col-xs-offset-right-2 {
  margin-right: 16.66666667%;
}
.col-xs-offset-right-1 {
  margin-right: 8.33333333%;
}
.col-xs-offset-right-0 {
  margin-right: 0;
}

@media (min-width: 768px) {
  .col-sm-offset-right-12 {
    margin-right: 100%;
  }
  .col-sm-offset-right-11 {
    margin-right: 91.66666667%;
  }
  .col-sm-offset-right-10 {
    margin-right: 83.33333333%;
  }
  .col-sm-offset-right-9 {
    margin-right: 75%;
  }
  .col-sm-offset-right-8 {
    margin-right: 66.66666667%;
  }
  .col-sm-offset-right-7 {
    margin-right: 58.33333333%;
  }
  .col-sm-offset-right-6 {
    margin-right: 50%;
  }
  .col-sm-offset-right-5 {
    margin-right: 41.66666667%;
  }
  .col-sm-offset-right-4 {
    margin-right: 33.33333333%;
  }
  .col-sm-offset-right-3 {
    margin-right: 25%;
  }
  .col-sm-offset-right-2 {
    margin-right: 16.66666667%;
  }
  .col-sm-offset-right-1 {
    margin-right: 8.33333333%;
  }
  .col-sm-offset-right-0 {
    margin-right: 0;
  }
}
@media (min-width: 992px) {
  .col-md-offset-right-12 {
    margin-right: 100%;
  }
  .col-md-offset-right-11 {
    margin-right: 91.66666667%;
  }
  .col-md-offset-right-10 {
    margin-right: 83.33333333%;
  }
  .col-md-offset-right-9 {
    margin-right: 75%;
  }
  .col-md-offset-right-8 {
    margin-right: 66.66666667%;
  }
  .col-md-offset-right-7 {
    margin-right: 58.33333333%;
  }
  .col-md-offset-right-6 {
    margin-right: 50%;
  }
  .col-md-offset-right-5 {
    margin-right: 41.66666667%;
  }
  .col-md-offset-right-4 {
    margin-right: 33.33333333%;
  }
  .col-md-offset-right-3 {
    margin-right: 25%;
  }
  .col-md-offset-right-2 {
    margin-right: 16.66666667%;
  }
  .col-md-offset-right-1 {
    margin-right: 8.33333333%;
  }
  .col-md-offset-right-0 {
    margin-right: 0;
  }
}
@media (min-width: 1200px) {
  .col-lg-offset-right-12 {
    margin-right: 100%;
  }
  .col-lg-offset-right-11 {
    margin-right: 91.66666667%;
  }
  .col-lg-offset-right-10 {
    margin-right: 83.33333333%;
  }
  .col-lg-offset-right-9 {
    margin-right: 75%;
  }
  .col-lg-offset-right-8 {
    margin-right: 66.66666667%;
  }
  .col-lg-offset-right-7 {
    margin-right: 58.33333333%;
  }
  .col-lg-offset-right-6 {
    margin-right: 50%;
  }
  .col-lg-offset-right-5 {
    margin-right: 41.66666667%;
  }
  .col-lg-offset-right-4 {
    margin-right: 33.33333333%;
  }
  .col-lg-offset-right-3 {
    margin-right: 25%;
  }
  .col-lg-offset-right-2 {
    margin-right: 16.66666667%;
  }
  .col-lg-offset-right-1 {
    margin-right: 8.33333333%;
  }
  .col-lg-offset-right-0 {
    margin-right: 0;
  }
</style>

<script >

function showTime(){
		var timeSpan = document.getElementById("time");
		var date  = new Date().toLocaleString();
		timeSpan.innerHTML = date.fontcolor("blue");
		window.setTimeout(showTime,1000);
}

function chpasswd(e,i){
	$.ajaxSetup({
		async: false
	});
	var passwd = e.value;
	//var oldpasswd=e.defaultValue;
	$.get("chmanagerByAjax?passwd="+passwd+"&user="+i,function(data,status){					
	});
}


function del(btn,i){	
	$.get("delmanagerByAjax?user="+i,function(data,status){					
	});
	var row = btn.parentNode.parentNode;
	row.parentNode.removeChild(row);
}

function inquire(e){
	var name = e.value;
	
	window.location.replace("manager.jsp?name="+name);
}

function switches(a,i){
	
	var author;
	if (a.checked) 
	{ 
		author="1";
	}else{author="0";} 
	$.get("chmanagerByAjax?author="+author+"&user="+i,function(data,status){					
	});
}

</script>

</head>

<body onLoad="showTime()">
<%
	String user=(String)session.getAttribute("user");
	String authority=(String)session.getAttribute("authority");
	int author=Integer.parseInt(authority);
	
	String name=(String)request.getParameter("name");
	if(user==null){
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	String where = name ==null?"":(" and user like '%"+name+"%'");
	Properties prop = new Properties();
	prop.setProperty("user", "root");
	prop.setProperty("password", "root");
	int i=1;
	String sql = "SELECT user,passwd,authority FROM member WHERE authority <"+author+where;
	try {			
		Class.forName("com.mysql.jdbc.Driver");		
	} catch (Exception e) {
		System.out.println(e);
	}		
%>
<div class="container-filed">
	<div class="row">
        <div class="col-xs-12">
        	<div class="col-xs-2" style="text-align:center;">
        		<img src="img/logo.png" height="60" width="150">
        	</div>
            <div class="col-xs-6">
        	</div>
            <div class="col-xs-3 hidden-xs" style="text-align:right; padding-top:15px;">
            歡迎,<span style="color:blue;font-size:13px"> <%=user%>&nbsp;&nbsp;&nbsp;<button style="margin-bottom:3px;" type="button" class="btn btn-danger" onclick="javascript:location.href='logOut'" >登出</button></span>
        	</div>
        	<div class="navbar-header">
				<button type="button" class="navbar-toggle"  style="border:2px solid rgba(48, 88, 232, 0.61);background-color:rgba(52, 140, 229, 0.25);" data-toggle="collapse"
						data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span>
					<span class="icon-bar" style="background:rgba(48, 88, 232, 0.61);"></span>
					<span class="icon-bar" style="background:rgba(48, 88, 232, 0.61);"></span>
					<span class="icon-bar" style="background:rgba(48, 88, 232, 0.61);"></span>
				</button>
			</div>
		    <div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="getData.jsp">地震查詢</a></li>
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="manager.jsp">權限管理</a></li>
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="change.jsp">修改帳密</a></li>
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="#">現在時間 : <span id="time"></span></a></li>
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="#" style="text-align:center;">歡迎,<span style="color:blue;font-size:13px;"><%=user%>&nbsp;&nbsp;&nbsp;<button style="margin-bottom:3px;" type="button" class="btn btn-danger" onclick="javascript:location.href='logOut'" >登出</button></span></a></li>
				</ul>
			</div>
        </div>
        <div class="col-xs-12 col-sm-12" style="height:100vh">	
        	<div class="list-group col-sm-2 hidden-xs">
        		<a href="getData.jsp" class="list-group-item ">地震查詢</a>
                <a href="manager.jsp" class="list-group-item ">權限管理</a>
				<a href="change.jsp" class="list-group-item ">修改帳密</a><br/><br/>	
            	<div id="gettime" style="text-align:center;">現在時間<br/><span id="time"></span></div>
        	</div>
            <div class="col-xs-12 col-sm-10" id="tablecontent" style="overflow-y:scroll; SCROLLBAR-FACE-COLOR: #c2d3fc;">
            <%
            try (
            		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/earthquake",prop);
            		PreparedStatement pstmt=conn.prepareStatement(sql);				
            		)
            	{					
            		ResultSet rs = pstmt.executeQuery();
            	%> 
            	<div class="col-xs-12" style="font-size:23px;font-weight:bold;text-align:left;">管理員管理</div>
				<div class="col-xs-12" style="font-size:15px;font-weight:bold;text-align:left;">查詢管理員名稱 : <input type="text" style="width:120px" placeholder="請輸入查詢帳號" onchange="inquire(this)" /></div>   		
				<table class="table table-bordered table-hover col-sm-12" style="font-size:8px;">					            					
				    <thead >
				      <tr>
				         <th>帳號</th>
				         <th>密碼</th>
				         <%if(author==2){%><th>權限</th><%} %>
				         <%if(author==2){%><th>刪除</th><%} %>
				      </tr>
				    </thead>
				    <tbody>
				    <%
		
					while(rs.next()) {
						System.out.println(rs.getString("user"));
				    %>
				      <tr>
				         <td><%=rs.getString("user")%></td>
				         <td><input type="text" style="width:40px" value="<%=rs.getString("passwd") %>" onchange="chpasswd(this,'<%=rs.getString("user")%>')"/></td>
				         <%if(author==2){%><td><div class="switch" data-on="primary" data-off="danger"><input type="checkbox" style="width:30px" onchange="switches(this,'<%=rs.getString("user")%>')" <% if(Integer.parseInt(rs.getString("authority"))>=1){%>checked<%}%> /></div></td><%} %>
				         <%if(author==2){%><td><button type="button" class="btn btn-danger" id="delete" onClick="del(this,'<%=rs.getString("user")%>')">刪除</button></td><%} %>
				      </tr>
					  <% 
				      }
				   }catch (Exception e){
		           		System.out.println(e);
		           }
			           %>
		           </tbody>
				</table>
				<div style="font-size:10px;font-weight:bold;text-align:center;">總共符合:<%=i-1%>筆資料</div>
        	</div>
        </div>
	</div>
</div>
</body>
</html>

