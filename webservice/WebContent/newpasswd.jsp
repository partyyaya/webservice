<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
	body {
		background: url("img/bg.gif");
		background-size:200% 266%;
		background-repeat:no-repeat;
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
}
</style>
<%
	String number=(String)request.getAttribute("number");
	String user=(String)request.getAttribute("user");
	System.out.println(number);
%>    
<link rel="shortcut icon" href="img/logo.png">
<title>找回密碼</title>
</head>
<body> 
<img src="img/logo.png" height="150" width="250" style="opacity:0.6">
<div class="container">
	<div class="row">
        
        <form class="col-sm-7 col-xs-12 col-sm-offset-3 form-horizontal" action="emailOK"  method='post' onsubmit="return checkAll();" style="margin-top:17%;border-radius: 4px;border: 2px solid rgba(100, 137, 206, 0.72);background-color: rgba(100, 185, 206, 0.67);">
            <input type="hidden" name="user" value="<%=user%>" />
            <div class="fom-group">
            <label for="userName" class="col-sm-3  control-label" style="margin-top:2px;font-size:22px;color:blue;font-weight:900;">重置密碼</label> 
            <span style="margin-top:15px;font-size:15px;color:red;font-weight:900;display:inline-block;">請至信箱查收驗證碼信</span>
            </div>           
            <div class="col-sm-12 col-xs-12 form-group" style="margin-top:10px;display:inline-block;">
            <label for="user" class=" col-sm-3 col-xs-4 control-label" style="color:rgba(35, 20, 235, 0.82);font-size:15px;">驗證碼:</label>
                <div class="col-sm-6 col-xs-5">
                    <input type="text"  id="number"  class="form-control"  placeholder="驗證碼" onblur="checknumber()"/>
                </div>
                <span id="numberId" class="col-sm-3 col-xs-3" style="padding-top:7px;"></span>
            </div>
            <div class="col-sm-12 col-xs-12 form-group" style="margin-top:10px;display:inline-block;">
            <label for="user" class=" col-sm-3 col-xs-4 control-label" style="color:rgba(35, 20, 235, 0.82);font-size:15px;">密碼:</label>
                <div class="col-sm-6 col-xs-5">
                    <input type="password"  name="passwd" id="passwd"  class="form-control"  placeholder="新密碼" onblur="checkPass()"/>
                </div>
                <span id="passwdId" class="col-sm-3 col-xs-3" style="padding-top:7px;"></span>
            </div>
            <div class="col-sm-12 col-xs-12 form-group" style="margin-top:10px;display:inline-block;">
            <label for="user" class=" col-sm-3 col-xs-4 control-label" style="color:rgba(35, 20, 235, 0.82);font-size:15px;">確認密碼:</label>
                <div class="col-sm-6 col-xs-5">
                    <input type="password" id="ckpasswd"  class="form-control"  placeholder="確認新密碼" onblur="doubleCheck()"/>
                </div>
                <span id="ckId" class="col-sm-3 col-xs-3" style="padding-top:7px;"></span>
            </div>      
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9 col-xs-offset-4 col-xs-8">
                    <input type="submit" class="btn btn-info" style="color:blue;font-weight: 900;" value="確認更改"/>
                    <button  type="button" class="btn btn-info" style="color:blue;font-weight: 900;" onclick="javascript:location.href='login.jsp'">回登入頁面</button>
                </div>
            </div>
        </form>	
	</div>
</div>

</body>
<script type="text/javascript">
function checknumber(){
	var inputNode = document.getElementById("number");
	var spanNode = document.getElementById("numberId");	
	var content  = inputNode.value;	
	if(content=='<%=number%>'){
		//符合规则
		spanNode.innerHTML = "✔ ok".fontcolor("green");
		
		return true;
	}else{
		//不符合规则
		spanNode.innerHTML ="輸入錯誤".fontcolor("red");		
		return false;
	}	
}
function checkPass(){
	var inputNode = document.getElementById("passwd");
	var spanNode = document.getElementById("passwdId");	
	var content  = inputNode.value;
	var reg =/^[a-z0-9]{1,20}$/i;	
	if(reg.test(content)){
		//符合规则
		spanNode.innerHTML = "✔ ok".fontcolor("green");
		
		return true;
	}else{
		//不符合规则
		spanNode.innerHTML ="格式錯誤".fontcolor("red");		
		return false;
	}	
}
function doubleCheck(){
	var passwd = document.getElementById("passwd").value;
	var ckpasswd = document.getElementById("ckpasswd").value;
	var spanNode = document.getElementById("ckId");
	if(passwd == ckpasswd){
		//符合规则
		spanNode.innerHTML = "✔ ok".fontcolor("green");
		return true;
	}else{
		//不符合规则
		spanNode.innerHTML = "請再確認".fontcolor("red");		
		return false;
	}
}
function checkAll(){
	var nmber = checknumber();
	var passwd = checkPass();
	var ck = doubleCheck();
	if(nmber && passwd && ck){
		return true;
	}	
		return false;
}
</script>
</html>