<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backGround/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backGround/layui1/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/backGround/layui1/layui/layui.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/backGround/js/jquery-1.4.1.js" ></script>
	
	
</head>
<body>
	<div id="out">
		<form method="post" action="">
		<input type="hidden" value="${se.staId.sId}" name="sId" class="form-control"  placeholder="请输入 id" style="width: 200px;" />
			<div class="layui-col-md3">
			    <label for="name" class="layui-form-label">姓名:</label>
			<div class="layui-input-block">
			    <input type="text" value="${se.staId.sName }" name="sName"  class="form-control"  placeholder="请输入 姓名" style="width: 200px;" />
			</div>	
			</div>
			<div class="layui-col-md3" >
			<label class="layui-form-label">方式</label>
			<div class="layui-input-block">
					<select name="methodMoney" class="form-control" style="width: 200px;"  lay-filter="methodMoney" >
						<option value="0">==请选择==</option>	 
						<option value="现金">现金</option>	 
						<option value="支付宝">支付宝</option>	 
						<option value="微信">微信</option>	
				   </select>
				</div>
		</div>
			
			<div class="layui-col-md3" >
			<label class="layui-form-label">出纳人</label>
			<div class="layui-input-block">
					<select name="sId" id="first" class="form-control" style="width: 200px;" class="first" lay-filter="first" >
						<option value="0">==请选择==</option>	 
				   </select>
				</div>
		</div>
		
		
	<div class="layui-form-item">
    <div class="layui-inline">
      <label for="name" class="layui-form-label">绩效</label>
      <div class="layui-input-inline">
        <input type="text" name="merits" value="${se.merits }" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label for="name" class="layui-form-label" style="margin-left:24px">补贴</label>
      <div class="layui-input-inline">
        <input type="text" name="subsidy" value="${se.subsidy }" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label for="name" class="layui-form-label" style="margin-left:18px">请假扣款</label>
      <div class="layui-input-inline">
        <input type="text" name="askingLeave" value="${se.askingLeave }" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
		
		
		<div class="layui-form-item">
    <div class="layui-inline">
      <label for="name" class="layui-form-label">迟到扣款</label>
      <div class="layui-input-inline">
        <input type="text" name="askingLate" value="${se.askingLate }" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label for="name" class="layui-form-label" style="margin-left:24px">未打卡扣款</label>
      <div class="layui-input-inline">
        <input type="text" name="askingUnpunched" value="${se.askingUnpunched }" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label for="name" class="layui-form-label" style="margin-left:18px">旷工扣款</label>
      <div class="layui-input-inline">
        <input type="text" name="askingAbsenteeism" value="${se.askingAbsenteeism }" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  
  
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label for="name" class="layui-form-label">个税扣款</label>
      <div class="layui-input-inline">
        <input type="text" name="totalCompany" value="${se.totalCompany }" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label for="name" class="layui-form-label" style="margin-left:24px">社保</label>
      <div class="layui-input-inline">
        <input type="text" name="staId.sSocial" value="${se.staId.sSocial}" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label for="name" class="layui-form-label" style="margin-left:18px">基本工资</label>
      <div class="layui-input-inline">
        <input type="text" name="staId.sBasepay" value="${ se.staId.sBasepay }" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label for="name" class="layui-form-label">应发工资</label>
      <div class="layui-input-inline">
        <input type="text" name="amountMoney" value="${se.amountMoney}" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label for="name" class="layui-form-label" style="margin-left:24px">实发工资</label>
      <div class="layui-input-inline">
        <input type="text" name="actualMOney" value="${ se.actualMOney}" lay-verify="required|number" class="form-control"  style="width: 200px;margin-left:27px" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit  lay-filter="addUser">立即发放</button>
		    </div>
		</div>
		
		</form>
	</div>
	<script>
		layui.use(['form','layer','jquery','laydate','table'],function(){
		  var laydate = layui.laydate,form = layui.form,
	      layer = parent.layer === undefined ? layui.layer : parent.layer,
	      $ = layui.jquery,table=layui.table;

		  //常规用法:时间
		  laydate.render({
		    elem: '#tb',
		    type: 'date'
		  });
			//查询出纳人数据
			   $.post("../Staffinfo/querysa",function(dt){
				  $(dt).each(function(i,q){
				  var $option=$("<option value='"+q.sId+"'>"+q.sName+"</option>");
				  	$option.appendTo($("#first"));
				  });
				  form.render();
				},"json"); 
		 
		  //监听表单提交
		  form.on('submit(addUser)',function(){
			//表单序列化
			var FormDa=$("form").serialize();
			$.ajax({
				url:"${pageContext.request.contextPath}/SalaryC/addMoney",
				type:"post",
				async:false,
				data:$("form").serialize(),
				dataType:"text",
				success:function(res){
					if(res>0){
						layer.msg("添加成功");
						var mylay = parent.layer.getFrameIndex(window.name);

						parent.layer.close(mylay);
					}else{
						layer.msg("添加失败");
					}
					
				}
			});
			/* $.post("${pageContext.request.contextPath}/SalaryC/addMoney",FormDa,function(res){
				console.log(res);
				var mylay = parent.layer.getFrameIndex(window.name);
				 
				parent.layer.close(mylay);
	        }); */
			
		  });
			
			
		  
		});
	</script>
</body>
</html>