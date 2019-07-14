<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/YuDuans/css/common.css" rel="stylesheet"  type="text/css" />
<link href="${pageContext.request.contextPath}/YuDuans/css/style.css" rel="stylesheet" type="text/css" />
<Link href="${pageContext.request.contextPath}/YuDuans/YuDuans/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/YuDuans/js/jquery.min.1.8.2.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/YuDuans/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/YuDuans/js/common_js.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/YuDuans/js/footer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/YuDuans/js/jqzoom.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/YuDuans/js/layer/layer.js" type="text/javascript"></script>
<title>保单查询</title>
<style type="text/css">
	.mess{
		margin: 0 auto;
		width:1200px ;
		height:58px;
		
	}
	.mess li{
		width:108px ;
		height:38px;
		float: left;
		line-height: 36px;
		font-size: 18px;
		margin-top: 20px;
		text-align: center;
	}
	.mess li a{
		display: block;
		width:88px ;
		height:38px;
		margin-left: 10px;
	}

</style>
</head>
<body>
 <ul class="mess">
      <li><a href="../YuDuans/index.html" class="menu_name">首页</a></li>
      <li><a href="../YuDuans/cars_list.html" class="menu_name">选车</a></li>
      
      <li><a href="新闻.html" class="menu_name">新闻</a></li>
      <li><a href="../MenDianController/selemodianqian" class="menu_name">门店</a></li>
         <li><a href="../YuDuans/招聘.html" class="menu_name">招聘</a></li>
  </ul>
      
   </div>

 
   <div class="Details_Add_offer clearfix">
     <!--查询结果-->
     <div class="Query_list">
     <c:forEach items="${list}" var="c">
        <div class="Query_Policy_name">
         <div class="Policy_xinxi">${c.rRemark} </div>
         <div class=" margin clearfix relative">      
          <div class="bd_img"><img src="${pageContext.request.contextPath}/YuDuans/images/02.jpg"  width="200px;"/></div>
          <div class="Query_Policy_info">
           <h3>${c.mName}</h3>
           <div class="qitaxixni clearfix">
           <p><label class="label_name">电话：</label>${c.mIp}</p>
           <p><label class="label_name">地址：</label>${c.mTzT}
           </p>
          
           
           </div>
          </div>
          
          <div class="operating_style">
            <a href="#" class="btn Preview_btn"><i class="fa  fa-yoast"></i>&nbsp;进入门店</a>
          </div>
         </div>
            </div>
        </c:forEach>
        </div>
     </div>
     <!--分页-->

   </div>
  </div>
</div>
<!--优势-->
<div class="Advantage_style">
 <div class="footerbox">
  <ul class="clearfix">
   <li class="clearfix ensure_name">
    <div class="left_icon"><img src="${pageContext.request.contextPath}/YuDuans/images/icon_img_17.png" /></div>
    <div class="right_content">
     <h3>全程购物安全保障</h3>
     <h4>用户消费，资金安全</h4>
    </div>
   </li>
    <li class="clearfix ensure_name">
    <div class="left_icon"><img src="${pageContext.request.contextPath}/YuDuans/images/icon_img_07.png" /></div>
    <div class="right_content">
     <h3>专业汽车销售平台</h3>
     <h4>实体汽车销售企业</h4>
    </div>
   </li>
    <li class="clearfix ensure_name">
    <div class="left_icon"><img src="${pageContext.request.contextPath}/YuDuans/images/icon_img_09.png" /></div>
    <div class="right_content">
     <h3>获得相关认真授权</h3>
     <h4>保险,汽车销售许可</h4>
    </div>
   </li>
    <li class="clearfix ensure_name">
    <div class="left_icon"><img src="${pageContext.request.contextPath}/YuDuans/images/icon_img_11.png" /></div>
    <div class="right_content">
     <h3>24小时服务热线</h3>
     <h4>有问题实时沟通联系</h4>
    </div>
   </li>
  </ul>
 </div>
</div>
<!--底部样式-->
<div class="footer">
 <div class="footerbox clearfix" >
  <div class="server_box clearfix">
   <dl>
    <dt>关于我们</dt>
    <dd><a href="#">网站介绍</a></dd>
    <dd><a href="#">汽车销售</a></dd>
    <dd><a href="#">官方微信</a></dd>
    <dd><a href="#">联系我们</a></dd>
    <dd><a href="#">名称</a></dd>
   </dl>
   <dl>
    <dt>服务承诺</dt>
    <dd><a href="#">免手续费</a></dd>
    <dd><a href="#">超长质保</a></dd>
    <dd><a href="#">协助服务</a></dd>

   </dl><dl>
    <dt>支付方式</dt>
    <dd><a href="#">支付宝</a></dd>
    <dd><a href="#">微信支付</a></dd>
    <dd><a href="#">银联支付</a></dd>
    <dd><a href="#">支付步骤</a></dd>
   </dl>
  </div>
  <div class="weixin_style">
   <div class="sys_style"><img src="${pageContext.request.contextPath}/YuDuans/images/waixin.png"  width="100px"/><h5>微信公众号</h5></div>
    <div class="sys_style"><img src="${pageContext.request.contextPath}/YuDuans/images/waixin.png"  width="100px"/><h5>微信公众号</h5></div>
  </div> 
  <div class="footer_phone"><img src="${pageContext.request.contextPath}/YuDuans/images/phone.png" /></div> 
 </div>
 <div class="Copyright">
 <div class="footerbox">
 保险业务经营许可证：2609570xxxx0800 xxxxxxxxxx有限公司：440301105759096 粤ICP备1xxxxxxxx号<br /> Copyright ©2006-2017 汽车销售汽车服务平台版权所有
 </div> 
 </div>
</div>
</body>
</html>
<script>
/*********搜索*********/
function submit_btn(){
	 $(".Search input[type$='text']").each(function(n){
		  if($(this).val()=="")
          {
               
			   layer.alert("搜索框不能为空！",{
                title: '提示框',				
				icon:0,								
          }); 		    
            return false;            
          } 
		 else{
			 location.href="搜索.html";
			 
			 }
		 })		
}
</script>