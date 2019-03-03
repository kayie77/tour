<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="zh-CN">
  <head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>景点分类</title>
    <link href="/tour/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/tour/resources/css/blog.css" rel="stylesheet">
    <link href="/tour/resources/css/scenic.css" rel="stylesheet">
    <link href="/tour/resources/css/carousel.css" rel="stylesheet">
  </head>

  <body>

    <div class="blog-masthead">
      <div class="container">
        <nav class="blog-nav">
          <a class="blog-nav-item active" href="#">路线分类</a>
          <a class="blog-nav-item" href="/tour/account/index">首页</a>
          <a class="blog-nav-item" href="/tour/scenic/index/all">景点</a>
          <a class="blog-nav-item" href="/tour/user/view">个人主页</a>
        </nav>
      </div>
    </div>

    <div class="defaultDiv"></div>

    <nav class="navbar navbar-default container">
        <div class="container" style="margin-top: 7px;">
          <div class="navbar-header">
            <form class="form-inline" action="/tour/line/index/revealObject" method="get">
			  <div class="form-group">
			    <label for="classword">路线分类</label>
			  	<select class="form-control" id="classword" name="classword" style="width:100px">
			  	  <option value="">全部</option>
	           	  <c:forEach items="${lineClassList}" var ="lineClass">
	                <option value="${lineClass.lc_id}">${lineClass.lc_name}</option>
	           	  </c:forEach>
	          </select> 
	          </div>
	          <div class="form-group">
			    <label for="keyword">路线名称</label>
			    <input type="text" class="form-control" id="keyword" name="keyword" placeholder="">
			  </div>
			  <button type="submit" class="btn btn-default">查询</button>
			</form>
          </div>
        </div>
      </nav>

    <div class="container">
       <c:forEach var="line" items="${lineList}">
	      <a href="/tour/line/index/view/${line.l_id }"><div class="row featurette thumbnail">
	        <div class="col-md-8 col-md-push-4">
	          <h4 >${line.l_name }<div class="text-muted-bg">&nbsp;¥ ${line.price}</div></h4>
	          <p >描述：${line.description}</p>
	          <p class="ctg-icon">${line.lineClass.lc_name}</p>
	        </div>
	        <div class="col-md-4 col-md-pull-8">
	          <img class="featurette-image img-responsive" src="${line.imageUrl}" alt="Generic placeholder image">
	        </div>
	      </div>
	    </a>  
	   </c:forEach>
    </div><!-- /.container -->

    <div class="footer">
      <div class="footer-container">
        <p class="fl">© 2015-2016 旅游管理系统 All Rights Reserved</p>
      </div>  
    </div>

    <script src="/tour/resources/js/jquery-1.11.2.min.js"></script>
    <script src="/tour/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
      
    });
    </script>
  </body>
</html>
