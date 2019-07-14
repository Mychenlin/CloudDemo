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
	<link rel="stylesheet" href="backGround/layui2/layui/css/layui.css" />
	<script type="text/javascript" src="backGround/page/personnel/layui/layui.js"></script>
	
	<script type="text/javascript">
		layui.use(['table','layer'],function(){
			//初始化模块
			var table=layui.table,$=layui.$,layer=layui.layer;
			 //从父层获取值，json是父层的全局js变量。eval是将该string类型的json串变为标准的json串
	        var j = eval('('+parent.json+')');
	        var ids=j.rId;
	         
	        
			//绑定表格数据
			table.render({
				elem:'#tb',
				url:'RepySMSController/seleRepy?id='+ids,
				method:'post',
				width:600,
				height:290,
				page:true,
				limit:5,
				limits:[5,10,15],
				cols:[[
					{field:'rRemark',title:'回访信息',align:'center'},
					{field:'rhtime',title:'回访时间',align:'center'},
					{fixed:'right',title:'操作',toolbar:'#demo',align:'center'}
				]]
			
			});
				
			$("#search").click(function(){
				//将一个JavaScript值(对象或者数组)转换为一个 JSON字符串
				json=JSON.stringify(j);
				layer.open({
					type:2,
					title:'消息回复',
					content:'backGround/page/Yuyue/addhui.jsp',
					area:['450px','230px'],
					shade:0.5,
					btn:'关闭',
					resize:false,  //不允许拉伸
					zIndex:layer.zIndex
				});
			});
			
			
			//监听表格工具栏
			
			table.on('tool(show)',function(obj){
			console.log(obj);
				var data=obj.data;
					if(obj.event=='update'){
						layer.confirm("是否删除该数据?",function(){
							$.post("RepySMSController/delrepy",{id:data.reId},function(res){
								if(res>0){
									layer.msg("删除成功",{time:2000},function(){
										//刷新表格
										table.reload('tb');
									});
								}else if(res==0){
									layer.msg("没有找到编号为【"+data.reId+"】的数据",{time:2000});
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
  	<div>
  		<div class="layui-form-item">
  		<blockquote class="layui-elem-quote news_search">
		    <button class="layui-btn layui-btn-radius" id="search">消息回附</button>
		  </blockquote>
	    	<table id="tb" lay-filter="show"></table>
  		</div>
  	</div>
  	<script type="text/html" id="demo">
  		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="update">删除</a>
  	</script>
  </body>
</html>
