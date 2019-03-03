<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
   <head>
	 <meta charset="utf-8">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
   </head>
   <body>
	<div class="modal-content">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	    <h4 class="modal-title" id="myModalLabel">个人信息编辑</h4>
	  </div>
	  <div class="modal-body">
	
	    <!-- 数据元 表单项 -->
	    <form id="userInfoForm" class="form-horizontal" modelAttribute="user" action="/tour/user/edit" method="post">
	      <div class="form-group">
	        
	        <input type="hidden" name="u_id" value="${user.u_id}"/>
	        <input type="hidden" name="account[a_id]" value="${account.a_id}">
	        <label for="u_name" class="col-sm-2 control-label"><span style="color:red;"> * </span>用户名</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control " id="u_name" name="u_name" value="${user.u_name}" readOnly="true">
	        </div>
	      </div>
	      <div class="form-group">
	        <label for="telephone" class="col-sm-2 control-label">联系电话</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="telephone" name="telephone" value="${user.telephone}" required>
	        </div>
	      </div>   
	      <div class="form-group">
	        <label for="email" class="col-sm-2 control-label">email</label>
	        <div class="col-sm-3">
	          <input type="email" class="form-control" id="email" name="email" value="${user.email}">
	        </div>
	      </div>   
	      <div class="form-group">
	        <label for="address" class="col-sm-2 control-label">收货地址</label>
	        <div class="col-sm-6">
	          <textarea rows="3" class="form-control" id="address" name="address">${user.address}</textarea>
	        </div>
	      </div>   
	    </form>
	  </div>
	  <div class="modal-footer">
	  <div class="form-group">
	    <button type="button" class="btn btn-success btn-white btn-round" onclick="userInfoSubmit();"> <i class="ace-icon fa fa-floppy-o bigger-125"></i>保存</button>
	    <button type="button" class="btn btn-danger btn-white btn-round" data-dismiss="modal"><i class="ace-icon fa fa-times bigger-125"></i>关闭</button>
	  </div>
	  </div>
	</div>
	
	<script>

 	 function userInfoSubmit(){  
	
     	$.ajax({
		  type: "post",
		  url: "/tour/user/edit",
		  async:false,
		  data: JSON.stringify($('#userInfoForm').serializeObject()),
		  dataType: "json",
		  contentType:"application/json",  
		  success: function(result){
		         if(result.status){
		         	$('#userInfoForm').parents('.modal').modal('hide');
		         	 location.reload(); 
		         }else{
		         	bootbox.alert('更新失败');	
		         }
		  }
         });
      } 
	</script>
	</body>
</html>
