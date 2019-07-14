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
		      
				  $("#city1").click(function(){
					    var zhi=$(this).val();
					   $.ajax({
					        url:'rec/post?post_id='+zhi,
					        dataType:'json',
					        async: true ,
					        success:function(data){
					        	$("#city").html("<option value=''>选择职位</option>");
					        	
					            $.each(data.data,function(index,item){
						        	 $('#city').append(new Option(item.pName,item.pId));
						        	 form.render('select'); //这个很重要
					            })
					        } 
					   });
					});
				
				
  			//监听表单提交
			form.on('submit(add)',function(){
				var formData=$("form").serialize();
				
				$.post("rec/add",formData,function(res){
					if(res>0){
						layer.msg("发布成功",{time:2000},function(){
							//重新加载表格
							parent.layui.table.reload('tb');
							//关闭当前弹层
							var index = window.parent.layer.getFrameIndex(window.name);
							window.parent.layer.close(index);
						});
					}else{
						layer.msg("发布招聘失败");
					}
				});
				return false;
			});
  			
			laydate.render({
			    elem: '#start_time'
			    ,type: 'datetime'
			  });
			  laydate.render({
			    elem: '#end_time'
			    ,type: 'datetime'
			  });
  		})
  		
  </script>
  </head>
  
  <body>
  		<form class="">
    	<div class="layui-form-item" style="margin-top: 20px; width:410px;">
	    
		    <div class="layui-input-block">
			     <label >部门名称：</label> 
			     <select lay-verify="required" style="margin-top: 10px; border:1px solid #e6e6e6; width:200px; height:38px;" id="city1">
			     	<option id="tt" value="1">选择部门</option>
				      <c:forEach items="${br}" var="b">
				        <option value="${b.bId}">${b.bName}</option>
				        </c:forEach>
				      </select>
			    </div>
		  </div> 
		<div class="layui-form-item" style="margin-top: 20px; width:410px;">
	    
		    <div class="layui-input-block">
			     <label>职位名称：</label> 
			     <select name="post.pId" lay-verify="required" style="margin-top: 10px; border:1px solid #e6e6e6; width:200px; height:38px;" id="city">
			     	 <option id="tt" ></option>
				      <c:forEach items="${po}" var="p">
				        <option value="${p.pId}">${p.pName}</option>
				        </c:forEach>
				      </select>
			    </div>
		  </div>
  		</div>
  		<div class="layui-form-item" style="margin-top: 20px; width:410px;">
	    	<div class="layui-input-block">
			     <label>学&nbsp; &nbsp; &nbsp; &nbsp;历：</label> 
				     <select name="education" lay-verify="required" style="margin-top: 10px; border:1px solid #e6e6e6; width:200px; height:38px;" id="city">
				     	 <option id="education_t" >高中</option>
				     	 <option id="education_t" >大专</option>
				     	 <option id="education_t" >本科</option>
				     	 <option id="education_t" >硕士</option>
				     	 <option id="education_t" >博士</option>
					 </select>
			    </div>
		  </div>
  		</div>
  		 <div class="layui-input-block">
	    	<label>开始时间：</label>
			<div class="layui-input-inline">
			        <input type="text" class="layui-input" name="start_time" id="start_time" placeholder="yyyy-MM-dd HH:mm:ss">
			</div>
	    </div> <br/>
	    <div class="layui-input-block">
	    	<label>结束时间：</label>
			<div class="layui-input-inline">
	    		<input type="text" class="layui-input" name="end_time" id="end_time" placeholder="yyyy-MM-dd HH:mm:ss"	>
	    	</div>
	    </div>
		<div class="layui-form-item" style="margin-top: 20px; width:410px;">
	    	<div class="layui-input-block">
			     <label>最低薪资：</label> 
				     <select name="salarymin" lay-verify="required" style="margin-top: 10px; border:1px solid #e6e6e6; width:200px; height:38px;" id="city">
				     	 <option id="salary_min_t" >1000</option>
				     	 <option id="salary_min_t" >1500</option>
				     	 <option id="salary_min_t" >2000</option>
				     	 <option id="salary_min_t" >2500</option>
				     	 <option id="salary_min_t" >3000</option>
				     	 <option id="salary_min_t" >3500</option>
				     	 <option id="salary_min_t" >4000</option>
				     	 <option id="salary_min_t" >4500</option>
				     	 <option id="salary_min_t" >5000</option>
				     	 <option id="salary_min_t" >5500</option>
				     	 <option id="salary_min_t" >6000</option>
					 </select>
			    </div>
		  </div>
  		</div>
  		<div class="layui-form-item" style="margin-top: 20px; width:410px;">
	    	<div class="layui-input-block">
			     <label>最高薪资：</label> 
				     <select name="salary_max" lay-verify="required" style="margin-top: 10px; border:1px solid #e6e6e6; width:200px; height:38px;" id="city">
				     	 <option id="salary_max_t" >7000</option>
				     	 <option id="salary_max_t" >7500</option>
				     	 <option id="salary_max_t" >8000</option>
				     	 <option id="salary_max_t" >8500</option>
				     	 <option id="salary_max_t" >9000</option>
				     	 <option id="salary_max_t" >9500</option>
				     	 <option id="salary_max_t" >10000</option>
				     	 <option id="salary_max_t" >10500</option>
				     	 <option id="salary_max_t" >11000</option>
				     	 <option id="salary_max_t" >11500</option>
				     	 <option id="salary_max_t" >12000</option>
					 </select>
			    </div>
		  </div>
  		</div>
	    <div class="layui-input-block">
		    	<label >招聘人数：</label>
		    	<div class="layui-input-inline">
			    	<input name="sum" id="sum" style="margin-top: 10px; border:1px solid #e6e6e6; width:200px; height:38px;"/>
			    </div>
		
		</div><br/>
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit lay-filter="add">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	</form>
  </body>
</html>
