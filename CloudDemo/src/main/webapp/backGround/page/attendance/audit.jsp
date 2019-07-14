<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>已审核列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="backGround/page/attendance/layui/css/layui.css" />
	<script type="text/javascript" src="backGround/page/attendance/layui/layui.js"></script>
		<script type="text/javascript">
		layui.use(['table','layer'],function(){
			//初始化模块
			var table=layui.table,$=layui.$,layer=layui.layer;
			//绑定表格数据
			table.render({
				elem:'#tb',
				url:'leaveC/showAudit',
				method:'post',
				cols:[[
					{field:'id',title:'ID',width:40,align:'left'},
					{field:'staffId',title:'SID',width:40,align:'left'},
					{field:'beginTime',title:'请假开始时间',width:200,align:'left'},
					{field:'endTime',title:'请假结束时间',width:200,align:'left'},
					{field:'reason',title:'请假理由',sort: true,width:250,align:'left'},
					{field:'leaveStatus',title:'结果',sort: true,width:250,align:'left'}
				]],done: function(res, curr, count){
	                <!--根据得到的属性值匹配 -->
	                $("[data-field='leaveStatus']").children().each(function(){
	                    if($(this).text()=='0'){
	                        $(this).text("未审核")
	                    }else if($(this).text()=='1'){
	                        $(this).text("同意")
	                    }
	                    else if($(this).text()=='2'){
	                        $(this).text("拒绝")
	                    }
	                });}

			});
			

		});
	</script>
  </head>
  <body>
  	<table id="tb" lay-filter="show"></table>
  </body>
</html>
