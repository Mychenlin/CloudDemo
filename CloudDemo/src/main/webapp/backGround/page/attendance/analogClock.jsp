<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>模拟打卡</title>
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
				url:'attC/showStaffinfo',
				method:'post',
				cols:[[
					{field:'sId',title:'ID',align:'center'},
					{field:'sName',title:'姓名',align:'center'},
					{field:'sSex',title:'性别',align:'center'},
					{fixed:'right',title:'打卡',toolbar:'#demo',align:'center'}
				]]
			});
			
		
			table.on('tool(show)',function(obj){
				var data=obj.data;
				var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				if(obj.event=='ok'){
					layer.confirm("确认打卡",function(){
						//将员工ID传到后台处理
						$.post("attC/daKa1",{id:data.sId},function(res){
							if(res>0){
								layer.msg("上班已打卡",{time:800},function(){
									//刷新表格
									table.reload('tb');
								});
							}else{
								layer.msg("已迟到....",{time:2000});
							}
						});
					});
				}
				
				if(obj.event=='no'){
					layer.confirm("确认打卡",function(){
						$.post("attC/daKa2",{id:data.sId},function(res){
							if(res>0){
								layer.msg("下班已打卡",{time:800},function(){
									//刷新表格
									table.reload('tb');
								});
							}else{
								layer.msg("员工早退....",{time:2000});
							}
						});
					});
				}  
			});
			
			
		
		
		});
	</script>
  </head>
  <body>
  	温馨提示：上班时间8:00点 下班时间17:00
  	<table id="tb" lay-filter="show"></table>
  	<script type="text/html" id="demo">
  		<a class="layui-btn layui-btn-xs" lay-event="ok">上班卡</a>
		<a class="layui-btn layui-btn-xs" lay-event="no">下班卡</a>
  	</script>
  </body>
</html>
