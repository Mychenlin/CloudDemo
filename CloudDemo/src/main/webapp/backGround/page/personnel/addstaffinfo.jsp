<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addbrach.jsp' starting page</title>
    
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
		layui.use(['form','layer','laydate','upload'],function(){
			var form=layui.form,$=layui.$,layer=layui.layer,laydate = layui.laydate,upload = layui.upload;
			 //执行一个laydate实例
			  laydate.render({
			    elem: '#test1' //指定元素
			     
			  });
			  //执行一个laydate实例
			  laydate.render({
			    elem: '#test3' //指定元素
			  });
			  var uploadInst = upload.render({
			    elem: '#test2' //绑定元素
			    ,url: '/upload/' //上传接口
			    ,done: function(res){
			      //上传完毕回调
			    }
			    ,error: function(){
			      //请求异常回调
			    }
			  });
			   $.post("Staffinfo/querbum",function(res){
				$(res).each(function(i,q){
					var $option = $("<option value='"+q.bId+"'>"+q.bName+"</option>");
					$option.appendTo($("#staff"));
				});
				form.render();
			},"json");
			  //下拉框监听事件
			  form.on('select(test1)', function(data){
				    $.ajax({
				        url:'Staffinfo/querpostById?Id='+data.value,
				        dataType:'json',
				        async: true,
				        success:function(data){
				        	if(data==null){
				        		$("#post option").remove();
				        	}
				            $("#post").html("<option value=''>请选择职位</option>");
				            $.each(data,function(index,item){
				            	
				            	 $('#post').append(new Option(item.pName,item.pId));//往下拉菜单里添加元素
				                 console.log(item.post_name);
				                form.render('select'); //这个很重要
				            })
				        }
				   }); 
				  
				});  
			//监听表单提交
			form.on('submit(add)',function(){
				var formData=$("form").serialize();
				
				$.post("Staffinfo/addStaffinfo",formData,function(res){
					if(res>0){
						layer.msg("添加职位成功",{time:2000},function(){
							//重新加载表格
							parent.layui.table.reload('tb');
							//关闭当前弹层
							var index = window.parent.layer.getFrameIndex(window.name);
							window.parent.layer.close(index);
						});
					}else{
						layer.msg("添加职位失败");
					}
				});
				return false;
			});
					
		});
	</script>
	
  </head>
  
  <body>
    <form class="layui-form" method="post" action="">
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">员工名称：</label>
  			<div class="layui-input-inline">
  				<input name="sName" class="layui-input" placeholder="请输入员工名称" style="width: 300" autocomplete="off" lay-verify="required"/>
  				
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">员工性别：</label>
		    <div class="layui-input-block">
		      <input type="radio" name="sSex" value="男" title="男">
		      <input type="radio" name="sSex" value="女" title="女" checked>
		    </div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">联系电话：</label>
  			<div class="layui-input-inline">
  				<input name="sIP" class="layui-input" placeholder="请输入联系电话" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
  		<div class="layui-form-item">
  			<label class="layui-form-label">出生年月：</label>
  			<div class="layui-input-inline"> 
			  <input name="sBirthdate" type="text" class="layui-input" id="test1" placeholder="请输入出生年月"  lay-verify="required" style="width:300px">
			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">入职时间：</label>
  			<div class="layui-input-inline">
  				<input name="sEntrytime" type="text" class="layui-input" id="test3" placeholder="请输入入职时间" style="width:300px">
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20px; width:410px;" >
  			<label class="layui-form-label">部门选择：</label>
		    <div class="layui-input-block">
		      <select id="staff" name="staff" lay-filter="test1" >
     				<option  id="a"  value="0">请选择部门</option>
     			</select>
		    </div>
  		</div>
  		<div class="layui-form-item" style="margin-top: 20px; width:410px;">
  			 <label class="layui-form-label">职位选择：</label>
		    <div class="layui-input-block">
                <select id="post" name="sPosId.pId">
     				<option  id="b"  value="0">请选择职位</option>
     			</select>
                </div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">登陆密码：</label>
  			<div class="layui-input-inline">
  				<input name="sPassword" class="layui-input" placeholder="请输入登陆密码" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
 		
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">基本工资：</label>
  			<div class="layui-input-inline">
  				<input name="sBasepay" class="layui-input" placeholder="请输入员工基本工资" style="width: 300" autocomplete="off"  />
  			</div>
  		</div>
  		<div class="layui-form-item"style="margin-top: 20">
  			<label class="layui-form-label">员工社保：</label>
  			<div class="layui-input-inline">
  				<input name="sSocial" class="layui-input" placeholder="请输入员工社保" style="width: 300" autocomplete="off" lay-verify="required"/>
  			</div>
  		</div>
  		
 		
  		<div class="layui-form-item">
  			<div class="layui-input-inline" style="padding-left:150px;">
  				<button class="layui-btn" lay-submit lay-filter="add">提交</button>
  				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
  			</div>
  		</div>
  	</form>
 
  </body>
</html>
