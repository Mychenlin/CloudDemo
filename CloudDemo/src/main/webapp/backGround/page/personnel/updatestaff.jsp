<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="backGround/layui2/layui/css/layui.css" />
	<script type="text/javascript" src="backGround/page/personnel/layui/layui.js"></script>
	  </head>
  <script type="text/javascript">
  		layui.use(['form','layer'],function(){
  			var form = layui.form,$=layui.$,layer=layui.layer;
  			
  			     //从父层获取值，json是父层的全局js变量。eval是将该string类型的json串变为标准的json串
		        var j = eval('('+parent.json+')');
		         $("#id").val(j.sId); 
		         
		         var ids=j.sId;
		         $.post("Staffinfo/staffbyid?id="+ids,function(res){
		        	 $("#id").val(res.sId);
		        	 $("#S_name").val(res.sName);
		        	 $("#S_sex").val(res.sta_sex);
			         $("#S_birthday").val(res.sIP);
			         $("#S_phone").val(res.sBirthdate); 
			       	 $("#S_login").val(res.sEntrytime);
			       	 $("#S_pwd").val(res.sPassword);
			         $("#S_entrytime").val(res.sBasepay);
			       	 $("#S_present").val(res.sSocial);
			      
					},"json");
		         
		         
		        form.on('submit(add)',function(){
  				var formData =  $("form").serialize();
  				$.post("Staffinfo/uptadeStaffinfo",formData,function(res){
  					if(res>0){
  						layer.msg("修改成功",{time:500},function(){
  							parent.layui.table.reload('tb');
  							var index = window.parent.layer.getFrameIndex(window.name);
  							window.parent.layer.close(index);
  						})
  					}else{
  						layer.msg("修改失败");
  					}
  				})
  				return false;
  			})
  			
  		})
  		
  </script>
  <body>
 
    <form  class="layui-form">
    	<input id="id" name="sId" type="hidden"/>
		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">员工名称：</label>
  			<div class="layui-input-inline">
  				<input id="S_name" name="sName" class="layui-input" placeholder="请输入员工名称" style="width: 300" autocomplete="off" lay-verify="required"/>
  				
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">员工性别：</label>
		    <div class="layui-input-block">
		      <input type="radio" id="nan" name="sSex" value="男" title="男">
		      <input type="radio" id="nv" name="sSex" value="女" title="女"  checked>
		    </div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">联系电话：</label>
  			<div class="layui-input-inline">
  				<input id="S_birthday" name="sIP" class="layui-input" placeholder="请输入联系电话" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
  		<div class="layui-form-item">
  			<label class="layui-form-label">出生年月：</label>
  			<div class="layui-input-inline"> 
			  <input id="S_phone" name="sBirthdate" type="text" class="layui-input" id="test1" placeholder="请输入出生年月"  lay-verify="required" style="width:300px">
			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">入职时间：</label>
  			<div class="layui-input-inline">
  				<input id="S_login" name="sEntrytime" type="text" class="layui-input" id="test3" placeholder="请输入入职时间" style="width:300px">
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">登陆密码：</label>
  			<div class="layui-input-inline">
  				<input id="S_pwd" name="sPassword" class="layui-input" placeholder="请输入登陆密码" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
 		
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">基本工资：</label>
  			<div class="layui-input-inline">
  				<input id="S_entrytime" name="sBasepay" class="layui-input" placeholder="请输入员工基本工资" style="width: 300" autocomplete="off"  />
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">员工社保：</label>
  			<div class="layui-input-inline">
  				<input id="S_present" name="sSocial" class="layui-input" placeholder="请输入员工社保" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
  		
 		
  		<div class="layui-form-item">
  			<div class="layui-input-inline" style="padding-left:150px;">
  				<button class="layui-btn" lay-submit lay-filter="add">提交</button>
  				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
  			</div>
  		</div>
	</form>
  </body>
</html>
