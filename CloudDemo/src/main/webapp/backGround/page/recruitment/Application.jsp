<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../backGround/layui1/layui/css/layui.css" />
<script type="text/javascript" src="../../../backGround/layui1/layui/layui.js"></script>
	
<script type="text/javascript">
		layui.use(['table','layer','form'],function(){
			//初始化模块
			//console.log("1");
			var table=layui.table,$=layui.$,layer=layui.layer;
			var form = layui.form;
			//绑定表格数据
			table.render({
				elem:'#tb',
				url:'/CloudDemo/appli/show',
				method:'post',
				page:true,
				limit:3,
				limits:[3,6,9],
				cols:[[
					{field:'A_id',title:'编号'},
					{field:'A_name',title:'姓名',align:'center'},
					{field:'A_postss',title:'应聘部门',templet:'<div>{{d.A_postss.pBId.bName}}</div>',align:'center'},
					{field:'A_postss',title:'应聘职位',templet:'<div>{{d.A_postss.pName}}</div>',align:'center'},
					{field:'A_sex',title:'性别',align:'center'},
					{field:'A_maxeducation',title:'学历',align:'center'},
					{field:'A_Time',title:'申请时间',align:'center'},
					{field:'A_salary',title:'期望薪资',align:'center'},
					{field:'A_state',title:'申请状态',align:'center'},
					{fixed:'right',title:'操作',toolbar:'#demo',align:'center'}
				]],
				done: function(res, curr, count){
	                
	                $("[data-field='A_state']").children().each(function(){
	                    if($(this).text()=='0'){
	                        $(this).text("审核中")
	                    }else if($(this).text()=='1'){
	                        $(this).text("已录用")
	                    }
	                    else if($(this).text()=='2'){
	                        $(this).text("未通过审核")
	                    }
	                });
	                
	                
	               },layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
	               ,jump: function(obj){
	            	      console.log(obj)
	            	    }


				
			});
			
			
			//修改//监听表格工具栏
			
			table.on('tool(show)',function(obj){
			console.log(obj);
				var data=obj.data;
				if(obj.event=='update'){
				//将一个JavaScript值(对象或者数组)转换为一个 JSON字符串
					json=JSON.stringify(data);
					
					layer.open({
						type:2,
						title:'审核应聘信息',
						content:'/CloudDemo/backGround/page/recruitment/UpdAppli.jsp',
						area:['600px','500px'],
						shade:0.5,
						btn:'关闭',
						resize:false,   //不允许拉伸
						zIndex:layer.zIndex
						})
					
				}
				if(obj.event=='delete'){
					layer.confirm("是否删除该数据?",function(){
						$.post("rec/del",{id:data.reId},function(res){
							if(res>0){
								layer.msg("删除成功",{time:2000},function(){
									//刷新表格
									table.reload('tb');
								});
							}else if(res==0){
								layer.msg("没有找到编号为【"+data.bId+"】的数据",{time:2000});
							}else{
								layer.msg("程序异常,请稍后再试....",{time:2000});
							}
						});
					});
				}
			});
				
			
		});
	</script>
</head>
<body class="childrenBody">
	<div>
  		<div class="layui-form-item">
	  		<blockquote class="layui-elem-quote news_search">
	  			<div class="layui-input-inline">
			      <input name="keywords" placeholder="请输入查询条件" autocomplete="off" class="layui-input" />
			    </div>
			    <button class="layui-btn layui-btn-radius" id="search">查询</button>
			  </blockquote>
	    	<table id="tb" lay-filter="show" >
	    		
	    		
	    	</table>
	    	
	    	<script type="text/html" id="demo">
  				<a class="layui-btn layui-btn-xs" lay-event="update">审核</a>
  			</script>
  		</div>
  	</div>
  </body>
</html>
