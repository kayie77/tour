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
	    <h4 class="modal-title" id="myModalLabel">用户信息编辑</h4>
	  </div>
	  <div class="modal-body">
	
	    <!-- 数据元 表单项 -->
	    <form id="userInfoForm" class="form-horizontal"  method="post">
	      <div class="form-group">
	        
	          <input type="hidden" name="u_id" value="${user.u_id}"/>
	        
	        <input type="hidden" name="account[a_id]" value="${aId}">
	        <label for="u_name" class="col-sm-2 control-label"><span style="color:red;"> * </span>名字</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="u_name" name="u_name" value="${user.u_name}">
	        </div>
	      </div>
	      <div class="form-group">
	        <label for="shool" class="col-sm-2 control-label">学校</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="shool" name="shool" value="${user.shool}">
	        </div>
	      </div>   
	      <div class="form-group">
	        <label for="major" class="col-sm-2 control-label">专业</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="major" name="major" value="${user.major}">
	        </div>
	      </div>   
	      <div class="form-group">
	        <label for="className" class="col-sm-2 control-label">班级</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="className" name="className" value="${user.className}">
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
		         	 bootbox.confirm('更新成功!',function (result) {
	        	    	location.reload();
	        	    });
		         }else{
		         	bootbox.alert('更新失败');	
		         }
		  }
         });
      } 
	</script>
	</body>
</html>
