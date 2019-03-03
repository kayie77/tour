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

    <title>管理系统</title>

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

	<!-- add and edit modal -->
	<div class="modal fade" id="addOrEditDialog" tabindex="-1" role="dialog" aria-labelledby="" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			<!-- content -->
		    </div>
		</div>
	</div>
	
    <div class="container" style="background: rgba(255, 255, 255, 0.18);">

      <form class="form-signin" method="post" role="form" action="process/login" id="login_form">
        <h2 class="form-signin-heading" style="color: #495080;">旅游网站</h2>
        <label for="a_name" class="sr-only">帐号</label>
        <input type="text" id="a_name" name="a_name" class="form-control" placeholder="账号" required autofocus>
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

	  <!-- 注册新用户 -->
	 <div style="max-width: 330px;padding: 15px;margin: 0 auto">还不是本系统用户？&nbsp;&nbsp;&nbsp;<button name="newEntity" type="button" class="btn btn-default" >注册新用户</button></div>
	  
    </div> <!-- /container -->
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
    
    	if(getQueryString("error")==1){
            $(".error_message").removeClass("hide");
        }
        
	    $('button[name="newEntity"]').click(function (){
	         var url = 'view/register';
   	         showModal(url);
	    });
	});
	
  function getQueryString(name) {//获取某个url中所带的参数
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
  }

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
