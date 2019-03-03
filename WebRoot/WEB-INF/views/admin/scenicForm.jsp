<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="modal-content">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	    <h4 class="modal-title" id="myModalLabel">景点新增/编辑</h4>
	  </div>
	  <div class="modal-body">
	
	    <!-- 数据元 表单项 -->
	    <form id="objectForm" class="form-horizontal" method="post">
	      <div class="form-group">
	        <input type="hidden" name="s_id" value="${scenic.s_id}"/>
	        
	        <label for="" class="col-sm-2 control-label"><span style="color:red;"> * </span>国家分类</label>
	        <div class="col-sm-3">
	          <select class="form-control" id="country">
		         <c:forEach items="${countryList}" var ="country">
		          	<option value="${country.c_id}">${country.c_name}</option>
		         </c:forEach>
		      </select> 
	        </div>
	        <label for="" class="col-sm-2 control-label"><span style="color:red;"> * </span>省会分类</label>
	        <div class="col-sm-3">
	          <select class="form-control" id="province">
		      </select> 
	        </div>
	      </div>
	      <div class="form-group">
	      <label for="" class="col-sm-2 control-label"><span style="color:red;"> * </span>城市分类</label>
	        <div class="col-sm-3">
	          <select class="form-control" id="city" name="city[ct_id]">
		      </select> 
	        </div>
	        <label for="" class="col-sm-2 control-label"><span style="color:red;"> * </span>景点分类</label>
	        <div class="col-sm-3">
	          <select class="form-control" name="scenicClass[sc_id]">
		         <c:forEach items="${scenicClassList}" var ="scenicClass">
		          	<option value="${scenicClass.sc_id}">${scenicClass.sc_name}</option>
		         </c:forEach>
		      </select> 
	        </div>
	      </div>   
	      <div class="form-group">
	        <label for="s_name" class="col-sm-2 control-label"><span style="color:red;"> * </span>景点名称</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="s_name" name="s_name" value="${scenic.s_name}">
	        </div>
	        <label for="price" class="col-sm-2 control-label">价格</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="price" name="price" value="${scenic.price}">
	        </div>
	      </div>
	      <div class="form-group">
	        <label for="address" class="col-sm-2 control-label">地址</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="address" name="address" value="${scenic.address}">
	        </div>
	        <label for="imageUrl" class="col-sm-2 control-label">封面图片</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="${scenic.imageUrl}">
	        </div>
	      </div>
	      <div class="form-group">
	      	<label for="bgUrl" class="col-sm-2 control-label">样例图片</label>
	        <div class="col-sm-3">
	          <input type="text" class="form-control" id="bgUrl" name="bgUrl" value="${scenic.bgUrl}">
	        </div>
	      </div>  
	      <div class="form-group">
	        <label for="description" class="col-sm-2 control-label">描述</label>
	        <div class="col-sm-8">
	          <textarea rows="3" class="form-control" id="description" name="description">${scenic.description}</textarea>
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
	
	$(document).ready(function () {
    //默认加载
	 $.ajaxSettings.async = false;
	 	ajaxSelectProvince($('#country').find('option:selected').attr("value"));
	 	ajaxSelectCity($('#province').find('option:selected').attr("value"));
	 $.ajaxSettings.async = true;
	
	 $('#country').on('change',  function (){
		 $.ajaxSettings.async = false;
		 	ajaxSelectProvince($(this).find('option:selected').attr("value"));
		 	ajaxSelectCity( $('#province').find('option:selected').attr("value"));
		 $.ajaxSettings.async = true;
	 });
	 
	  $('#province').on('change',  function (){
		 var pId = $('#province').find('option:selected').attr("value");
		 ajaxSelectCity(pId);
	 });
	});	
	
 	 function objectSubmit(){  
 	 	var url= null;
		if(${type}==1){//代表新增
			url = "/tour/scenic/new";
		}else{
			url = "/tour/scenic/edit";
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
      
      function ajaxSelectProvince(cId){
    	//根据国家动态加载省会
		 $('#province').children().remove();
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
	        			$('#province').append(defaultOption);
	        		});
	        	}
	    	});
	}
	
	function ajaxSelectCity(pId){
    	//根据国家动态加载省会
		 $('#city').children().remove();
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
	        			$('#city').append(defaultOption);
	        		});
	        	}
	    	});
	}
	</script>
