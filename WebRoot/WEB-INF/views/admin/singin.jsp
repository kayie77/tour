<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="zh-CN">
  <head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>管理员登录</title>

    <!-- Bootstrap core CSS -->
    <link href="/tour/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/tour/resources/css/signin.css" rel="stylesheet">
    <style>
    	body{
    		background-image:url(/tour/resources/images/background4.jpg);
    		background-size: cover;
    	}
    </style>
    <script src="/tour/resources/js/jquery.min.js" type="text/javascript"></script>
  </head>

  <body>

    <div class="container" style="background: rgba(255, 255, 255, 0.18);">

      <form class="form-signin" method="post" role="form" action="program/login" id="login_form">
        <h2 class="form-signin-heading" style="color: #495080;">管理系统</h2>
        <h4 class="form-signin-heading" style="color: #eee;">管理员登录</h4>
        <label for="name" class="sr-only">帐号</label>
        <input type="text" id="name" name="name" class="form-control" placeholder="账号" required autofocus>
        <label for="password" class="sr-only">密码</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="密码" required>
        <a style="color:#FF9191 " class="hide error_message">用户名或者密码不正确</a>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="$('#login_form').submit();">登录</button>
      </form>

    </div> <!-- /container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/tour/resources/js/jquery-1.11.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/tour/resources/js/bootstrap.min.js"></script>
        <script>
    $(document).ready(function () {
    
        if(getQueryString("error")==1){
            $(".error_message").removeClass("hide");
        }

    });
    
  function getQueryString(name) {//获取某个url中所带的参数
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
  }

    </script>
  </body>
</html>
