<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,java.io.*" %>
<%@page import="tw.service.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!--設寬度為硬體寬的一倍( initial-scale=1)-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--設最大寬度為一倍,使用者不可用2指拉大(user-scalable=no)-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<link rel="shortcut icon" href="img/logo2.png">
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
.loading{ 
 background:#FC0606; /*設置進度條的顏色*/ 
 height:2px; /*設置進度條的高度*/ 
 position:fixed; /*設定進度條跟隨屏幕滾動*/ 
 top:0; /*將進度條固定在頁面頂部*/ 
 z-index:99999; /*提高進度條的優先層級，避免被其他層遮擋*/ 
} 
</style>
<script>
function showTime(){
		var timeSpan = document.getElementById("time");
		var date  = new Date().toLocaleString();
		timeSpan.innerHTML = date.fontcolor("lightblue");
		window.setTimeout(showTime,1000);
}

function inquire(){
	var timebegin = document.getElementById("timebegin").value;
	var timeend = document.getElementById("timeend").value;
	window.location.replace("getData.jsp?timebegin="+timebegin+"&timeend="+timeend);
}

$(document).ready(function(){ 
    var opt={dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
             dayNamesMin:["日","一","二","三","四","五","六"],
             monthNames:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
             monthNamesShort:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
             prevText:"上月",
             nextText:"次月",
             weekHeader:"週",
             showMonthAfterYear:true,
             dateFormat:"yy-mm-dd"
             };
    $("#timebegin").datepicker(opt);
    $("#timeend").datepicker(opt);
    });
</script>
</head>
<body onLoad="showTime()">
<div class="loading"></div>
<%
int much=1;	
	String user=(String)session.getAttribute("user");
	if(user==null){
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	String authority=(String)session.getAttribute("authority");
	int author=Integer.parseInt(authority);
	
	String timebegin=(String)request.getParameter("timebegin");
	String timeend=(String)request.getParameter("timeend");
	LinkedList<quakedata> list = null;
	if(timebegin == null || timeend==null){
		list = getearthData.timeGetData("2017/9/15","2017/9/30");
	}else if(timebegin != null && timeend!=null){		
		timebegin = timebegin.replaceAll("-","/");
		timeend = timeend.replaceAll("-","/");
		timebegin = timebegin.substring(0,5)+Integer.parseInt(timebegin.substring(5,7))+"/"+Integer.parseInt(timebegin.substring(8,10));
		timeend = timeend.substring(0,5)+Integer.parseInt(timeend.substring(5,7))+"/"+Integer.parseInt(timeend.substring(8,10));
		System.out.println(timebegin+"."+timeend);
		list = getearthData.timeGetData(timebegin,timeend);
	}
%>
<div class="container-filed">
	<div class="row">
        <div class="col-xs-12">
        	<div class="col-xs-4">
        		<img src="img/logo.png" height="50" width="120">
        	</div>
            <div class="col-xs-5">
        	</div>
            <div class="col-xs-3" style="text-align:center; padding-top:15px;">
            歡迎,<span style="color:blue;font-size:13px"> <%=user%>&nbsp;&nbsp;&nbsp;<button style="margin-bottom:3px;" type="button" class="btn btn-danger" onclick="javascript:location.href='logOut'" >登出</button></span>
        	</div>
        </div>
        <div class="col-xs-12" style="height:100vh">
        	<div class="list-group col-xs-2">
                <a href="getData.jsp" class="list-group-item ">地震查詢</a>
                <a href="manager.jsp" class="list-group-item ">權限管理</a>
				<a href="change.jsp" class="list-group-item ">修改帳密</a><br/><br/>	
            	<div id="gettime" style="text-align:center;">現在時間<br/><span id="time"></span></div>
        	</div>
        	
        	<script type="text/javascript"> 
			 $('.loading').animate({'width':'40%'},100); 
			 //第一個進度節點 
			</script> 
        	
            <div class="col-xs-10" id="tablecontent" style="overflow-y:scroll; SCROLLBAR-FACE-COLOR: #c2d3fc;">
            	<div class="col-xs-12" style="font-size:23px;font-weight:bold;text-align:left;">地震查詢</div><br/><br/>
				<div class="col-xs-12" style="font-size:15px;font-weight:bold;text-align:left;">查詢:<input id="timebegin" style="border: 1px solid rgba(100, 137, 206, 0.4);" type="text" placeholder="請輸入開始日期"/> ~ <input id="timeend" style="border: 1px solid rgba(100, 137, 206, 0.4);" type="text" placeholder="請輸入結束日期"/>
				<button style="margin-bottom:0px;" type="button" class="btn btn-info" onclick="inquire()" >查詢</button>
				</div>   		
				
				<script type="text/javascript"> 
			 $('.loading').animate({'width':'60%'},100); 
			</script> 
				
				<table class="table table-bordered table-hover" style="font-size:5px;">					            					
				    <thead >
				      <tr>
				         <th>編號</th>
				         <th>時間</th>
				         <%if(author>=1){%><th>經度</th><%} %>
				         <%if(author>=1){%><th>緯度</th><%} %>
				         <th>規模</th>
				         <th>深度</th>
				         <th>地址</th>				         
				      </tr>
				    </thead>
				    <tbody>
				    <%
				    for(int i=0;i<=list.size()-1;i++) {					
				    %>
				      <tr>			      
				         <td><%=list.get(i).getNumber()%></td>
				         <td><%=list.get(i).getDate()%></td>
				         <%if(author>=1){%><td><%=list.get(i).getLon() %></td><%} %>
				         <%if(author>=1){%><td><%=list.get(i).getLat()%></td><%} %>
				         <td><%=list.get(i).getScale()%></td>
				         <td><%=list.get(i).getDepth()%></td>
				         <td><%=list.get(i).getPosition()%></td>
				      </tr>
					  <% 
					  much++;
				      }			
			           %>
		           </tbody>
				</table>
				
				<script type="text/javascript"> 
			 $('.loading').animate({'width':'80%'},100); 
			</script>
			<div style="font-size:10px;font-weight:bold;text-align:center;">總共符合:<%=much-1%>筆資料</div>
        	</div>
        </div>
	</div>
</div>
</body>

	<script type="text/javascript"> 
						 $('.loading').animate({'width':'100%'},100); 
						 $(document).ready(function(){ 
							 $('.loading').fadeOut();  
							});
	</script> 

</html>