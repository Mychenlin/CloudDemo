<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin:0;padding:0;}
.clears{ clear:both;}
/*messages*/
.layuiinputinline {
    float: left;
    width: 95px;
    margin-right: 10px;
}
.messages{padding:15px 0;}
.messages input,.messages select,.messages textarea{margin:0;padding:0; background:none; border:0; font-family:"Microsoft Yahei";}
.messlist {height:30px;margin-bottom:10px;}
.messlist label{float:left;width:100px; height:30px; font-size:14px; line-height:30px; text-align:right;padding-right:10px;}
.messlist input{float:left;width:300px;height:28px;padding-left:5px;border:#ccc 1px solid;}
.messlist.textareas{ height:auto;}
.messlist textarea{float:left;width:400px; height:110px;padding:5px;border:#ccc 1px solid;}
.messlist.yzms input{width:100px;}
.messlist.yzms .yzmimg{ float:left;margin-left:10px;}
.messsub{padding:0px 0 0 110px;}
.messsub input{width:100px; height:35px; background:#ddd; font-size:14px; font-weight:bold; cursor:pointer;margin-right:5px}
.messsub input:hover{ background:#f60;color:#fff;}

</style>

<link rel="stylesheet" href="../backGround/layui1/layui/css/layui.css" />
	<script type="text/javascript" src="../backGround/layui1/layui/layui.js"></script>
	<script type="text/javascript">
  		layui.use(['form','element','layer','laydate'],function(){
  			var form = layui.form,$=layui.$,layer=layui.layer,element = layui.element;
  			var laydate = layui.laydate;
  			$("#a_type").val("预约试驾");
  		//加载地区数据
  			var cs=null;
 			$.ajax({
			    type: "post",
			     url:'/CloudDemo/backGround/json/dizisj.json',
			    cache: false,
			    dataType : "json",
			    success: function(data){
			    	$.each(data,function(index,item){
			        	$("#quiz1").append('<option value='+item.name+'>'+item.name+'</option>');
			        	form.render('select'); //这个很重要
		            })
			    	
               }
           }); 

 			form.on('select(test)', function(){
 				  	cs=$(this).text();
					$("#quiz2").empty();
 					$("#quiz2").append('<option value="">请选择市</option>');
				   	$.ajax({
				        url:'/CloudDemo/backGround/json/dizisj.json',
				        dataType:'json',
				        async: true ,
				        success:function(data){
				            $.each(data,function(index,item){
				            	if(item.name==cs){
				            		$.each(item.data,function(index,item){
				            			
				            			$("#quiz2").append('<option value='+item.name+'>'+item.name+'</option>');
				            			form.render('select'); //这个很重要
				            		})
				            	}
				            	
				            })
				        } 
				   });
 				
 			});
 			

 			form.on('select(test1)', function(){
				 var dz=$(this).text();
				 $("#quiz3").empty();
				 $("#quiz3").append('<option value="">请选择县/区</option>');
				   $.ajax({
				        url:'/CloudDemo/backGround/json/dizisj.json',
				        dataType:'json',
				        async: true ,
				        success:function(data){
				            $.each(data,function(index,item){
				            	if(item.name==cs){
				            		$.each(item.data,function(index,item){
				            			$.each(item.data,function(index,item){
				            				
				            				$("#quiz3").append('<option value='+item.name+'>'+item.name+'</option>');
				            				form.render('select'); //这个很重要
					            		})
				            		})
				            	}
				            	
				            })
				        } 
				   });
				
			});
			form.on('submit(add)',function(){
				var formData=$("form").serialize();
				
				$.post("../appo/add",formData,function(res){
					if(res>0){
						layer.msg("发布成功",{time:2000},function(){
							
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
  			
  		})
  		
  </script>

</head>

<body>
<!--栏目-->

<form action="#" method="get" class="layui-form">

	<input id="a_type" name="a_type" type="hidden"/>
	<input id="chexing" name="C_info.C_Models" type="hidden"/>
     <div class="messlist">
      <label>姓名</label>
      <input type="text" placeholder="姓名" name="C_info.C_name" />
      <div class="clears"></div>
     </div>
     <div class="messlist">
      <label>电子邮件</label>
      <input type="text" placeholder="电子邮件" name="C_info.C_Email"/>
      <div class="clears"></div>
     </div>
     <div class="messlist">
      <label>手机号</label>
      <input type="text" placeholder="手机号" name="C_info.C_phone" />
      <div class="clears"></div>
     </div>
     
      <div class="layui-form-item">
    <label class="layui-form-label">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</label>
    <div class="layuiinputinline" >
      <select name="C_info.C_place" id="quiz1" lay-filter="test" >
        <option value="">请选择省</option>
      </select>
    </div>
    <div class="layuiinputinline">
      <select name="C_info.C_place" id="quiz2" lay-filter="test1">
        <option value="">请选择市</option>
      </select>
    </div>
    <div class="layuiinputinline" style="width：150px;">
      <select name="C_info.C_place" id="quiz3">
        <option value="">请选择县/区</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
      <label class="layui-form-label">留言内容</label>
      <div class="layui-input-block" style="width：150px;">
      		<textarea placeholder="留言内容" class="layui-textarea" name="a_remark"></textarea>
      </div>
   </div>
   
   
     <div class="messsub">
     
     
    
      <input id="y" type="submit" value="提交" lay-submit lay-filter="add" style="background:#00a3eb;color:#fff;" />
	  
      <input type="reset" value="重填" />
     </div>
</form>	 

</body>
</html>
