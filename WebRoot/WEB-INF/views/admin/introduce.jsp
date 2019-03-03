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

    <title></title>

    <!-- Bootstrap core CSS -->
    <link href="/tour/resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="/tour/resources/js/jquery.min.js" type="text/javascript"></script>

  </head>

  <body>
 
      		<!-- add and edit modal -->
		    <div class="modal fade" id="addOrEditDialog" tabindex="-1" role="dialog" aria-labelledby="分类编辑" data-backdrop="static">
		      <div class="modal-dialog" role="document">
		        <div class="modal-content">
		          <!-- content -->
		        </div>
		      </div>
		    </div>
		    
 			<h3 class="page-header">关于我们
 			<small style="float:right">
 				<button type="button" name="editEntity" class="btn btn-success btn-sm">编辑</button>
 			</small></h3>
  			<div class="table-responsive col-sm-12">
  				<div class="panel panel-success">
  				  <div class="panel-heading" ></div>
  				  <div class="panel-body" id="describe_content" data-id="${introduce.id}">${introduce.message}</div>
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
	    
	    $('button[name="editEntity"]').click(function (){
	    	var id = $('#describe_content').data('id');
	         var url = '/tour/introduce/view/edit?id='+id;
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
