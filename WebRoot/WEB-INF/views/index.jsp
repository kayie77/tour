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

    <title>旅游网站</title>

    <link href="/tour/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/tour/resources/css/carousel.css" rel="stylesheet">
    <link href="/tour/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="/tour/resources/css/index-common.css" rel="stylesheet">
    <script src="/tour/resources/js/jquery.min.js" type="text/javascript"></script>
    <style type="text/css">
    .btn-primary{
	    color: #fff;
	    background-color: #4F7DF5;
	    border-color: #4F7DF5;
	    box-shadow: 0px 7px 30px -12px rgba(0, 0, 0, 0.5);
    }
    </style>
  </head>

  <body>
  
<%--     <c:if test="${currUser == null}"><%response.sendRedirect("/tour/account/login");%></c:if> --%>

	<!-- Modal -->
	<div class="modal fade" id="aboutModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"><b>关于我们</b></h4>
	      </div>
	      <div class="modal-body">
	        ${introduce.message }
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    <!-- Carousel ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="/tour/resources/images/bg2.jpg"  alt="First slide">
          <div class="container">
          	<c:if test="${currUser == null }">
            <div class="loginDiv"><a class="btn btn-primary" name="loginEntity" href="javascript:void(0);" role="button"><span class="glyphicon glyphicon-user"></span> 用户登录</a></div>
            <div class="aboutDiv"><a class="btn btn-primary" data-toggle="modal" data-target="#aboutModal" ><span class="glyphicon glyphicon-leaf"></span> 关于我们</a></div>
            </c:if>
            <c:if test="${currUser != null }">
              <div class="btn-group loginDiv">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                 	个人主页 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="/tour/user/view">${currUser.a_name}</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a href="/tour/account/index?logout">退出登录</a></li>
                </ul>
              </div>
            </c:if>
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="/tour/resources/images/bg1.jpg" alt="Second slide">
          <div class="container">
          	<c:if test="${currUser == null }">
            <div class="loginDiv"><a class="btn btn-primary" name="loginEntity" href="javascript:void(0);" role="button"><span class="glyphicon glyphicon-user"></span> 用户登录</a></div>
             <div class="aboutDiv"><a class="btn btn-primary" data-toggle="modal" data-target="#aboutModal" ><span class="glyphicon glyphicon-leaf"></span> 关于我们</a></div>
            </c:if>
            <c:if test="${currUser != null }">
              <div class="btn-group loginDiv">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  个人主页 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="/tour/user/view">${currUser.a_name}</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a href="/tour/account/index?logout">退出登录</a></li>
                </ul>
              </div>
            </c:if>
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="/tour/resources/images/bg3.jpg" alt="Second slide">        
          <div class="container">
          	<c:if test="${currUser == null }">
            <div class="loginDiv"><a class="btn btn-primary" name="loginEntity" href="javascript:void(0);" role="button"><span class="glyphicon glyphicon-user"></span> 用户登录</a></div>
             <div class="aboutDiv"><a class="btn btn-primary" data-toggle="modal" data-target="#aboutModal" ><span class="glyphicon glyphicon-leaf"></span> 关于我们</a></div>
            </c:if>
            <c:if test="${currUser != null }">
              <div class="btn-group loginDiv">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  个人主页 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="/tour/user/view">${currUser.a_name}</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a href="/tour/account/index?logout">退出登录</a></li>
                </ul>
              </div>
            </c:if>
            <div class="carousel-caption">
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="/tour/resources/images/bg4.jpg" alt="Second slide">
          <div class="container">
          	<c:if test="${currUser == null }">
            <div class="loginDiv"><a class="btn btn-primary" name="loginEntity" href="javascript:void(0);" role="button"><span class="glyphicon glyphicon-user"></span> 用户登录</a></div>
             <div class="aboutDiv"><a class="btn btn-primary" data-toggle="modal" data-target="#aboutModal" ><span class="glyphicon glyphicon-leaf"></span> 关于我们</a></div>
            </c:if>
            <c:if test="${currUser != null }">
              <div class="btn-group loginDiv">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  个人主页 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="/tour/user/view">${currUser.a_name}</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a href="/tour/account/index?logout">退出登录</a></li>
                </ul>
              </div>
            </c:if>
            <div class="carousel-caption">
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->

    <div class="">
     <!--  marketing -->
      <!-- Three columns of text below the carousel -->
      <div class="row tipPlanel">
        <div class="col-md-2 blue"><a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">出境长线</a></div>
        <div class="col-md-2 purple"><a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">国外跟团</a></div>
        <div class="col-md-2 green"><a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">国内跟团</a></div>
        <div class="col-md-2 red"><a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">邮轮精选</a></div>
        <div class="col-md-2 orange"><a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">特惠胜地</a></div>
        <div class="col-md-2 black"><a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">周边自驾</a></div>
      </div>
      <div>
        <div class="collapse" id="collapseExample">
          <div class="well">
   			<a href="http://localhost:8080/tour/scenic/index/all" type="button" class="btn btn-default"><span class="glyphicon glyphicon-star" ></span> 全部景点</a>
   			<a href="http://localhost:8080/tour/line/index/all" type="button" class="btn btn-default"><span class="glyphicon glyphicon-globe"></span> 全部路线</a>
   			 All spots and routes
          </div>
        </div>
      </div>
    </div>
  
    <div class="container">

      <div class="index_search_pic">
        <img src="/tour/resources/images/index_search_pic.jpg">
        <h2>立即搜索精彩的旅游景点</h2>
        <p><a type="button" id="searchBtn" class="btn btn-default" href="http://localhost:8080/tour/scenic/index/all">搜&nbsp;索</a></p>
      </div>

      <!--景点分类  -->
      <div class="layer_header clearfix">
        <h2>景点分类</h2>
        <ul class="tabs">
        	  <c:forEach items="${scenicClassList}" var ="scenicClass">
        	  	<li class="" ><a name="scenicType" data-value="${scenicClass.sc_id}" href="javascript:void(0)">${scenicClass.sc_name }</a></li>
	          </c:forEach>
        </ul>
        <div class="more">
          <a href="/tour/scenic/index/all" >更多产品 &gt;&gt;</a>
        </div>
      </div>

      <div class="row" id="scenic_main_container">
      </div>

      <div class="blankDiv"></div>

      <!--路线分类  -->
      <div class="layer_header clearfix">
        <h2>路线分类</h2>
        <ul class="tabs">
              <c:forEach items="${lineClassList}" var ="lineClass">
        	  	<li class="" ><a name="lineType" data-value="${lineClass.lc_id}" href="javascript:void(0)">${lineClass.lc_name }</a></li>
	          </c:forEach>
        </ul>
        <div class="more">
          <a href="/tour/line/index/all" onclick="">更多产品 &gt;&gt;</a>
        </div>
      </div>

      <div class="row" id="line_main_container">
      </div>

      <div class="div_tit2"><h2 class="wite">旅行</h2></div>
      <div class="submarry-text-chinese">开心的时候徒步漫游，行山涉水，
     			足迹所到之处各种各样的鲜花竞相开放</br>献上动人的微笑,一路走来，一路花开，
    			 不开心的时候坐坐火车</br>看着车窗外的事物飞快的转换，出现，然后消失，渐行渐远，那么</br>
     			不管忧伤还是满心的倦怠，都可以放下</br>只剩下未来行程的期待
       </div>
       
