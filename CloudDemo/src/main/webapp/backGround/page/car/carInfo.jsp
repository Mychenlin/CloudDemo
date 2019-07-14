<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
	<meta charset="utf-8">
	<title>消息列表--layui后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backGround/layui2/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backGround/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backGround/css/message.css" media="all" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/backGround/layui2/layui/layui.js"></script>
	<style type="text/css">
		#img{
			width: 50px;
			height: 50px;
			text-align: center;
			margin-top: -10px;
		}
		td{
			height: 90px;
		}
	</style>
</head>
  	<script type="text/javascript">
	  	function createTime(v){
	  		var date = new Date(v);
	  	    var y = date.getFullYear();
	  	    var m = date.getMonth()+1;
	  	    m = m<10?'0'+m:m;
	  	    var d = date.getDate();
	  	    d = d<10?("0"+d):d;
	  	    var h = date.getHours();
	  	    h = h<10?("0"+h):h;
	  	    var M = date.getMinutes();
	  	    M = M<10?("0"+M):M;
	  	    var str = y+"-"+m+"-"+d+" "+h+":"+M;
	  	    return str;
	  	}
  	
  		layui.use(['table'],function(){
  			var table = layui.table,layer=layui.layer,$=layui.$;
  			table.render({
  				elem:'#tb',
  				url:'${pageContext.request.contextPath}/carC/carInfo',
  				method:'post',
  				page:true,
  				limit:10,
  				limits:[10,20,30],
  				cols:[[
  						{field:'id',title:'ID',width:70,align:'center'},
  						{field:'name',title:'车型名称',width:300,align:'center'},
  						{field:'money',title:'厂商指导价(元)',width:110,align:'center'},
  						{field:'manufacturer',title:'厂商',width:100,align:'center'},
  						{field:'level',title:'级别',width:110,align:'center'},
  						{field:'energyType',title:'能源类型',width:100,align:'center'},
  						{field:'timeToMarket',title:'上市时间',width:120,align:'center'},
  						{field:'number',title:'库存',width:80,align:'center'},
  						{fixed: 'right', title:'操作', toolbar: '#demo', width:140,align:'center'}
  					]]
  			});
  			
  			
  			$("#search").click(function(){
  			var keyword = $("input[name = keyword]").val();
  			table.reload('tb',
	  			{ 
	  				where:{key:keyword}
	  			});
  			});
  			
  			table.on('tool(show)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的DOM对象
				 
				    	json = JSON.stringify(data);
				  if(layEvent === 'update'){ //查看
				    	//do somehing
				    	layer.open({
		  					type:2,
		  					title:"车辆配置信息",
		  					content:'${pageContext.request.contextPath}/carC/carInfoById?id='+data.id,
		  					area:['800px','470px'],
		  					offset:  ['0px', '200px'],
		  					shade:0.5,
		  					resize:false,
		  				})
				  } else if(layEvent === 'delete'){ //删除
				    	layer.confirm('真的删除行么', function(index){
				      	obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
				      	alert(data.msgId);
				      	layer.close(index);
				     	 //向服务端发送删除指令
				     	 $.post("../../../carC/show",{op:'delMessage',ids:data.msgId},function(res){
				     		 if(res>0){
				     			 layer.msg("删除成功",{time:500},function(){
				     				 table.reload('tb');
				     			 })
				     		 }else if(res==0){
				     			  layer.msg("没有找到编号为【"+data.msgId+"】的数据",{time:500})
				     			   table.reload('tb');
				     		 }else{
				     			  layer.msg("程序异常，请稍后再试......",{time:500})
				     			   table.reload('tb');
				     		 }
				     	 })
				    });
				  }
				});
  		})
  		
  		
  	</script>
<body class="childrenBody">
		<div class="layui-form-item">
  			<div class="layui-input-inline">
  			<input name="keyword" placeholder="请输入查询条件" autocomplete="off" class="layui-input"/>
  		</div>
  		<button id="search" class="layui-btn layui-but-radius" >查询</button>
  		</div>
  		<table id="tb" lay-filter="show">
  		</table>
  		<div id="page"></div>
  		<script type="text/html" id="demo">
  			<a class="layui-btn layui-btn-xs" lay-event="update">查看配置</a>
  			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
  		</script>
</body>
</html>