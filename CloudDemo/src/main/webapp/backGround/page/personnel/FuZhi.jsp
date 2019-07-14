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
    
    <title>My JSP 'update.jsp' starting page</title>
    
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
	  </head>
  <script type="text/javascript">
  		layui.use(['form','layer'],function(){
  			var form = layui.form,$=layui.$,layer=layui.layer;
  			
  			     //从父层获取值，json是父层的全局js变量。eval是将该string类型的json串变为标准的json串
		        var j = eval('('+parent.json+')');
		         $("#id").val(j.sId); 
		         
		         var ids=j.sId;
		         $.post("Staffinfo/staffbyid?id="+ids,function(res){
		        	 $("#id").val(res.sId);
		        	 $("#S_name").val(res.sName);
			       	 $("#S_login").val(res.sEntrytime);
			      
					},"json");
		         
		       	
  			 $.post("Staffinfo/querbum",function(res){
				$(res).each(function(i,q){
					var $option = $("<option value='"+q.bId+"'>"+q.bName+"</option>");
					if(j.sPosId.pBId.bId==q.bId){
						var $option = $("<option selected='selected' value='"+q.bId+"'>"+q.bName+"</option>");
					}
					$option.appendTo($("#staff"));
				});
				form.render();
			},"json");
  			$.post("Staffinfo/querpost",function(res){
				$(res).each(function(i,q){
					var $option = $("<option value='"+q.pId+"'>"+q.pName+"</option>");
					if(j.sPosId.pId==q.pId){
						var $option = $("<option selected='selected' value='"+q.pId+"'>"+q.pName+"</option>");
					}
					$option.appendTo($("#post"));
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
				    form.render();
				});  
		     
		         
		         
		        form.on('submit(add)',function(){
  				var formData =  $("form").serialize();
  				$.post("Staffinfo/upDiaoGang",formData,function(res){
  					if(res>0){
  						layer.msg("修改成功",{time:500},function(){
  							parent.layui.table.reload('tb');
  							var index = window.parent.layer.getFrameIndex(window.name);
  							window.parent.layer.close(index);
  						})
  					}else{
  						layer.msg("修改失败");
  					}
  				})
  				return false;
  			})
  			
  		})
  		
  </script>
  <body>
 
    <form  class="layui-form">
    	<input id="id" name="sId" type="hidden"/>
  		<div class="layui-form-item"style="margin-top: 20px; width:250px;" >
  			<label class="layui-form-label">部门选择：</label>
		    <div class="layui-input-block">
		      <select id="staff" name="staff" lay-filter="test1" >
     				<option  id="a"  value="0">请选择职位</option>
     			</select>
		    </div>
  		</div>
  		<div class="layui-form-item" style="margin-top: 20px; width:250px;">
  			 <label class="layui-form-label">职位选择：</label>
		    <div class="layui-input-block">
                    <select id="post" name="sPosId.pId">
     				<option  id="b"  value="0">请选择职位</option>
     			</select>
                </div>
  		</div>
 		
  		<div class="layui-form-item">
  			<div class="layui-input-inline" >
  				<button class="layui-btn" lay-submit lay-filter="add">提交</button>
  				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
  			</div>
  		</div>
	</form>
  </body>
</html>
