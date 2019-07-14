<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="utf-8">
	<title>用户总数--layui后台管理模板</title>
<link rel="stylesheet" href="../../../backGround/layui1/layui/css/layui.css" />
<script type="text/javascript" src="../../../backGround/layui1/layui/layui.js"></script>
	
<script type="text/javascript">
		layui.use(['table','layer','form'],function(){
		var table=layui.table,$=layui.$,layer =layui.layer ;
		var form = layui.form;
		//绑定表格数据
		table.render({
			elem:'#tb',
			url:'/CloudDemo/NewsManagement/ShowNew',
			method:'post',
			page:true,
			limit:3,
			limits:[3,6,9],
			cols:[[
				{field:'id',title:'编号'},
				{field:'sId',title:'发布人',templet:'<div>{{d.sId.sName}}</div>',align:'center'},
				{field:'type',title:'类型',align:'center'},
				{field:'title',title:'标题',align:'center'},
				{field:'newtime',title:'发布时间',align:'center',templet:'<div>{{ layui.util.toDateString(d.createDate, "yyyy-MM-dd HH:mm:ss") }}</div>'},
				{field:'content',title:'内容',align:'center'},
				{field:'remark',title:'备注',align:'center'},
				{fixed:'right',title:'操作',toolbar:'#demo',align:'center'}
			]]

		});
		
		
		
		//添加新闻
		$("#addBtn").click(function(){
			layer.open({
				type:2,
				title:'添加新闻',
				content:'/CloudDemo/backGround/page/news/AddNew.jsp',
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
					title:'修改新闻',
					content:'/CloudDemo/backGround/page/news/UpdNew.jsp',
					area:['450px','400px'],
					shade:0.5,
					btn:'关闭',
					resize:false,   //不允许拉伸
					zIndex:layer.zIndex
					})
				
			}
			if(obj.event=='delete'){
				layer.confirm("是否删除该数据?",function(){
					$.post("../../../NewsManagement/del",{id:data.id},function(res){
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

<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
	  			<div class="layui-input-inline">
			      <input name="keywords" placeholder="请输入查询条件" autocomplete="off" class="layui-input" />
			    </div>
			    <button class="layui-btn layui-btn-radius" id="search">查询</button>
			    <button class="layui-btn layui-btn-radius layui-btn-warm" id="addBtn">发布新闻</button>
			  </blockquote>
	
		
	<div class="layui-form news_list">
	  	<table id="tb" lay-filter="show" >
	    		
	    		
	    	</table>
	    	
	    	<script type="text/html" id="demo">
  				<a class="layui-btn layui-btn-xs" lay-event="update">修改新闻</a>
				<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除新闻</a>
  			</script>
	</div>
	
	
	
</body>
</html>