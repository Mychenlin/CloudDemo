<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'recruit.jsp' starting page</title>
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
		layui.use(['table','layer','form'],function(){
			//初始化模块
			//console.log("1");
			var table=layui.table,$=layui.$,layer=layui.layer;
			var form = layui.form;
			//绑定表格数据
			table.render({
				elem:'#tb',
				url:'/CloudDemo/rec/show',
				method:'post',
				page:true,
				limit:3,
				limits:[3,6,9],
				cols:[[
					{field:'reId',title:'编号'},
					{field:'post',title:'部门名称',templet:'<div>{{d.post.pBId.bName}}</div>',align:'center'},
					{field:'post',title:'职位名称',templet:'<div>{{d.post.pName}}</div>',align:'center'},
					{field:'post',title:'职位介绍',templet:'<div>{{d.post.pRemark}}</div>',align:'center'},
					{field:'education',title:'学历',align:'center'},
					{field:'start_time',title:'发布时间',align:'center'},
					{field:'end_time',title:'截止时间',align:'center'},
					{field:'salarymin',title:'薪资',templet: '<div>{{d.salarymin}}-{{d.salary_max}}</div>',align:'center'},
					{field:'sum',title:'招聘人数',align:'center'},
					{fixed:'right',title:'操作',toolbar:'#demo',align:'center'}
				]]
			});
			
			//添加招聘
			$("#addBtn").click(function(){
				layer.open({
					type:2,
					title:'添加招聘',
					content:'/CloudDemo/rec/showb',
					area:['450px','400px'],
					shade:0.5,
					btn:'关闭',
					resize:false, //不允许拉伸
					zIndex:layer.zIndex
				});
			});
			//修改//监听表格工具栏
			
			table.on('tool(show)',function(obj){
			console.log(obj);
				var data=obj.data;
				if(obj.event=='update'){
				//将一个JavaScript值(对象或者数组)转换为一个 JSON字符串
					json=JSON.stringify(data);
					
					layer.open({
						type:2,
						title:'修改部门',
						content:'/CloudDemo/backGround/page/recruitment/upd.jsp',
						area:['450px','400px'],
						shade:0.5,
						btn:'关闭',
						resize:false,   //不允许拉伸
						zIndex:layer.zIndex
						})
					
				}
				if(obj.event=='delete'){
					layer.confirm("是否删除该数据?",function(){
						$.post("rec/del",{id:data.reId},function(res){
							if(res>0){
								layer.msg("删除成功",{time:2000},function(){
									//刷新表格
									table.reload('tb');
								});
							}else if(res==0){
								layer.msg("没有找到编号为【"+data.bId+"】的数据",{time:2000});
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
<body class="childrenBody">
	<div>
  		<div class="layui-form-item">
	  		<blockquote class="layui-elem-quote news_search">
	  			<div class="layui-input-inline">
			      <input name="keywords" placeholder="请输入查询条件" autocomplete="off" class="layui-input" />
			    </div>
			    <button class="layui-btn layui-btn-radius" id="search">查询</button>
			    <button class="layui-btn layui-btn-radius layui-btn-warm" id="addBtn">发布招聘</button>
			  </blockquote>
	    	<table id="tb" lay-filter="show" >
	    		
	    		
	    	</table>
	    	<script type="text/html" id="demo">
  				<a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
  				<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
  			</script>
  		</div>
  	</div>
  </body>
</html>
