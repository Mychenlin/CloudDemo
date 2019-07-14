<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head> 
  <meta charset="utf-8" /> 
  <title>添加请假申请表</title> 
  <meta name="renderer" content="webkit" /> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
  <meta name="apple-mobile-web-app-capable" content="yes" /> 
  <meta name="format-detection" content="telephone=no" /> 
  <link rel="stylesheet" href="../../layui/css/layui.css" media="all" /> 
  <link rel="stylesheet" href="../../css/font_eolqem241z66flxr.css" media="all" /> 
  <style type="text/css">
		#ss img {
			width: 100%;
			height: 100%;
		}
		
		#ss {
			width: 100px;
			height: 100px;
		}
	</style>
 </head>  
 <body class="childrenBody"> 
  <form class="layui-form" method="post"> 
   <div class="layui-form-item"> 
    <label class="layui-form-label">开始时间</label> 
    <div class="layui-input-block"> 
     <input name="beginTime" readonly="" type="text" class="layui-input" style="width: 400px;height: 38px;" lay-verify="required" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" /> 
    </div> 
   </div> 
   <div class="layui-form-item"> 
    <label class="layui-form-label">结束时间</label> 
    <div class="layui-input-block"> 
     <input name="endTime" readonly="" type="text" class="layui-input" style="width: 400px;height: 38px;" lay-verify="required" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" /> 
    </div> 
   </div> 
   <div class="layui-form-item"> 
    <label class="layui-form-label">请假类型</label> 
    <div class="layui-input-inline"> 
     <select  name="name" lay-verify="required"> <option value="">请选择</option> <option value="公假">公假</option> <option value="病假">病假</option> <option value="事假">事假</option> </select> 
    </div> 
   </div> 
     <!-- 获取员工数据 -->

   
   <div class="layui-form-item"> 
    <label class="layui-form-label">请假员工</label> 
    <div class="layui-input-inline"> 
     <select name="staffId" lay-verify="required" lay-filter="yg" id="yg" "> 
     	<option value="">请选择</option> 
     </select> 
    </div> 
   </div> 
   <div class="layui-form-item layui-form-text"> 
    <label class="layui-form-label">请假理由</label> 
    <div class="layui-input-block"> 
     <textarea name="reason" placeholder="请输入内容" class="layui-textarea" lay-verify="required"></textarea> 
    </div>
    </div> 
    <div class="layui-form-item"> 
     <div class="layui-input-block"> 
      <button class="layui-btn" lay-submit="" lay-filter="addLeave">提交</button> 
      <button type="reset" class="layui-btn layui-btn-primary">重置</button> 
     </div> 
    </div>  
    <script type="text/javascript" src="../../layui/layui.js"></script> 
    <script type="text/javascript" charset="utf-8">
    layui.config({
    }).use(['form','layer','jquery','layedit','laydate'],function(){
    	var form = layui.form(),
    	layer = parent.layer === undefined ? layui.layer : parent.layer,
    	laydate = layui.laydate,
    	$ = layui.jquery;
    
		//查询员工  绑定数据
		
		  $.post("../../../leaveC/showStaffinfo",function(data){
			  $(data).each(function(i,q){
			  var $option=$("<option value='"+q.sId+"'>"+q.sName+"</option>");
			  $option.appendTo($("#yg"));
			  });
			  form.render();
			},"json");
		
    	
    	form.on('submit(addLeave)',function(){
    		var formData=$("form").serialize();
    		$.post("../../../leaveC/addLeave",formData,function(res){
    			if(res>0){
    				layer.msg("请假表申请递交成功");
    				window.location.href="${pageContext.request.contextPath}/backGround/page/attendance/auditLeave.jsp";
    			}else{
    				layer.msg("请假单递交失败,请联系管理员");
    			}
    		});
    		return false;
    	});
    	
    	
    });

    </script>  

  </form>
 </body>
</html>