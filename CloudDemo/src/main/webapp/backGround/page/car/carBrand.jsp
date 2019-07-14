<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>文章列表--layui后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../backGround/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="../backGround/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="../backGround/css/news.css" media="all" />
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加品牌</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
	</blockquote>
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="50">
				<col width="9%">
				<col width="9%">
				<col>
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="15%">
		    </colgroup>
		    <thead>
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose">
					<div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i class="layui-icon"></i></div>
					</th>
					<th style="text-align:left;">首字母</th>
					<th>品牌名称</th>
					<th>图片</th>
					<th>是否热门</th>
					<th>发布时间</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody class="news_content">
		    		<c:forEach items="${pm.list}" var="c">
		    	<tr>
		    		<td><input type="checkbox" name="checked" lay-skin="primary" lay-filter="choose"><div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><i class="layui-icon"></i></div>
		    		</td>
		    		<td>
		    			${c.initials}
		    		</td>
		    		<td>
		    			${c.name}
		    		</td>
		    		<td>
		    			<img alt="" src="..${c.pic_url}"> 
		    		</td>
		    		<td>
		    			${c.is_hot}
		    		</td>
		    		<td>
		    			${c.create_time}
		    		</td>
		    		<td>
		    			<a class="layui-btn layui-btn-mini news_edit"><i class="iconfont icon-edit"></i> 编辑</a>
					  <a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id=""><i class="layui-icon">&#xe640;</i> 删除</a>
		    		</td>
		    	</c:forEach>
		    	</tr>
		    	<tr>
			  	<td colspan="10" style="text-align: center;">
			  		共找到${pm.sumCount }条数据&nbsp;&nbsp;&nbsp;第${pm.currentPage }/${pm.sumPage }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  		<a href="${pageContext.request.contextPath}/carC/show?pageNo=${pm.firstPage}">首页</a>
			  		<a href="${pageContext.request.contextPath}/carC/show?pageNo=${pm.upPage}">上一页</a>
			  		<a href="${pageContext.request.contextPath}/carC/show?pageNo=${pm.nextPage}">下一页</a>
			  		<a href="${pageContext.request.contextPath}/carC/show?pageNo=${pm.lastPage}">尾页</a>
			  	</td>
			  </tr>
		    </tbody>
		</table>
	</div>
	<div id="page"></div>
	<script type="text/javascript" src="../backGround/layui/layui.js"></script>
	<script type="text/javascript" src="../backGround/page/news/newsList.js"></script>
</body>
</html>