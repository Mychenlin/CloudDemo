<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" href="backGround/layui1/layui/css/layui.css" />
	<script type="text/javascript" src="backGround/layui1/layui/layui.js"></script>
	<script type="text/javascript">
  		layui.use(['form','layer','laydate'],function(){
  			var form = layui.form,$=layui.$,layer=layui.layer;
  			var laydate = layui.laydate;
		      
  			$.ajax({
		        url:'/CloudDemo/NewsManagement/selst',
		        dataType:'json',
		        async: true,
		        success:function(data){
		        	$(data.data).each(function(i,q){
		        		console.log(q);
						var $option = $("<option value='"+q.sId+"'>"+q.sName+"</option>");
						console.log($option);
						$option.appendTo($("#city1")); 
					});
					form.render();
		        	
		        }
		   }); 
				
  			//监听表单提交
			form.on('submit(add)',function(){
				var formData=$("form").serialize();
				
				$.post("/CloudDemo/NewsManagement/add",formData,function(res){
					if(res>0){
						layer.msg("发布成功",{time:2000},function(){
							//重新加载表格
							parent.layui.table.reload('tb');
							//关闭当前弹层
							var index = window.parent.layer.getFrameIndex(window.name);
							window.parent.layer.close(index);
						});
					}else{
						layer.msg("发布招聘失败");
					}
				});
				return false;
			});
  			
			laydate.render({
			    elem: '#start_time'
			    ,type: 'datetime'
			  });
			  laydate.render({
			    elem: '#end_time'
			    ,type: 'datetime'
			  });
  		})
  		
  </script>
  </head>
  
  <body>
  		<form class="layui-form">
    	<div class="layui-form-item" >
	     	<label class="layui-form-label">发布者：</label> 
		    <div class="layui-input-block">
			    
			     <select lay-verify="required" id="city1" name="sId.sId">
			     	<option id="tt" value="1">选择发布人</option>
			     </select>
			    </div>
		  </div> 
		
		
	<div class="layui-form-item">
	    <label class="layui-form-label">新闻类型</label>
	    <div class="layui-input-block">
	      <select name="type" lay-verify="required">
	        <option value="汽车">汽车</option>
	        <option value="娱乐">娱乐</option>
	        <option value="经济">经济</option>
	      </select>
	    </div>
 	 </div>
 	 <div class="layui-form-item">
	    <label class="layui-form-label">标题</label>
	    <div class="layui-input-block">
	      <input type="text" name="title"  class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">内容</label>
	    <div class="layui-input-block">
	      <textarea name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
	    </div>
	  </div>
	  
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit lay-filter="add">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	</form>
  </body>
</html>
