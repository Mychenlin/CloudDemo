<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="backGround/page/attendance/layui/css/layui.css" />
	<link rel="stylesheet" href="backGround/layui2/layui/css/layui.css" />
	<script type="text/javascript" src="backGround/page/personnel/layui/layui.js"></script>
	
	<script type="text/javascript">
		layui.use(['table','layer'],function(){
			//初始化模块
			var table=layui.table,$=layui.$,layer=layui.layer;
			
			//绑定表格数据
			table.render({
				elem:'#tb',
				url:'attC/showAtt',
				method:'post',
				page:true,
				limit:3,
				limits:[3,6,9],
				cols:[[
					{field:'id',title:'ID',align:'center'},
					{field:'staffId.sName',templet:"<div>{{d.staffId.sName}}</div>",title:'员工姓名',align:'center'},
					{field:'time',title:'考勤日期',align:'center'},
					{field:'statusId',title:'考勤状态',align:'center'}
				]],done: function(res, curr, count){
	                <!--根据得到的属性值匹配 -->
	                $("[data-field='statusId']").children().each(function(){
	                    if($(this).text()=='0'){
	                        $(this).text("正常")
	                    }else if($(this).text()=='1'){
	                        $(this).text("迟到")
	                    }
	                    else if($(this).text()=='2'){
	                        $(this).text("早退")
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
