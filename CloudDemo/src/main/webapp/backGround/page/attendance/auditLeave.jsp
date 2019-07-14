<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>审核</title>
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
				url:'leaveC/showLeave',
				method:'post',
				cols:[[
					{field:'id',title:'ID',width:40,align:'left'},
					{field:'staffId',title:'SID',width:40,align:'left'},
					{field:'beginTime',title:'请假开始时间',width:200,align:'left'},
					{field:'endTime',title:'请假结束时间',width:200,align:'left'},
					{field:'reason',title:'请假理由',sort: true,width:250,align:'left'},
					{fixed:'right',title:'操作',width:150,toolbar:'#demo',align:'center'}
				]]
			});
			
		
			table.on('tool(show)',function(obj){
				var data=obj.data;
				var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				if(obj.event=='ok'){
					layer.confirm("同意该员工请假申请?",function(){
						$.post("leaveC/updateStatus",{id:data.id,status:1},function(res){
							if(res>0){
								layer.msg("已同意",{time:800},function(){
									//刷新表格
									table.reload('tb');
								});
							}else{
								layer.msg("程序异常,请稍后再试....",{time:2000});
							}
						});
					});
				}
				
				if(obj.event=='no'){
					layer.confirm("拒绝该员工请假申请??",function(){
						$.post("leaveC/updateStatus",{id:data.id,status:2},function(res){
							if(res>0){
								layer.msg("已拒绝",{time:800},function(){
									//刷新表格
									table.reload('tb');
								});
							}else{
								layer.msg("程序异常,请稍后再试....",{time:2000});
							}
						});
					});
				}  
			});
			
			
		
		
		});
	</script>
  </head>
  <body>
  	<table id="tb" lay-filter="show"></table>
  	<script type="text/html" id="demo">
  		<a class="layui-btn layui-btn-xs" lay-event="ok">同意</a>
		<a class="layui-btn layui-btn-xs" lay-event="no">拒绝</a>
  	</script>
  </body>
</html>
