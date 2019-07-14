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
				url:'/CloudDemo/appo/show',
				method:'post',
				page:true,
				limit:3,
				limits:[3,6,9],
				cols:[[
					{field:'a_Id',title:'编号'},
					{field:'C_info',title:'客户名称',templet:'<div>{{d.C_info.C_name}}</div>',align:'center'},
					{field:'a_time',title:'发起时间',align:'center'},
					{field:'a_Estimated_time',title:'服务截止时间',align:'center'},
					{field:'a_type',title:'预约类型',align:'center'},
					{field:'a_remark',title:'备注',align:'center'},
					{field:'C_info',title:'电话',templet:'<div>{{d.C_info.C_phone}}</div>',align:'center'},
					{field:'a_state',title:'状态',align:'center'},
					{fixed:'right',title:'操作',toolbar:'#demo',align:'center'}
				]],
				done: function(res, curr, count){
	                
	                $("[data-field='a_state']").children().each(function(){
	                    if($(this).text()=='0'){
	                        $(this).text("审核中")
	                    }else if($(this).text()=='1'){
	                        $(this).text("批准试驾")
	                    }
	                });
	                
	                
	               }


				
			});
			
			
			//添加客户
			$("#addBtn").click(function(){
				layer.open({
					type:2,
					title:'添加客户',
					content:'/CloudDemo/backGround/page/customer/addcustomer.jsp',
					area:['450px','400px'],
					shade:0.5,
					btn:'关闭',
					resize:false, //不允许拉伸
					zIndex:layer.zIndex
				});
			});	
			
			
			table.on('tool(show)',function(obj){
					var data=obj.data;
					if(obj.event=='update'){
					//将一个JavaScript值(对象或者数组)转换为一个 JSON字符串
					layer.confirm("是否批准试驾?",function(){
						$.post("../../../appo/upd?a_Id="+data.a_Id,function(res){
							if(res>0){
								layer.msg("修改成功",{time:2000},function(){
									//重新加载表格
									layui.table.reload('tb');
									//关闭当前弹层
									var index = window.parent.layer.getFrameIndex(window.name);
									window.parent.layer.close(index);
								});
							}else{
								layer.msg("修改失败");
							}
						});
						return false;
					})
					};
					if(obj.event=='delete'){
						layer.confirm("是否删除该数据?",function(){
							$.post("../../../appo/del",{id:data.a_Id},function(res){
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
  				<a class="layui-btn layui-btn-xs" lay-event="update">通过审核</a>
				<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
  			</script>
  		</div>
  	</div>
  </body>
</html>
