<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="../../css/bootstrap.min.css" />
	<link rel="stylesheet" href="../../layui1/layui/css/layui.css" />
	<script type="text/javascript" src="../../layui1/layui/layui.js" ></script>
	<script type="text/javascript" src="js/jquery-1.4.1.js" ></script>
	<style type="text/css">
		.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
		@media(max-width:1240px){
			.layui-form-item .layui-inline{ width:100%; float:none; }
		}
	</style>

<link id="layuicss-skinlayercss" rel="stylesheet" href="http://127.0.0.1:8020/%E5%90%8E%E5%8F%B0%E7%95%8C%E9%9D%A2mo/layui/css/modules/layer/default/layer.css?v=3.0.3303" media="all"></head>
<body class="childrenBody">
	<form  style="width:100%;" class="layui-form" >
		<div class="layui-form-item">
				<div class="layui-form-item" class="form-inline" > 
			    <label for="name" class="layui-form-label" class="userStatus" lay-filter="userStatus">销售时间</label>
			   	<div class="layui-input-block">
			   	<input type="text" id="tb"  name="dealTime" autocomplete="off" class="layui-input userName" class="form-control"  placeholder="请输入销售时间" style="width: 258px;"/>
				</div>
			   </div>
			   
			     <div class="layui-col-md3" >
			    <label class="layui-form-label">人员</label>
				<div class="layui-input-block">
					<select name="staId.sId" id="staId" class="form-control" style="width: 200px;" class="userStatus" lay-filter="sta">
						<option value="0">==请选择==</option>	 
				   </select>
				</div>
		 	    </div>
			   
			    <div class="layui-col-md3"  >
			    <label class="layui-form-label">车辆</label>
				<div class="layui-input-block">
					<select name="carId.id" id="ci" class="form-control" style="width: 200px;" class="userStatus" lay-filter="ci">
						<option value="0">==请选择==</option>	 
				   </select>
				</div>
		 	    </div>
			   
			<div class="layui-col-md3" >
			<label class="layui-form-label">预收金额</label>
			<div class="layui-input-block">
				<input name="advance"  class="layui-input" placeholder="预收金额" style="width: 300" autocomplete="off" lay-verify="required"/>
				
				</div>
		</div>
		
		
		<div class="layui-col-md3">
			    <label class="layui-form-label">实收金额</label>
				<div class="layui-input-block">
					<input name="netReceipts" class="layui-input" placeholder="请输入实收金额" style="width: 300" autocomplete="off" lay-verify="required"/>
				</div>
		    </div>
	
		<div class="layui-col-md3">
			    <label class="layui-form-label">应收金额</label>
				<div class="layui-input-block">
					<input name="receivable" class="layui-input" placeholder="请输入应收金额" style="width: 300" autocomplete="off" lay-verify="required"/>
				</div>
		    </div>

		
		<div class="layui-col-md3"> 
			    <label for="name" class="layui-form-label" class="userStatus" lay-filter="userStatus">客户</label>
			   	<div class="layui-input-block">
			   	<input type="text" name="cusId" autocomplete="off" class="layui-input userName" class="form-control"  placeholder="请输入客户姓名" style="width: 258px;"/>
				</div>
			   </div>
	
		<div class="layui-form news_list">
	 

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addUser">立即提交</button>
		    </div>
		</div>
	</form>

		
	  <script type="text/javascript">
		layui.use(['form','layer','jquery','laydate'], function(){
		  var laydate = layui.laydate,form = layui.form,
	      layer = parent.layer === undefined ? layui.layer : parent.layer,
	      $ = layui.jquery;

		  //常规用法
		  laydate.render({
		    elem: '#tb',
		    type: 'date'
		  });
		
		//查询员工	
		  $.post("../../../Staffinfo/selUser",function(dt){
			  $(dt).each(function(i,q){
			  var $option=$("<option value='"+q.sId+"'>"+q.sName+"</option>");
			  $option.appendTo($("#staId"));
			  });
			  form.render();
			},"json");
		
		$.post("${pageContext.request.contextPath}/carC/querycar",function(res){
		
			$(res).each(function(a,d){
				
				 var $option=$("<option value='"+d.id+"'>"+d.name+"</option>");
				  $option.appendTo($("#ci"));
			});
			form.render();
		},"json");
		
		
			//监听表单提交
			form.on('submit(addUser)',function(){
				var formData=$("form").serialize();	
				//alert(formData);
				//$.post("../../../Carsal/insert",formData,function(res){
					
					
				//});
			 	$.ajax({
					url:"${pageContext.request.contextPath}/Carsal/insert",
					type:"post",
					async:false,
					data:$("form").serialize(),
					dataType:"text",
					success:function(res){
						if(res>0){
							layer.msg("购买成功");
							var mylay = parent.layer.getFrameIndex(window.name);						 
							parent.layer.close(mylay);
						}else{
							layer.msg("购买失败");
						}
						
					}
				});
				
				
			});
  
		});
	
	</script>
</body></html>