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

    <title>Blog Template for Bootstrap</title>
    <link href="/tour/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/tour/resources/css/blog.css" rel="stylesheet">
    <link href="/tour/resources/css/scenic.css" rel="stylesheet">
  </head>

  <body>

    <div class="blog-masthead">
      <div class="container">
        <nav class="blog-nav">
          <a class="blog-nav-item active" href="#">景点</a>
          <a class="blog-nav-item" href="/tour/account/index">首页</a>
          <a class="blog-nav-item" href="/tour/line/index/all">路线</a>
          <a class="blog-nav-item" href="/tour/user/view">个人主页</a>
        </nav>
      </div>
    </div>

    <div class="container">

      <div class="blog-header">
      </div>

      <div class="row">

        <div class="col-sm-8 blog-main">

          <div class="blog-post">
            <!-- main_top -->
            <div class="main_top">
              <div class="top_left pull-left "><img class="img-thumbnail" src="${scenic.imageUrl }" ></div>
              <div class="top_right">
                <h2><b>${scenic.s_name }</b></h2>
                <address>地址：${scenic.address}</address>
                <span class="price">价格： ¥ ${scenic.price }</span>
              </div>
            </div>

            <div class="detail-sub-title"><i></i>景点介绍</div>
            <div class="contract_main">
              ${scenic.description}
            </div>

            <div class="detail-sub-title"><i></i>出行须知</div>
            <div class="contract_travel">
              · 交　　通： 
              合同一经签订且付全款，团队机票、列车票、船票即为出票，不得更改、签转、退票。</br>
              · 游　　览：
              景点游览、自由活动、购物店停留的时间以当天实际游览为准。</br>
              · 购　　物： 
              当地购物时请慎重考虑，把握好质量与价格，务必索要发票。</br>
              · 差价说明：
              如遇国家政策性调整门票、交通价格等，按调整后的实际价格结算。</br>
              · 出团通知：
              出团通知最晚于出团前1天发送，若能提前确定，我们将会第一时间通知您。</br>
              · 意见反馈：
              请配合导游如实填写当地的意见单，不填或虚填者归来后投诉将无法受理。</br>
              · 活动说明： 
              *如您被法院列入全国失信被执行人名单，您可能无法正常出游，您可于报名前自行核实，避免不必要损失。</br>
            </div>

            <div class="detail-sub-title"><i></i>安全提示</div>
            <div class="contract_security">
              为普及旅游安全知识及旅游文明公约，使您的旅程顺利圆满完成，特拟定安全须知和文明公约： 《安全须知》 《文明公约》。
            </div>

            <div class="imgPanel">
              <img class="" src="${scenic.bgUrl }" alt="Generic placeholder image" >
            </div>
            <div class="commit">
              <button class="btn btn-success" style="width:200px;" onClick="ajaxSubmit(${scenic.s_id});">立即预订</button>
            </div>
            
          </div><!-- /.blog-post -->

        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
          <div class="sidebar-module sidebar-module-inset">
            <h4><b>说明</b></h4>
            <p>入住方式：到酒店前台报名字+手机号码，凭有效身份证件办理入住手续,取票方式：游客中心联系工作人员取票即可，具体以出团通知为准</p>
          </div>
          <div class="sidebar-module">
            <h4><b>推荐项目</b></h4>
            <ol class="list-unstyled">
              <li><a href="#">March 2014</a></li>
              <li><a href="#">February 2014</a></li>
              <li><a href="#">January 2014</a></li>
              <li><a href="#">December 2013</a></li>
              <li><a href="#">November 2013</a></li>
              <li><a href="#">October 2013</a></li>
              <li><a href="#">September 2013</a></li>
              <li><a href="#">August 2013</a></li>
              <li><a href="#">July 2013</a></li>
              <li><a href="#">June 2013</a></li>
              <li><a href="#">May 2013</a></li>
              <li><a href="#">April 2013</a></li>
            </ol>
          </div>
          <div class="sidebar-module">
            <h4>Elsewhere</h4>
            <ol class="list-unstyled">
              <li><a href="#">GitHub</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="#">Facebook</a></li>
            </ol>
          </div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->

    </div><!-- /.container -->

    <div class="footer">
      <div class="footer-container">
        <p class="fl">© 2015-2016 旅游管理系统 All Rights Reserved</p>
      </div>  
    </div>

    <script src="/tour/resources/js/jquery-1.11.2.min.js"></script>
    <script src="/tour/resources/js/bootstrap.min.js"></script>
    <script src="/tour/resources/js/bootbox/bootbox.min.js"></script> 
    <script type="text/javascript">
     function ajaxSubmit(spot){
	    	$.ajax({
	        	url: '/tour/order/new',
	        	type: 'GET',
	        	data: {'spot':spot,'type':1},
	        	dataType: 'json',
	        	success: function(result){
		         if(result.status){
			       bootbox.confirm("预定成功！点击确认查看全部订单", function (result) {  
	                if(result) {  
	                    window.location.href="http://localhost:8080/tour/user/view";
	                }
	               });
		         }else{
		         	bootbox.alert('预定失败！');	
		         }
		  		}
	    	});
	}
    </script>
  </body>
</html>
