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

    <title>Signin Template for Bootstrap</title>
    <!-- Bootstrap core CSS -->
    <link href="/tour/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/tour/resources/css/dashboard.css" rel="stylesheet">
    <link href="/tour/resources/css/blog.css" rel="stylesheet">
    <link href="/tour/resources/css/scenic.css" rel="stylesheet">
    <link href="/tour/resources/css/carousel.css" rel="stylesheet">
    <script src="/tour/resources/js/jquery.min.js" type="text/javascript"></script>
  </head>

  <body>

    <!-- add and edit modal -->
    <div class="modal fade" id="addOrEditDialog" tabindex="-1" role="dialog" aria-labelledby="农产品分类编辑" data-backdrop="static">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <!-- content -->
        </div>
      </div>
    </div>
    
    <c:if test="${currUser == null}"><%response.sendRedirect("/tour/account/login");%></c:if>
    <div class="blog-masthead">
      <div class="container">
        <nav class="blog-nav">
          <a class="blog-nav-item active" href="#">个人信息</a>
          <a class="blog-nav-item" href="/tour/account/index">首页</a>
          <a class="blog-nav-item" href="/tour/scenic/index/all">景点</a>
          <a class="blog-nav-item" href="/tour/line/index/all">路线</a>
        </nav>
      </div>
    </div>
    
    <div class="container">
    <h2 class="page-header">个人主页</h2>
 	<div class="panel panel-info">
      <div class="panel-heading" style="height: 50px;">
        <h3 class="panel-title" style="float:left">个人资料 </h3>
        <div style="float:right">
 			<button type="button" name="edit" class="btn btn-default">编辑</button>
 			<button type="button" name="editPassword" class="btn btn-default">修改密码</button>
 		</div>
      </div>
      <div class="panel-body">
	     <div class="media" >
			<div class="media-left">
				<a href="#">
				    <img class="media-object img-circle" src="/tour/resources/images/avatar-mid-img.png" alt="...">
				</a>
			</div>
			<div class="media-body">
				 <p><h4 class="media-heading"><b>${user.u_name}</b></h4></p>
				 <p>联系电话：<span class="text-muted">${user.telephone}</span></p> 
				 <p>email：<span class="text-muted">${user.email}</span></p>
				 <p>收货地址：<span class="text-muted">${user.address}</span></p>
			</div>
	     </div>
      </div>
    </div>
    
    <h2 class="page-header">订单管理</h2>
    <div class="panel panel-success">
      <div class="panel-heading" style="height: 50px;">
        <h3 class="panel-title" style="float:left">景点订单</h3>
        <div style="float:right">
 			<button type="button" name="delScenicOrder" class="btn btn-default">删除</button>
 		</div>
      </div>
      <div class="panel-body" style="padding: 20px;">
      	<c:forEach var="scenic" items="${scenicList}">
	      <a href="/tour/scenic/index/view/${scenic.s_id }"><div class="row featurette thumbnail">
	        <div class="col-md-8 col-md-push-4">
	          <h4 >${scenic.s_name }<div class="text-muted-bg">&nbsp;¥ ${scenic.price}</div></h4>
	          <span class="text-address">地址：${scenic.address }</span>
	          <p >描述：${scenic.description}</p>
	          <p class="gty-icon">${scenic.city.province.country.c_name} 
	          	${scenic.city.province.p_name} ${scenic.city.ct_name}</p>
	          <p class="ctg-icon">${scenic.scenicClass.sc_name}</p>
	        </div>
	        <div class="col-md-4 col-md-pull-8">
	          <img class="featurette-image img-responsive" src="${scenic.imageUrl}" alt="Generic placeholder image">
	        </div>
	       </div>
	      </a>  
	    </c:forEach>
      </div>
    </div>
    
    <div class="panel panel-success">
      <div class="panel-heading" style="height: 50px;">
        <h3 class="panel-title" style="float:left">路线订单</h3>
        <div style="float:right">
 			<button type="button" name="delLineOrder" class="btn btn-default">删除</button>
 		</div>
      </div>
      <div class="panel-body" style="padding: 20px;">
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
      </div>
    </div>

       


    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/tour/resources/js/jquery-1.11.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/tour/resources/js/bootstrap.min.js"></script>
    <script src="/tour/resources/js/validation/jquery.validate.min.js"></script>
    <script src="/tour/resources/js/validation/localization/messages_zh.min.js"></script>
    <script src="/tour/resources/js/jquery.serialize-object.min.js"></script>
    <script src="/tour/resources/js/jquery.form.js"></script>
    <script src="/tour/resources/js/bootbox/bootbox.min.js"></script> 
    
    <script>
    $(document).ready(function () {
	    $('button[name="edit"]').click(function (){
	         var url = '/tour/user/view/edit';
   	         showModal(url);
	    });
	    
	    $('button[name="editPassword"]').click(function (){
	         var url = '/tour/account/view/password';
   	         showModal(url);
	    });
    });
    
     function showModal(url, callback){
        $.get(url, function (data){
          var modal = $('#addOrEditDialog');
          var modal_content =  modal.find('.modal-content');
          modal_content.html(data);
          if(callback){
          	callback();
          }
          modal.modal('show');
        });
      }
    </script>

  </body>
</html>
