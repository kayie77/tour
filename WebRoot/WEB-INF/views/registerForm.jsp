<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<div class="modal-content">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	    <h4 class="modal-title" id="myModalLabel">用户注册</h4>
	  </div>
	  <div class="modal-body">
	
	    <!-- 数据元 表单项 -->
	    <form id="accountForm" class="form-horizontal" method="post">
	      <div class="form-group">
	        
	        <input type="hidden" name="a_id" value="${account.a_id}"/>
	        <label for="a_name" class="col-sm-2 control-label"><span style="color:red;"> * </span>用户名</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="a_name" name="a_name" value="${account.a_name}" required>
	        </div>
	      </div>
	      <div class="form-group">
	        <label for="password" class="col-sm-2 control-label"><span style="color:red;"> * </span>密码</label>
	        <div class="col-sm-3">
	          <input type="password" class="form-control" id="password" name="password" value="${account.password}" required>
	        </div>
	      </div>    
	    </form>
	  </div>
	  <div class="modal-footer">
	  <div class="form-group">
	    <button type="button" class="btn btn-success btn-white btn-round" onclick="accountSubmit();"> <i class="ace-icon fa fa-floppy-o bigger-125"></i>保存</button>
	    <button type="button" class="btn btn-danger btn-white btn-round" data-dismiss="modal"><i class="ace-icon fa fa-times bigger-125"></i>关闭</button>
	  </div>
	  </div>
	</div>
	
	<script>

 	 function accountSubmit(){  
     	$.ajax({
		  type: "post",
		  url: "/tour/account/register",
		  async:false,
		  data: JSON.stringify($('#accountForm').serializeObject()),
		  dataType: "json",
		  contentType:"application/json",  
		  success: function(result){
		         if(result.status){
		         	$('#accountForm').parents('.modal').modal('hide');
		         	bootbox.alert('注册成功!请重新登录');
		         }else{
		         	bootbox.alert('注册失败!用户名已存在');	
		         }
		  }
         });
      } 
	</script>

