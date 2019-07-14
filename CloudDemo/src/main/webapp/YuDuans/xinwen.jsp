<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../YuDuans/css/common.css" rel="stylesheet"  type="text/css" />
<link href="../YuDuans/css/style.css" rel="stylesheet" type="text/css" />
<Link href="../YuDuans/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<script src="../YuDuans/js/jquery.min.1.8.2.js" type="text/javascript"></script>
<script src="../YuDuans/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="../YuDuans/js/common_js.js" type="text/javascript"></script>
<script src="../YuDuans/js/footer.js" type="text/javascript"></script>
<script src="../YuDuans/js/jqzoom.js" type="text/javascript"></script>
<script src="../YuDuans/js/layer/layer.js" type="text/javascript"></script>
<title>知识</title>

</head>

<body>
</div>
<!--栏目-->
<div class="header relative clearfix">

     <ul class="menu_list">
      <li><a href="../YuDuans/index.html" class="menu_name">首页</a></li>
      <li><a href="../YuDuans/cars_list.html" class="menu_name">选车</a></li>
      
      <li><a href="../NewsManagement/QueryShowNew" class="menu_name">新闻</a></li>
      <li><a href="门店.html" class="menu_name">门店</a></li>
         <li><a href="../YuDuans/zhaoping.html" class="menu_name">招聘</a></li>
      </ul>
      
   </div>


</div>

</div>
<!--知识-->
<div class="Insurance_content pages_style">
<div class="page clearfix"> 
<div class="Location_style">

</div>
 <div class="Knowledge_style clearfix">
  
 
	  	<table class="layui-table" style="float:left;">
		    <colgroup>
		   		<col width="30px">
				<col width="260px" height="60px" style="color: #666666;">
		    </colgroup>
		    
		    <tbody class="news_content">
		    		<c:forEach items="${so.list}" var="c">
		    	<tr>
		    		<td>
		    			<div class="baoxian_img"><img src="../YuDuans/images/bg_name.jpg"/></div>
		    		</td>
		    		<td>
		    			<div>
		    				<div>${c.title}</div>
		    				<div>
		    					<fmt:formatDate value="${c.newtime}" pattern="yyyy-MM-dd" var="newtime"/>
			      				${newtime}
			      			</div>
			      			<div>${c.content}</div>
		    			</div>
		    			
		    		</td>
		    	</c:forEach>
		    	</tr>
		    	
		    </tbody>
		</table>
  
  
  <div class="right_content">
   <div class="Knowledge_list">
    <div class="Knowledge_title">车险知识</div>
    <ul class="list_info">
      <img src="../YuDuans/images/bg_ad.jpg"  width="100%" style="margin-bottom:10px;"/>
     <li><i class="icon_yuan"></i><a href="文章介绍.html">2017年最全车险理赔技巧，记住不吃亏！</a></li>
     <li><i class="icon_yuan"></i><a href="#">细读6年免检，车主不可不看，不然可能就白白扣分啦！</a></li>
     <li><i class="icon_yuan"></i><a href="#">原来这7种情况现在可以赔啦！别自掏腰包啦，车主必知！</a></li>
     <li><i class="icon_yuan"></i><a href="#">汽车保险可以退？！涉及你的钱，车主必知！</a></li>
     <li><i class="icon_yuan"></i><a href="#">车险理赔9误区，牢记才能不吃亏！车主果断收藏！</a></li>
     <li><i class="icon_yuan"></i><a href="#">车险改革，看车险费率进行车险续保 不然可能就麻烦了</a></li>
     <li><i class="icon_yuan"></i><a href="#">国内车险有排名吗 买车险哪个保险公司好</a></li>
     <li><i class="icon_yuan"></i><a href="#">交通事故如何结案？结案协议书怎么写？</a></li>
     <li><i class="icon_yuan"></i><a href="#">缴纳2.0排量汽车购置税需要什么手续？</a></li>
     <li><i class="icon_yuan"></i><a href="#">2017年最全车险理赔技巧，记住不吃亏！</a></li>
    </ul>
   </div>
   <div class="Knowledge_list">
    <div class="Knowledge_title">险种介绍</div>
    <ul class="list_info">
      <img src="../YuDuans/images/bg_ad.jpg"  width="100%" style="margin-bottom:10px;"/>
     <li><i class="icon_yuan"></i><a href="#">什么是交强险！</a></li>
     <li><i class="icon_yuan"></i><a href="#">细读6年免检，车主不可不看，不然可能就白白扣分啦！</a></li>
     <li><i class="icon_yuan"></i><a href="#">原来这7种情况现在可以赔啦！别自掏腰包啦，车主必知！</a></li>
     <li><i class="icon_yuan"></i><a href="#">汽车保险可以退？！涉及你的钱，车主必知！</a></li>
     <li><i class="icon_yuan"></i><a href="#">车险理赔9误区，牢记才能不吃亏！车主果断收藏！</a></li>
     <li><i class="icon_yuan"></i><a href="#">车险改革，看车险费率进行车险续保 不然可能就麻烦了</a></li>
     <li><i class="icon_yuan"></i><a href="#">国内车险有排名吗 买车险哪个保险公司好</a></li>
     <li><i class="icon_yuan"></i><a href="#">交通事故如何结案？结案协议书怎么写？</a></li>
     <li><i class="icon_yuan"></i><a href="#">缴纳2.0排量汽车购置税需要什么手续？</a></li>
     <li><i class="icon_yuan"></i><a href="#">2017年最全车险理赔技巧，记住不吃亏！</a></li>
    </ul>
   </div>
  </div>
 </div>
 <div class="Knowledge_style clearfix">
 <div class="title_name"></div>

 </div>
</div>
</div>
<!--优势-->
<div class="Advantage_style">
 <div class="footerbox">
  <ul class="clearfix">
   <li class="clearfix ensure_name">
    <div class="left_icon"><img src="../YuDuans/images/icon_img_17.png" /></div>
    <div class="right_content">
     <h3>全程购物安全保障</h3>
     <h4>用户消费，资金安全</h4>
    </div>
   </li>
    <li class="clearfix ensure_name">
    <div class="left_icon"><img src="../YuDuans/images/icon_img_07.png" /></div>
    <div class="right_content">
     <h3>专业汽车销售平台</h3>
     <h4>实体汽车销售企业</h4>
    </div>
   </li>
    <li class="clearfix ensure_name">
    <div class="left_icon"><img src="../YuDuans/images/icon_img_09.png" /></div>
    <div class="right_content">
     <h3>获得相关认证授权</h3>
     <h4>保险,汽车销售许可</h4>
    </div>
   </li>
    <li class="clearfix ensure_name">
    <div class="left_icon"><img src="../YuDuans/images/icon_img_11.png" /></div>
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
   <div class="sys_style"><img src="../YuDuans/images/waixin.png"  width="100px"/><h5>微信公众号</h5></div>
    <div class="sys_style"><img src="../YuDuans/images/waixin.png"  width="100px"/><h5>微信公众号</h5></div>
  </div> 
  <div class="footer_phone"><img src="../YuDuans/images/phone.png" /></div> 
 </div>
 <div class="Copyright">
 <div class="footerbox">
 保险业务经营许可证：2609570xxxx0800 xxxxxxxxxx有限公司：440301105759096 粤ICP备1xxxxxxxx号<br /> Copyright ©2006-2017 汽车销售汽车服务平台版权所有
 </div> 
 </div>
</div>
</body>
</html>
