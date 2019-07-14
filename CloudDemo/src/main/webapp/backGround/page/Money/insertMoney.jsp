<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8">
	<title>会员添加--layui后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backGround/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backGround/layui1/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/backGround/layui1/layui/layui.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/backGround/js/jquery-1.4.1.js" ></script>
	<style type="text/css">
		.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
		@media(max-width:1240px){
			.layui-form-item .layui-inline{ width:100%; float:none; }
		}
	</style>
		
	  <script type="text/javascript">
		
		layui.use(['form','layer','jquery','laydate','table'], function(){
		  var laydate = layui.laydate,form = layui.form,
	      layer = parent.layer === undefined ? layui.layer : parent.layer,
	      $ = layui.jquery,table=layui.table;

		  //常规用法:时间
		  laydate.render({
		    elem: '#tb',
		    type: 'date'
		  });

			//遍历表格数据
			table.render(
					{
				elem:'#tbl',
				url:'${pageContext.request.contextPath}/Staffinfo/querySal',
				method:'post',
				width:890,
				page:true,
				cols:[[
					{field:'sId',title:'员工Id',width:100,align:'center'},
					{field:'sName',title:'客户姓名',width:140,align:'center'},
					{field:'sBasepay',title:'基本工资',width:140,align:'center'},
					{field:'sSocial',title:'社保',width:140,align:'center'},
					{field:'sPosId.pName',title:'职位',templet:'<div>{{d.sPosId.pName}}</div>',width:140,align:'center'},
					{field:'sEntrytime',title:'入职时间',width:120,align:'center'},
					{field:'right',title:'操作',toolbar:'#demo',width:100,align:'center'}
				]]
			});
			
			
			
			 //发放薪资
			 var jason;
			 table.on('tool(show)',function(obj){
				 var data=obj.data;
				 if(obj.event=='add'){					 
					 json=JSON.stringify(data);
					 layer.open({
					 type:2,
					 title:'发放薪资',
					 content:'${pageContext.request.contextPath}/Staffinfo/querysa2?sId='+data.sId,
					 area:['1250px','400px'],
                     shade:[0.8, '#393D49'],
                    
				 }); 
	 
				 }
			 });
			
			
			
			
			
			
			
			
			
		//查询部门
		  $.post("${pageContext.request.contextPath}/position/querbum",function(dt){
			  $(dt).each(function(i,q){
			  var $option=$("<option value='"+q.bId+"'>"+q.bName+"</option>");
			  $option.appendTo($("#first"));
			  });
			  form.render();
			},"json");
		
		//职位
		  form.render('select');
		  form.on('select(first)',function(rest){
			 
			  $.post("${pageContext.request.contextPath}/Staffinfo/querpostById?Id="+rest.value,function(dt){
				  $(dt).each(function(i,q){
				  var $option=$("<option value='"+q.pId+"'>"+q.pName+"</option>");
				  $option.appendTo($("#second"));
				  });
				  form.render();
				},"json");
			});
		  //员工
		  form.render('select');
		  form.on('select(second)',function(dest){
			  
			  $.post("${pageContext.request.contextPath}/Staffinfo/querByPIdStaffinfoById?pId="+dest.value,function(dt){
				 $(dt).each(function(i,b){
				  var $option=$("<option value='"+b.sId+"'>"+b.sName+"</option>");
				  $option.appendTo($("#last"));
				  });
				  form.render();
				},"json");
			});

		
		});
			
	</script>
<link id="layuicss-skinlayercss" rel="stylesheet" href="http://127.0.0.1:8020/%E5%90%8E%E5%8F%B0%E7%95%8C%E9%9D%A2mo/layui/css/modules/layer/default/layer.css?v=3.0.3303" media="all"></head>
<body class="childrenBody">
	
	<form  style="width:100%;" class="layui-form">
		<div class="layui-form-item">
		
				<div class="layui-form-item" class="form-inline"> 
			    <label for="name" class="layui-form-label" class="userStatus" lay-filter="userStatus">月份</label>
			   	<div class="layui-input-block">
			   	<input type="text" id="tb"  name="age" autocomplete="off" class="layui-input userName" class="form-control"  placeholder="请输入月份" style="width: 258px;"/>
				</div>
			   </div>
			   
			<div class="layui-col-md3" >
			<label class="layui-form-label">部门</label>
			<div class="layui-input-block">
					<select name="first" id="first" class="form-control" style="width: 200px;" class="first" lay-filter="first" >
						<option value="0">==请选择==</option>	 
				   </select>
				</div>
		</div>
		
		
		<div class="layui-col-md3">
			    <label class="layui-form-label">职位</label>
				<div class="layui-input-block">
					<select name="second" id="second" class="form-control" style="width: 200px;" class="userStatus" lay-filter="second">
						<option value="0">==请选择==</option>	
				    </select>
				</div>
		    </div>
		
		
		  <div class="layui-col-md3">
			    <label class="layui-form-label">人员</label>
				<div class="layui-input-block">
					<select name="last" id="last" class="form-control" style="width: 200px;" class="userStatus" lay-filter="last">
						<option value="0">==请选择==</option>	 
				   </select>
				</div>
		  </div>
		
	
		<div class="layui-form news_list">		
	  	<table class="layui-table" id="tbl" lay-filter="show"></table>
	  	<div id="page"></div>
		  <script type="text/html" id="demo">
			<a class="layui-btn layui-btn-xs" lay-event="add">发放</a>	 		
	 	</script>
		    
		</table>
	</div>
	</form>


</body>
</html>