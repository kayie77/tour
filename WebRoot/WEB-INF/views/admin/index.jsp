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

    <title>用户首页</title>

    <!-- Bootstrap core CSS -->
    <link href="/tour/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/tour/resources/css/dashboard.css" rel="stylesheet">
	<style type="text/css">
		 a.placeholder:hover{
		 	 border: 1px solid #ddd;
		 	 text-decoration: none;
		 }
		 .footer-container {
		 	border-top: 1px solid #d9d9d9;
		 	margin-top: 25%;
		 	width: 100%;
		 	text-align: center;
		 }
		 .logoDiv img{
		 	width:100px;
		 	height:100px;
		 }
	</style>
    <script src="/tour/resources/js/jquery.min.js" type="text/javascript"></script>

  </head>

  <body>
		   
		  <div class="row placeholders logoDiv " style="margin-right: 0px; margin-left: 0px;">
            <a class="col-xs-6 col-sm-3 placeholder" href="/tour/country/view">
              <img src="/tour/resources/images/2.jpg" class="img-responsive">
              <h4><b>国家管理</b></h4>
              <span class="text-muted">Country Management</span>
            </a>
            <a class="col-xs-6 col-sm-3 placeholder" href="/tour/province/view">
              <img src="/tour/resources/images/7.jpg" class="img-responsive" >
              <h4><b>省会管理</b></h4>
              <span class="text-muted">Province Management</span>
            </a>
            <a class="col-xs-6 col-sm-3 placeholder " href="/tour/city/view">
              <img src="/tour/resources/images/8.jpg" class="img-responsive">
              <h4><b>城市管理</b></h4>
              <span class="text-muted">City Management</span>
            </a>
            <a class="col-xs-6 col-sm-3 placeholder " href="/tour/scenicClass/view">
              <img src="/tour/resources/images/5.jpg" class="img-responsive" >
              <h4><b>景点分类管理</b></h4>
              <span class="text-muted">Scenic Category Management</span>
            </a>
          </div> 
          <div class="row logoDiv" style="margin: 10px 0px 0px 0px;text-align: center;">  
            <a class="col-xs-6 col-sm-3 placeholder" href="/tour/scenic/view">
              <img src="/tour/resources/images/1.jpg" class="img-responsive" >
              <h4><b>景点管理</b></h4>
              <span class="text-muted">Scenic Management</span>
            </a>
            <a class="col-xs-6 col-sm-3 placeholder" href="/tour/lineClass/view">
              <img src="/tour/resources/images/3.jpg" class="img-responsive" >
              <h4><b>路线分类管理</b></h4>
              <span class="text-muted">Line Category Management</span>
            </a>
            <a class="col-xs-6 col-sm-3 placeholder" href="/tour/line/view">
              <img src="/tour/resources/images/6.jpg" class="img-responsive" >
              <h4><b>路线管理</b></h4>
              <span class="text-muted">Line Management</span>
            </a>
            <a class="col-xs-6 col-sm-3 placeholder" href="/tour/user/allUserInfo">
              <img src="/tour/resources/images/4.jpg" class="img-responsive" >
              <h4><b>用户管理</b></h4>
              <span class="text-muted">User Information management</span>
            </a>
          </div>
          <div class="footer-container container-fluid">
          	<p style="margin-top: 20px;">@2016 旅游管理系统  版权所有 <a href="#">first.last@example.com</a></p>
          </div>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/tour/resources/js/jquery-1.11.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/tour/resources/js/bootstrap.min.js"></script>

  </body>
</html>
