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
          <a class="blog-nav-item active" href="#">景点分类</a>
          <a class="blog-nav-item" href="/tour/account/index">首页</a>
          <a class="blog-nav-item" href="/tour/line/index/all">路线</a>
          <a class="blog-nav-item" href="/tour/user/view">个人主页</a>
        </nav>
      </div>
    </div>

    <div class="defaultDiv"></div>

    <nav class="navbar navbar-default container">
        <div class="container" style="margin-top: 7px;">
          <div class="navbar-header">
            <form class="form-inline" action="/tour/scenic/index/revealObject" method="get">
              <div class="form-group">
                <label for="s_country">国家</label>
                    <select class="form-control" id="s_country" style="width:150px">
                      <c:forEach items="${countryList}" var ="country">
                        <option value="${country.c_id}">${country.c_name}</option>
                      </c:forEach>
                    </select> 
                  </div>
                  <div class="form-group">
                <label for="s_province">省会</label>
                    <select class="form-control" id="s_province" style="width:150px">
                    </select> 
                  </div>
                  <div class="form-group">
                <label for="s_city">城市</label>
                    <select class="form-control" id="s_city" name="cityword" style="width:150px">
                    </select> 
                  </div>
                  <div class="form-group">
                <label for="s_city">景点分类</label>
                    <select class="form-control" id="classword" name="classword" style="width:150px">
                      <option value="">全部</option>
                      <c:forEach items="${scenicClassList}" var ="scenicClass">
                        <option value="${scenicClass.sc_id}">${scenicClass.sc_name}</option>
                      </c:forEach>
                    </select>
                  </div>
              <button type="submit" class="btn btn-default">查询</button>
            </form>
          </div>
        </div>
      </nav>

    <div class="container">
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
    
      $.ajaxSettings.async = false;
	 	ajaxSelectProvince($('#s_country').find('option:selected').attr("value"));
	 	ajaxSelectCity($('#s_province').find('option:selected').attr("value"));
	  $.ajaxSettings.async = true;
      
      $('#s_country').on('change',  function (){
		 $.ajaxSettings.async = false;
		 	ajaxSelectProvince($(this).find('option:selected').attr("value"));
		 	ajaxSelectCity( $('#s_province').find('option:selected').attr("value"));
		 $.ajaxSettings.async = true;
	   });
	   
	   $('#s_province').on('change',  function (){
		 var pId = $('#s_province').find('option:selected').attr("value");
		 ajaxSelectCity(pId);
	   });
      
    });
       function ajaxSelectProvince(cId){
    	//根据国家动态加载省会
		 $('#s_province').children().remove();
	    	$.ajax({
	        	url: '/tour/scenic/getProvinceBycountry',
	        	type: 'GET',
	        	data: {'cId':cId},
	        	dataType: 'json',
	        	success: function (data) {
	        		$.each(data, function(idx, obj) {
	        			var defaultOption ;
	        			if(obj.p_id == '${scenic.city.province.p_id}'){
	        				defaultOption = $('<option value='+ obj.p_id + ' selected>'+ obj.p_name +'</option>');
	        			}else{
	        				defaultOption = $('<option value='+ obj.p_id + '>'+ obj.p_name +'</option>');
	        			}
	        			$('#s_province').append(defaultOption);
	        		});
	        	}
	    	});
	}
	
	function ajaxSelectCity(pId){
    	//根据国家动态加载省会
		 $('#s_city').children().remove();
	    	$.ajax({
	        	url: '/tour/scenic/getCityByProvince',
	        	type: 'GET',
	        	data: {'pId':pId},
	        	dataType: 'json',
	        	success: function (data) {
	        		$.each(data, function(idx, obj) {
	        			var defaultOption ;
	        			if(obj.ct_id == '${scenic.city.ct_id}'){
	        				defaultOption = $('<option value='+ obj.ct_id + ' selected>'+ obj.ct_name +'</option>');
	        			}else{
	        				defaultOption = $('<option value='+ obj.ct_id + '>'+ obj.ct_name +'</option>');
	        			}
	        			$('#s_city').append(defaultOption);
	        		});
	        	}
	    	});
	}
    </script>
  </body>
</html>
