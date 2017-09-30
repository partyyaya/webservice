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
.loading{ 
 background:#FC0606; /*設置進度條的顏色*/ 
 height:2px; /*設置進度條的高度*/ 
 position:fixed; /*設定進度條跟隨屏幕滾動*/ 
 top:0; /*將進度條固定在頁面頂部*/ 
 z-index:99999; /*提高進度條的優先層級，避免被其他層遮擋*/ 
 
}

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
  
 .navbar-header .navbar-toggle .icon-bar {
 
  background:black !important;
}
</style>
<script>
function showTime(){
		var timeSpan = document.getElementById("time");
		var timeSpan2 = document.getElementById("time2");
		var date  = new Date().toLocaleString();
		timeSpan.innerHTML = date.fontcolor("blue");
		timeSpan2.innerHTML = date.fontcolor("lightblue");
		window.setTimeout(showTime,1000);
}

function inquire(){
	var spanNode = document.getElementById("ckId");
	var t,s,d,lo,la,po;
	var timebegin = document.getElementById("timebegin").value;
	var timeend = document.getElementById("timeend").value;
	var date = /^(\d{4}(\/|\-)\d{1,2}(\/|\-)\d{1,2}){1}$/;	
	
	if(timebegin!="" && timeend!=""){if(date.test(timebegin) && date.test(timeend)){t="timebegin="+timebegin+"&timeend="+timeend+"&"}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}else{t="";if(timebegin=="" && timeend==""){spanNode.innerHTML ="";}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}
		
	var scalebegin = document.getElementById("scalebegin").value;
	var scaleend = document.getElementById("scaleend").value;
	var f =/^[0-9]{0,3}(\.[0-9]{0,9}){0,1}$/;
	if(scalebegin!="" && scaleend!=""){if(f.test(scalebegin) && f.test(scaleend)){s="scalebegin="+scalebegin+"&scaleend="+scaleend+"&"}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}else{s="";if(scalebegin=="" && scaleend==""){spanNode.innerHTML ="";}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}
		
	var depthbegin = document.getElementById("depthbegin").value;
	var depthend = document.getElementById("depthend").value;
	if(depthbegin!="" && depthend!=""){if(f.test(depthbegin) && f.test(depthend)){d="depthbegin="+depthbegin+"&depthend="+depthend+"&"}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}else{d="";if(depthbegin=="" && depthend==""){spanNode.innerHTML ="";}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}
	
	var lonbegin = document.getElementById("lonbegin").value;
	var lonend = document.getElementById("lonend").value;
	if(lonbegin!="" && lonend!=""){if(f.test(lonbegin) && f.test(lonend)){lo="lonbegin="+lonbegin+"&lonend="+lonend+"&"}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}else{lo="";if(lonbegin=="" && lonend==""){spanNode.innerHTML ="";}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}
	
	var latbegin = document.getElementById("latbegin").value;
	var latend = document.getElementById("latend").value;
	if(latbegin!="" && latend!=""){if(f.test(latbegin) && f.test(latend)){la="latbegin="+latbegin+"&latend="+latend+"&"}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}else{la="";if(latbegin=="" && latend==""){spanNode.innerHTML ="";}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}
	
	var position = document.getElementById("position").value;
	if(position!=""){po="position="+position+"&"}else{po="";if(position==""){spanNode.innerHTML ="";}else{spanNode.innerHTML = "✖請重新確認".fontcolor("red");return;}}
	
	var totall = t+s+d+lo+la+po;
	if(totall.slice(-1)=="&"){
		totall = totall.substring(0,(totall.length-1));
	}
	window.location.replace("getData.jsp?"+totall);
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
	String scalebegin=(String)request.getParameter("scalebegin");
	String scaleend=(String)request.getParameter("scaleend");
	String depthbegin=(String)request.getParameter("depthbegin");
	String depthend=(String)request.getParameter("depthend");
	String lonbegin=(String)request.getParameter("lonbegin");
	String lonend=(String)request.getParameter("lonend");
	String latbegin=(String)request.getParameter("latbegin");
	String latend=(String)request.getParameter("latend");
	String position=(String)request.getParameter("position");
	
	LinkedList<quakedata> list = null;
	long startTime = System.currentTimeMillis();
	if(timebegin == null || timeend==null){
		list = getearthData.timeGetData("2017-9-15","2017-9-30");
	}else if(timebegin != null && timeend!=null){		
		list = getearthData.timeGetData(timebegin,timeend);
	}	
	if(scalebegin != null && scaleend!=null || depthbegin != null && depthend!=null || lonbegin != null && lonend!=null || latbegin != null && latend!=null || position != null){
		if(timebegin == null && timeend==null){list = getearthData.timeGetData("1995-1-1","2017-9-30");}
		if(scalebegin != null && scaleend!=null){list = getearthData.scaleGetData(scalebegin,scaleend,list);}
		if(depthbegin != null && depthend!=null){list = getearthData.depthGetData(depthbegin,depthend,list);}
		if(lonbegin != null && lonend!=null){list = getearthData.lonGetData(lonbegin,lonend,list);}
		if(latbegin != null && latend!=null){list = getearthData.latGetData(latbegin,latend,list);}
		if(position != null){list = getearthData.positionGetData(position,list);}
	}
	float totTime = (float)(System.currentTimeMillis()-startTime)/1000;
	
%>
<div class="container-filed">
	<div class="row">
        <div class="col-xs-12">
        	<div class="col-xs-2" style="text-align:center;">
        		<img src="img/logo.png" height="60" width="150">
        	</div>
            <div class="col-xs-6">
        	</div>
            <div class="col-sm-3 hidden-xs" style="text-align:right; padding-top:15px;">
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
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="getData.jsp" style="text-align:center;">地震查詢</a></li>
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="manager.jsp" style="text-align:center;">權限管理</a></li>
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="change.jsp" style="text-align:center;">修改帳密</a></li>
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="#" style="text-align:center;">現在時間 : <span id="time"></span></a></li>
					<li class="active hidden-sm hidden-lg" style="background-color:rgba(52, 140, 229, 0.1);"><a href="#" style="text-align:center;">歡迎,<span style="color:blue;font-size:13px;"><%=user%>&nbsp;&nbsp;&nbsp;<button style="margin-bottom:3px;" type="button" class="btn btn-danger" onclick="javascript:location.href='logOut'" >登出</button></span></a></li>
				</ul>
			</div>
        </div>
        
        <div class="col-xs-12 col-sm-12" style="height:100vh">
        	<div class="list-group col-sm-2 hidden-xs">
                <a href="getData.jsp" class="list-group-item ">地震查詢</a>
                <a href="manager.jsp" class="list-group-item ">權限管理</a>
				<a href="change.jsp" class="list-group-item ">修改帳密</a><br/><br/>	
            	<div id="gettime" style="text-align:center;">現在時間<br/><span id="time2"></span></div>
        	</div>
        	
        	<script type="text/javascript"> 
			 $('.loading').animate({'width':'40%'},100); 
			 //第一個進度節點 
			</script> 
        	
            <div class="col-xs-12 col-sm-10" id="tablecontent" style="overflow-y:scroll; SCROLLBAR-FACE-COLOR: #c2d3fc;">
            	<div class="col-xs-12" style="font-size:23px;font-weight:bold;text-align:left;">地震查詢
            	<button style="margin-bottom:0px;" type="button" class="btn btn-info" onclick="inquire()" >查詢 </button>           	            	
            	<span id="ckId"></span>
            	</div><br/><br/>            
				<div class="col-xs-12" style="font-size:15px;font-weight:bold;text-align:left;margin-bottom:3px;display:inline-block;">
					<input id="timebegin" style="border: 1px solid rgba(100, 137, 206, 0.4); width:120px;" type="text" placeholder="開始日期"/> ~ 
					<input id="timeend" style="border: 1px solid rgba(100, 137, 206, 0.4);width:120px;" type="text" placeholder="結束日期" />
					<input id="scalebegin" style="border: 1px solid rgba(100, 137, 206, 0.4);width:120px;" type="text" placeholder="規模(小)"/> ~ 
					<input id="scaleend" style="border: 1px solid rgba(100, 137, 206, 0.4);width:120px;" type="text" placeholder="規模(大)"/>
					<input id="depthbegin" style="border: 1px solid rgba(100, 137, 206, 0.4);width:120px;" type="text" placeholder="深度(小)"/> ~ 
					<input id="depthend" style="border: 1px solid rgba(100, 137, 206, 0.4);width:120px;" type="text" placeholder="深度(大)"/>
					<%if(author>=1){%><br/><input id="lonbegin" style="border: 1px solid rgba(100, 137, 206, 0.4);width:120px;" type="text" placeholder="經度(小)"/> ~ 
					<input id="lonend" style="border: 1px solid rgba(100, 137, 206, 0.4);width:120px;" type="text" placeholder="經度(大)"/>
					<input id="latbegin" style="border: 1px solid rgba(100, 137, 206, 0.4);width:120px;" type="text" placeholder="緯度(小)"/> ~ 
					<input id="latend" style="border: 1px solid rgba(100, 137, 206, 0.4);width:120px;" type="text" placeholder="緯度(大)"/><%} %>
					<input id="position" style="border: 1px solid rgba(100, 137, 206, 0.4);width:260px;" type="text" placeholder="位置"/>
					<div class="hidden-lg">查詢所花時間 : <%=totTime%>秒 </div>
					<span class="hidden-xs">查詢所花時間 : <%=totTime%>秒</span>					
				</div>   		
				<script type="text/javascript"> 
			 $('.loading').animate({'width':'60%'},100); 
			</script> 
				
				<table class="table table-bordered table-hover" style="font-size:8px;">					            					
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