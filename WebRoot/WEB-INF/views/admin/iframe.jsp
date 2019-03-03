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

    <title>旅游管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="/tour/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/tour/resources/css/dashboard.css" rel="stylesheet">
    <script src="/tour/resources/js/jquery.min.js" type="text/javascript"></script>
	<style>
	.navbar-inverse .navbar-brand {
		    color: #FFF;
		}
	.navbar-inverse {
		background-color: #739373;
	}
	.nav-sidebar > .active > a, .nav-sidebar > .active > a:hover,
	 .nav-sidebar > .active > a:focus{
	    background-color: #3f799e;
	}
	.navbar-inverse .navbar-nav>li>a{
		color: #DFF0D8;
	}
	</style>
  </head>
  <body>

	<c:if test="${currUser == null}"><%response.sendRedirect("/tour/admin/login");%></c:if>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">旅游管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/tour/admin/index" target="index_iframe">首页</a></li>
            <li><a href="/tour/introduce/view" target="index_iframe">关于我们</a></li>
            <li><a href="#">帮助</a></li>
            <li><a href="/tour/admin/index?logout">退出系统</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="/tour/admin/index" target="index_iframe">地区管理</a></li>
            <li><a href="/tour/country/view" target="index_iframe">国家管理</a></li>
            <li><a href="/tour/province/view" target="index_iframe">省会管理</a></li>
            <li><a href="/tour/city/view" target="index_iframe">城市管理</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a href="/tour/admin/index" target="index_iframe">景区管理</a></li>
            <li><a href="/tour/scenicClass/view" target="index_iframe">景点分类管理</a></li>
            <li><a href="/tour/scenic/view" target="index_iframe">景点管理</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a href="/tour/admin/index" target="index_iframe">路线管理</a></li>
            <li><a href="/tour/lineClass/view" target="index_iframe">路线分类管理</a></li>
            <li><a href="/tour/line/view" target="index_iframe">路线管理</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a href="/tour/admin/index" target="index_iframe">用户与订单管理</a></li>
            <li><a href="/tour/user/allUserInfo" target="index_iframe">用户管理</a></li>
            <li><a href="/tour/order/view" target="index_iframe">订单管理</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
          <iframe width="100%" height="100%" name="index_iframe" frameborder="0" src="/tour/admin/index"></iframe>

        </div>
      </div>
    </div>
   
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/tour/resources/js/jquery-1.11.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/tour/resources/js/bootstrap.min.js"></script>

  </body>
</html>
