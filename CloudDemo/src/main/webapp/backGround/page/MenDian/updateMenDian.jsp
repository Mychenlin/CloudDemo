<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		         $("#mId").val(j.mId); 
		         $("#mName").val(j.mName);
		         $("#mFname").val(j.mFname);
		         $("#mIp").val(j.mIp);
		         $("#mTzT").val(j.mTzT);
		        
		        form.on('submit(update)',function(){
  				var formData =  $("form").serialize();
  				$.post("MenDianController/updateMedian",formData,function(res){
  					if(res>0){
  						layer.msg("修改成功",{time:500},function(){
  							parent.layui.table.reload('tb');
  							var index = window.parent.layer.getFrameIndex(window.name);
  							window.parent.layer.close(index)
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
    <form class="">
    	<input id="mId" name="mId" type="hidden"/>
		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">门店名称：</label>
  			<div class="layui-input-inline">
  				<input id="mName" name="mName" class="layui-input" placeholder="请输入门店名称：" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">负责人：</label>
  			<div class="layui-input-inline">
  				<input id="mFname" name="mFname" class="layui-input" placeholder="请输入负责人名称" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">联系方式：</label>
  			<div class="layui-input-inline">
  				<input id="mIp" name="mIp" class="layui-input" placeholder="请输入联系方式" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">门店地址：</label>
  			<div class="layui-input-inline">
  				<input id="mTzT" name="mTzT" class="layui-input" placeholder="请输入门店地址" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20px; width:410px;" >
  			<label class="layui-form-label">状态选择：</label>
		    <div class="layui-input-block">
		      <select id="staff" name="mZT" lay-filter="test1" >
     				<option  value="1">营业中</option>
     				<option  value="2">装修中</option>
     				<option  value="3">停业</option>
     			</select>
		    </div>
  		</div>
		  
			  <div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit lay-filter="update">立即提交</button>
			      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			  </div>
	</form>
  </body>
</html>
