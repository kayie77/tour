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
		    
 			<h3 class="page-header">景点管理
 			<small style="float:right">
 				<button type="button" name="newEntity" class="btn btn-success btn-sm">新增</button>
 				<button type="button" name="delEntity" class="btn btn-danger btn-sm">删除</button>
 			</small></h3>
  			<div class="table-responsive col-sm-12">
  			<form class="form-inline" action="/tour/scenic/revealObject" method="get">
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
            <table class="table table-striped ">
              <thead>
                <tr>
                  <th><input type="checkbox" id="row_all_selector">id号</th>
                  <th>所属国家</th>
                  <th>所属省会</th>
                  <th>所属城市</th>
                  <th>景点分类</th>
                  <th>景点名称</th>
                  <th>价格</th>
                  <th>地址</th>
                  <th>编辑</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="scenic" items="${scenicList}">
		       <tr id="${scenic.s_id}">
		       <td><input type="checkbox" class="js-row_selector">${scenic.s_id }</td>
		       <td>${scenic.city.province.country.c_name}</td>
		       <td>${scenic.city.province.p_name }</td>
		       <td>${scenic.city.ct_name }</td>
		       <td>${scenic.scenicClass.sc_name }</td>
		       <td>${scenic.s_name }</td>
		       <td>${scenic.price }</td>
		       <td>${scenic.address}</td>
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
	         var url = '/tour/scenic/view/new';
   	         showModal(url);
	    });
	    
	    $('button[name="editEntity"]').click(function (){
	    	var id = $(this).parents('tr').attr('id');
	         var url = '/tour/scenic/view/edit?id='+id;
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

                var url = '/tour/scenic/del?' + params;
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
	        			$('#s_city').prepend('<option value="">全部</option>');
	        	}
	    	});
	}
    </script>
  </body>
</html>
