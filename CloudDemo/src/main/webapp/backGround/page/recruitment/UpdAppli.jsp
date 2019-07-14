<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
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
  		layui.use(['form','layer','laydate'],function(){
  			var form = layui.form,$=layui.$,layer=layui.layer;
  			var laydate = layui.laydate;
  			 //从父层获取值，json是父层的全局js变量。eval是将该string类型的json串变为标准的json串
		        var j = eval('('+parent.json+')');
		        
		        $("#id").val(j.A_id); 
		        $("#name").text(j.A_name);
		        $("#sex").text(j.A_sex);
		       	$("#S_birthday").text(j.A_birthday);
		        $("#S_natio").text(j.A_natio);
		       	$("#S_place").text(j.A_present);
		       	$("#S_blood").text(j.A_blood);
		       	$("#S_idcate").text(j.A_idcate);
		        $("#S_phone").text(j.A_emIP);
		        $("#S_marital").text(j.A_marital);
		        $("#S_politics").text(j.A_politics);
		        $("#S_maxeducation").text(j.A_maxeducation);
		        $("#S_maxdegree").text(j.A_maxdegree);
		        $("#sta_present").text(j.A_place);
		        $("#S_Email").text(j.A_Email);
		        $("#S_Englist").text(j.A_Englist);
		        $("#S_computer").text(j.A_computer);
		        $("#A_Learning").text(j.A_Learning_experience);
		        $("#A_Job_resume").text(j.A_Job_resume);
		       	//请求部门信息
		       		$.ajax({
				        url:'/CloudDemo/rec/showbm',
				        dataType:'json',
				        async: true,
				        success:function(data){
				        	$(data.data).each(function(i,q){
				        		console.log(q.bName);
								var $option = $("<option value='"+q.bId+"'>"+q.bName+"</option>");
								console.log($option);
								$option.appendTo($("#city1"));
							});
							form.render();
				        	
				        }
				   }); 
		       	 
				   
		        form.on('submit(update)',function(){
		        	if(j.A_state==0){
		        		var formData =  $("form").serialize();
		  				$.post("appli/updapp",formData,function(res){
		  					if(res>0){
		  						layer.msg("录用成功",{icon:1,time:500},function(){
		  							parent.layui.table.reload('tb');
		  							var index = window.parent.layer.getFrameIndex(window.name);
		  							window.parent.layer.close(index);
		  						})
		  					}else{
		  						layer.msg("录用失败");
		  					}
		  				})
		  				
		        	}else if(j.A_state==1){
		        		layer.msg("当前应聘者已被录用",{icon:2,time:3000})
		        		
		        	}else if(j.A_state==2){
		        		layer.msg("当前应聘者不能被录用",{icon:2,time:3000})
		        	}
	  				
		        	return false;
	  			});
		        form.on('submit(blu)',function(){
		        	if(j.A_state==0){
		        		var formData =  $("form").serialize();
		  				$.post("appli/updblu",formData,function(res){
		  					if(res>0){
		  						layer.msg("驳回成功",{icon:1,time:500},function(){
		  							parent.layui.table.reload('tb');
		  							var index = window.parent.layer.getFrameIndex(window.name);
		  							window.parent.layer.close(index);
		  						})
		  					}else{
		  						layer.msg("驳回失败");
		  					}
		  				})
		  				
		        	}else if(j.A_state==1){
		        		layer.msg("当前应聘者已被录用",{icon:2,time:3000})
		        	}else if(j.A_state==2){
		        		layer.msg("当前应聘者已被驳回",{icon:2,time:3000})
		        	}
		        	return false;
	  			})
  			
  		})
  		
  </script>
  </head>
  
  <body>
  		<form action="" >
			<table class="layui-table" id="tb">
				<input type="hidden" name="A_id" id="id"/>
				<tr>
					<th >姓名</th>
					<td   id="name"></td>
					<th >性别</th>
					<td id="sex"></td>
				</tr>
				<tr>
					<th>出生年月</th>
					<td  id="S_birthday"> </td>
					<th>民族</th>
					<td id="S_natio"></td>
					
				</tr>
				<tr>
					<th>籍贯</th>
					<td id="S_place"></td>
					<th>血型</th>
					<td  id="S_blood"></td>
				</tr>
				<tr>
					<th>身份证号</th>
					<td  id="S_idcate"></td>
					<th>联系电话</th>
					<td  id="S_phone"></td>
					
				</tr>
				<tr>
					<th>婚姻状况</th>
					<td  id="S_marital"> </td>
					<th>政治面貌</th>
					<td id="S_politics"></td>
					
				</tr>
				<tr>
					<th>最高学历</th>
					<td colspan="3" id="S_maxeducation"> </td>
				</tr>
				<tr>
					<th>最高学位</th>
					<td colspan="3" id="S_maxdegree"> </td>
				</tr>
				<tr>
					<th>居住地址</th>
					<td colspan="3" id="sta_present"></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td colspan="3" id="S_Email"></td>
				</tr>
				
				<tr>
					<th>外语等级</th>
					<td  id="S_Englist"></td>
					<th>计算机等级</th>
					<td  id="S_computer"></td>
				</tr>
				<tr>
					<th>学习经历</th>
					<td colspan="3" id="A_Learning" width="200px">
					</td>
				</tr>
				<tr>
					<th>工作经历</th>
					<td colspan="3" id="A_Job_resume" width="200px">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="layui-input-block">
					      <button class="layui-btn" lay-submit lay-filter="update">通过审核</button>
					      <button lay-submit lay-filter="blu" class="layui-btn layui-btn-primary">驳回</button>
					    </div>
					</td>
				</tr>
			</table>
  </body>
</html>
