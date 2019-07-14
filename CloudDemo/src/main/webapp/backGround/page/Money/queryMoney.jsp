<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="utf-8">
	<title>用户总数--layui后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../backGround/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="../backGround/css/font_eolqem241z66flxr.css" media="all">
	<link rel="stylesheet" href="../backGround/css/user.css" media="all">
	
<link id="layuicss-skinlayercss" rel="stylesheet" href="http://127.0.0.1:8020/%E5%90%8E%E5%8F%B0%E7%95%8C%E9%9D%A2mo/layui/css/modules/layer/default/layer.css?v=3.0.3303" media="all"></head>
<script type="text/javascript" src="../backGround/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['table','layer'],function(){
		var table=layui.table,$=layui.$,layer =layui.layer ;	
	});

</script>

<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn" >查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal usersAdd_btn" href="../backGround/page/Money/insertMoney.jsp">发放工资</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
		<div class="layui-inline">
			<div class="layui-form-mid layui-word-aux">　本页面刷新后除新添加的文章外所有操作无效，关闭页面所有数据重置</div>
		</div>
	</blockquote>
	
		
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="50px">
				<col width="70px">
				<col width="80px">
				<col width="70px">
				<col width="70px">
				<col width="80px">
				<col width="80px">
				<col width="80px">
				<col width="80px">
				<col width="80px">
				<col width="80px">
				<col width="80px">
				<col width="80px">
				<col width="80px">
				<col width="80px">
				<col width="100px">
				<col width="80px">
		    </colgroup>
		    <thead>
				<tr>
					<th>序号</th>
					<th>员工Id</th>
					<th>员工姓名</th>
					<th>请假扣款</th>
					<th>迟到扣款</th>
					<th>未打卡扣款</th>
					<th>个税扣除</th>
					<th>绩效</th>
					<th>补贴</th>
					
					<th>社保</th>
					<th>基本工资</th>
					<th>应发金额</th>
					<th>实发金额</th>
					
					<th>发放方式</th>
					<th>发放时间</th>
					<th>出纳人</th>
				</tr> 
		    </thead>
		    <c:forEach items="${sa.list}" var="s">
		    <tr>
					<td>${s.sId }</td>
					<td>${s.staId.sId }</td>
					<td>${s.staId.sName }</td>
					<td>${s.askingLeave}</td>
					<td>${s.askingLate}</td>
					<td>${s.askingUnpunched}</td>
					<td>${s.actualMOney}</td>
					
					<td>${s.merits}</td>
					<td>${s.subsidy}</td>
					
					<td>${s.staId.sSocial}</td>
					<td>${s.staId.sBasepay}</td>
					<td>${s.amountMoney}</td>
					<td>${s.actualMOney}</td>
					
					
					
					<td>${s.methodMoney}</td>			
					<td>
						<fmt:formatDate value="${s.paymenttime}" pattern="yyyy-MM-dd" var="paymenttime"/>
			  				${paymenttime}
			  		</td>
					<td>${s.cashierId.sName}</td>
		    </tr>
		    </c:forEach>
		      <tr>
			  	<td colspan="17" style="text-align: center;">
			  		共找到${sa.sumCount}条数据&nbsp;&nbsp;&nbsp;第${sa.currentPage }/${sa.sumPage}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  		<a href="${pageContext.request.contextPath}/SalaryC/ShowSal.do?pageNo=${sa.firstPage}">首页</a>
			  		<a href="${pageContext.request.contextPath}/SalaryC/ShowSal.do?pageNo=${sa.upPage}">上一页</a>
			  		<a href="${pageContext.request.contextPath}/SalaryC/ShowSal.do?pageNo=${sa.nextPage}">下一页</a>
			  		<a href="${pageContext.request.contextPath}/SalaryC/ShowSal.do?pageNo=${sa.lastPage}">尾页</a>
			  	</td>
			  </tr>
		    <tbody class="users_content"></tbody>
		</table>
	</div>
	
	
	
</body>
</html>