<!--        <div class="submarry-text">
		   <h1>Trip</h1>
		   <p>Happy when walking roaming, hiking wading,footprint wherever a variety of flowers bloom</br>
		   offer beautiful smile,along the way, a road flower</br> not happy when sit train</br>
		   look out of the window at the things quickly,appear and then disappear, the line gradually gradually far</br>
		   then no matter sad or full of burnout, everything can be put down</br> only look forward to the next trip.</p>
	   </div>  -->
     
    </div>

<!-- 	<div class="container-fluid"></div> -->
	<div class="footer">
      <div class="footer-container">
        <p class="fl">© 2015-2016 旅游管理系统 All Rights Reserved</p>
      </div>
    </div>

    <script type="text/javascript">
    
	    $(document).ready(function () {
			ajaxSelectScenic($('a[name="scenicType"]').data('value'));
			ajaxSelectLine( $('a[name="lineType"]').data('value'));
			$('a[name="scenicType"]').eq(0).parent().addClass("active_red");
			$('a[name="lineType"]').eq(0).parent().addClass("active_blue");
	    	
	    	$('a[name="loginEntity"]').click(function (){
	         var url = '/tour/account/login';
   	         window.open(url,'_self');
	    	});
	    });
    
    	$('a[name="scenicType"]').on('click',function (){
	         var ctgId = $(this).data('value');
	         ajaxSelectScenic(ctgId);
	         $(this).parent().addClass("active_red");
	         $(this).parent().siblings().removeClass("active_red");
	    });
	    
	    $('a[name="lineType"]').click(function (){
	         var ctgId = $(this).data('value');
	         ajaxSelectLine(ctgId);
	         $(this).parent().addClass("active_blue");
	         $(this).parent().siblings().removeClass("active_blue");
	    });
    	
    	function ajaxSelectScenic(ctgId){

		 $('#scenic_main_container').children().remove();
	    	$.ajax({
	        	url: '/tour/scenic/getObjectByCtg/' + ctgId,
	        	type: 'GET',
	        	data: '',
	        	dataType: 'json',
	        	success: function (data) {
	        		$.each(data, function(idx, obj) {
	        		   var defaultOption ;
				       defaultOption = $(' <div class="col-lg-3 pro_main">'
				         +'<a href="/tour/scenic/index/view/'+ obj.s_id +'"> <img class="img-thumbnail" src='+ obj.imageUrl +' alt="Generic placeholder image" ></a>\
				          <div class="pro_mess_bg"></div>\
				          <div class="pro_mess"><span>'+obj.s_name+'</span></div>\
				          <div class="pro_infor_bg"></div>\
				          <div class="pro_infor"><span class="price">¥ '+ obj.price +'</span></div>\
				        </div>');
	        			$('#scenic_main_container').append(defaultOption);
	        		});
	        	}
	    	});
		}
		
		function ajaxSelectLine(ctgId){

		 $('#line_main_container').children().remove();
	    	$.ajax({
	        	url: '/tour/line/getObjectByCtg/' + ctgId,
	        	type: 'GET',
	        	data: '',
	        	dataType: 'json',
	        	success: function (data) {
	        		$.each(data, function(idx, obj) {
	        		   var defaultOption ;
				       defaultOption = $(' <div class="col-lg-3 pro_main">'
				        +'<a href="/tour/line/index/view/'+ obj.l_id +'"> <img class="img-thumbnail" src='+ obj.imageUrl +' alt="Generic placeholder image" ></a>\
				          <div class="pro_mess_bg"></div>\
				          <div class="pro_mess"><span>'+obj.l_name+'</span></div>\
				          <div class="pro_infor_bg"></div>\
				          <div class="pro_infor"><span class="price">¥ '+ obj.price +'</span></div>\
				        </div>');
	        			$('#line_main_container').append(defaultOption);
	        		});
	        	}
	    	});
		}
		
    </script>  
          
    <script src="/tour/resources/js/jquery-1.11.2.min.js"></script>
    <script src="/tour/resources/js/bootstrap.min.js"></script>
    <script src="/tour/resources/js/holder.min.js"></script>
    <script src="/tour/resources/js/validation/jquery.validate.min.js"></script>
    <script src="/tour/resources/js/validation/localization/messages_zh.min.js"></script>
    <script src="/tour/resources/js/jquery.serialize-object.min.js"></script>
    <script src="/tour/resources/js/jquery.form.js"></script>
    <script src="/tour/resources/js/bootbox/bootbox.min.js"></script> 
  </body>
</html>
