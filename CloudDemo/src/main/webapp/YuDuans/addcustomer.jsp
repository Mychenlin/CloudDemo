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
  		layui.use(['form','element','layer','laydate'],function(){
  			var form = layui.form,$=layui.$,layer=layui.layer,element = layui.element;
  			var laydate = layui.laydate;
  		//加载地区数据
  			var cs=null;
 			$.ajax({
			    type: "post",
			     url:'/CloudDemo/backGround/json/dizisj.json',
			    cache: false,
			    dataType : "json",
			    success: function(data){
			    	$.each(data,function(index,item){
			        	$("#quiz1").append('<option value='+item.name+'>'+item.name+'</option>');
			        	form.render('select'); //这个很重要
		            })
			    	
               }
           }); 

 			form.on('select(test)', function(){
 				  	cs=$(this).text();
					$("#quiz2").empty();
 					$("#quiz2").append('<option value="">请选择市</option>');
				   	$.ajax({
				        url:'/CloudDemo/backGround/json/dizisj.json',
				        dataType:'json',
				        async: true ,
				        success:function(data){
				            $.each(data,function(index,item){
				            	if(item.name==cs){
				            		$.each(item.data,function(index,item){
				            			
				            			$("#quiz2").append('<option value='+item.name+'>'+item.name+'</option>');
				            			form.render('select'); //这个很重要
				            		})
				            	}
				            	
				            })
				        } 
				   });
 				
 			});
 			

 			form.on('select(test1)', function(){
				 var dz=$(this).text();
				 $("#quiz3").empty();
				 $("#quiz3").append('<option value="">请选择县/区</option>');
				   $.ajax({
				        url:'/CloudDemo/backGround/json/dizisj.json',
				        dataType:'json',
				        async: true ,
				        success:function(data){
				            $.each(data,function(index,item){
				            	if(item.name==cs){
				            		$.each(item.data,function(index,item){
				            			$.each(item.data,function(index,item){
				            				
				            				$("#quiz3").append('<option value='+item.name+'>'+item.name+'</option>');
				            				form.render('select'); //这个很重要
					            		})
				            		})
				            	}
				            	
				            })
				        } 
				   });
				
			});
  			/* var newsData = '';
  			$.get("/CloudDemo/backGround/json/dz.json", function(data){
  				var newArray = [];
  				console.log(data);
  			}) */
				
  			//监听表单提交
			form.on('submit(add)',function(){
				var formData=$("form").serialize();
				
				$.post("cust/add",formData,function(res){
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
			    elem: '#test3'
			  });
  		})
  		
  </script>
  </head>
  
  <body>
  		<form class="layui-form">
    	<div class="layui-form-item">
			    <label class="layui-form-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
			    <div class="layui-input-block">
			      <input type="text" name="C_name" lay-verify="required" lay-reqtext="用户名是必填项，不能为空" placeholder="请输入" autocomplete="off" class="layui-input">
			    </div>
		</div>
		
		<div class="layui-form-item">
		    <label class="layui-form-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
		    <div class="layui-input-block">
			      <input type="radio" name="C_sex" value="男" title="男" checked="">
			      <input type="radio" name="C_sex" value="女" title="女">
		    </div>
		</div>
		
		
		<div class="layui-inline">
	      <label class="layui-form-label">出生日期：</label>
	      <div class="layui-input-inline">
	        <input type="text" class="layui-input" name="C_age" id="test3" placeholder="yyyy-MM-dd">
	      </div>
	    </div>
	    
	      <br/>
	
  
  <div class="layui-form-item">
    <label class="layui-form-label">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</label>
    <div class="layui-input-inline" style="width：50px;">
      <select name="C_place" id="quiz1" lay-filter="test">
        <option value="">请选择省</option>
      </select>
    </div>
    <div class="layui-input-inline" style="width：50px;">
      <select name="C_place" id="quiz2" lay-filter="test1">
        <option value="">请选择市</option>
      </select>
    </div>
    <div class="layui-input-inline">
      <select name="C_place" id="quiz3">
        <option value="">请选择县/区</option>
      </select>
    </div>
  </div>
  
  
    <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</label>
      <div class="layui-input-inline">
        <input type="tel" name="C_phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</label>
      <div class="layui-input-inline">
        <input type="tel" name="C_emIP" lay-verify="required|phone" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
      <div class="layui-input-inline">
        <input type="text" name="C_Email" lay-verify="email" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">车型车系：</label>
    <div class="layui-input-block">
      <input type="text" name="C_Models"   class="layui-input">
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
