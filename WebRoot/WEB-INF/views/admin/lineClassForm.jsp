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
	    <h4 class="modal-title" id="myModalLabel">路线分类新增/编辑</h4>
	  </div>
	  <div class="modal-body">
	
	    <!-- 数据元 表单项 -->
	    <form id="objectForm" class="form-horizontal" method="post">
	      <div class="form-group">
	        
	        <input type="hidden" name="lc_id" value="${lineClass.lc_id}"/>
	        <label for="lc_name" class="col-sm-3 control-label"><span style="color:red;"> * </span>路线分类名称</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="lc_name" name="lc_name" value="${lineClass.lc_name}">
	        </div>
	      </div>    
	    </form>
	  </div>
	  <div class="modal-footer">
	  <div class="form-group">
	    <button type="button" class="btn btn-success btn-white btn-round" onclick="objectSubmit();"> <i class="ace-icon fa fa-floppy-o bigger-125"></i>保存</button>
	    <button type="button" class="btn btn-danger btn-white btn-round" data-dismiss="modal"><i class="ace-icon fa fa-times bigger-125"></i>关闭</button>
	  </div>
	  </div>
	</div>
	
	<script>

 	 function objectSubmit(){  
 	 	var url= null;
		if(${type}==1){//代表新增
			url = "/tour/lineClass/new";
		}else{
			url = "/tour/lineClass/edit";
		}
     	$.ajax({
		  type: "post",
		  url: url,
		  async:false,
		  data: JSON.stringify($('#objectForm').serializeObject()),
		  dataType: "json",
		  contentType:"application/json",  
		  success: function(result){
		         if(result.status){
		         	$('#objectForm').parents('.modal').modal('hide');
		         	bootbox.confirm('成功!',function (result) {
	        	    	location.reload();
	        	    });
		         }else{
		         	bootbox.alert('新增失败');	
		         }
		  }
         });
      } 
	</script>
	</body>
</html>
