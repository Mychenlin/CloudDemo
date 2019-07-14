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
		.layui-table-cell{
			height: auto!important;
			white-space: normal;
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
  				url:'${pageContext.request.contextPath}/carC/carType',
  				method:'post',
  				page:true,
  				limit:10,
  				limits:[10,20,30],
  				cols:[[
  						{field:'id',title:'ID',width:80,align:'center'},
  						{field:'pic_url',title:'图片',templet:"<div><img id='img' src='${pageContext.request.contextPath }/{{d.pic_url}}'></div>",width:150,align:'center'},
  						{field:'brand_id',title:'品牌',templet:"<div>{{d.brand_id.name}}</div>",width:150,align:'center'},
  						{field:'name',title:'汽车类型',width:150,align:'center'},
  						{field:'status',title:'现状',width:100,align:'center'},
  						{field:'sort',title:'种类',width:100,align:'center'},
  						{field:'create_time',title:'生产时间',templet :function (row){
                        	return createTime(row.create_time);
                        },width:200,align:'center'},
  						{fixed: 'right', title:'操作', toolbar: '#demo', width:150,align:'center'}
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
		  					title:"与 "+data.userName+" 的聊天",
		  					content:'messageReply.jsp',
		  					area:['550px','500px'],
		  					shade:0.5,
		  					resize:false,
		  					zIndex:layer.zIndex,
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
  			<a class="layui-btn layui-btn-xs" lay-event="update">编辑</a>
  			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
  		</script>
</body>
</html>