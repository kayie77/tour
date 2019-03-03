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
		    
 			<h3 class="page-header">路线管理
 			<small style="float:right">
 				<button type="button" name="newEntity" class="btn btn-success btn-sm">新增</button>
 				<button type="button" name="delEntity" class="btn btn-danger btn-sm">删除</button>
 			</small></h3>
  			<div class="table-responsive col-sm-12">
  			<form class="form-inline" action="/tour/line/revealObject" method="get">
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
            <table class="table table-striped ">
              <thead>
                <tr>
                  <th><input type="checkbox" id="row_all_selector">id号</th>
                  <th>路线分类</th>
                  <th>路线名称</th>
                  <th>价格</th>
                  <th>编辑</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="line" items="${lineList}">
		       <tr id="${line.l_id}">
		       <td><input type="checkbox" class="js-row_selector">${line.l_id }</td>
		       <td>${line.lineClass.lc_name}</td>
		       <td>${line.l_name }</td>
		       <td>${line.price }</td>
			   <td>
		          <button name="editEntity" type="button" class="btn btn-primary btn-sm">
  					  <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
				  </button>
		       </td>
		       </tr>
		      </c:forEach>
              </tbody>
            </table>
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
	    $('button[name="newEntity"]').click(function (){
	         var url = '/tour/line/view/new';
   	         showModal(url);
	    });
	    
	    $('button[name="editEntity"]').click(function (){
	    	var id = $(this).parents('tr').attr('id');
	         var url = '/tour/line/view/edit?id='+id;
   	         showModal(url);
	    });
	    
	    //action del
        $('button[name="delEntity"]').click(function (){
          var ids = getSelectedRowsId();
          if (!ids || ids.length <= 0) {
            bootbox.alert("请选择操作的目标!");
          }else{
            bootbox.confirm('此操作将会级联删除其关联的所有数据，确定要删除吗?',function(result){
              if(result) { 
                params = ids.map(function (index,id){
                  return 'id='+id;
                }).toArray().join('&');

                var url = '/tour/line/del?' + params;
                $.post(url, function (result){
                  if(result.status){
                    bootbox.confirm('删除成功!',function (result) {
	        	    	location.reload();
	        	    });
                  }else{
                    location.reload();
                  }
                }); 
              }
            });
          }
        });
        
      // row all selectos init
      $('#row_all_selector').click(function (){
        if($(this).prop('checked')){
          getRowSelectors().prop('checked',true);
        }else{
          getRowSelectors().prop('checked',false);
        }
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
            
      function getRowSelectors(node){
          return $('.js-row_selector');
      }
      
      function getSelectedRowsId(node){
          return $('.js-row_selector:checked').parents('tr').map(function(){
            return $(this).prop('id');
          });
        }
    </script>
  </body>
</html>
