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
	String nothing = (String)request.getAttribute("nothing");
%>
<link rel="shortcut icon" href="img/logo.png">
<title>找回密碼</title>
</head>
<body> 
<img src="img/logo.png" height="150" width="250" style="opacity:0.6">
<div class="container">
	<div class="row">
        
        <form class="col-sm-7 col-xs-12 col-sm-offset-3 form-horizontal" action="emailGetPasswd"  method='post' style="margin-top:17%;border-radius: 4px;border: 2px solid rgba(100, 137, 206, 0.72);background-color: rgba(100, 185, 206, 0.67);">
            <div class="fom-group">
            <label for="userName" class="col-sm-3 col-sm-offset-right-9	 control-label" style="margin-top:2px;font-size:22px;color:blue;font-weight:900;">找回密碼</label> 
            <%if(nothing!=null){%><span style="margin-top:15px;font-size:15px;color:red;font-weight:900;display:inline-block;">帳號或信箱錯誤</span><%} %>
            </div>           
            <div class="col-sm-12 col-xs-12 form-group" style="margin-top:10px;display:inline-block;">
            <label for="user" class=" col-sm-3 col-xs-3 control-label" style="color:rgba(35, 20, 235, 0.82);font-size:15px;">帳號:</label>
                <div class="col-sm-6 col-xs-5">
                    <input type="text"  name="user"  class="form-control"  placeholder="註冊的帳號" />
                </div>
                <span id="userId" class="col-sm-3 col-xs-4" style="padding-top:7px;"></span>
            </div>
            <div class="col-sm-12 col-xs-12 form-group" style="margin-top:5px;display:inline-block;">
            <label for="passwd" class="col-sm-3 col-xs-3 control-label" style="color:rgba(35, 20, 235, 0.82);font-size:15px;">信箱:</label>
                <div class="col-sm-6 col-xs-5">
                    <input type="text" name="email" class="form-control" placeholder="註冊的信箱"/>
                </div>
                <span id="passwdId" class="col-sm-3 col-xs-4" style="padding-top:7px;"></span>
            </div>        
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9 col-xs-offset-3 col-xs-9">
                    <input type="submit" class="btn btn-info" style="color:blue;font-weight: 900;" value="確認送出"/>
                    <button  type="button" class="btn btn-info" style="color:blue;font-weight: 900;" onclick="javascript:location.href='login.jsp'">回登入頁面</button>
                </div>
            </div>
        </form>	
	</div>
</div>

</body>
</html>