<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/common.css" rel="stylesheet"  type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<Link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="css/Fliter.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/Filter.js" type="text/javascript"></script>
<title>在线留言</title>

<style type="text/css">
*{margin:0;padding:0;}
.clears{ clear:both;}
/*messages*/
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
</head>
<body>
<!--栏目-->
<div class="header relative clearfix">

     <ul class="menu_list">
      <li><a href="index.html" class="menu_name">首页</a></li>
      <li><a href="cars_list.html" class="menu_name">选车</a></li>
      
      <li><a href="新闻.html" class="menu_name">新闻</a></li>
      <li><a href="门店.html" class="menu_name">门店</a></li>
    
         <li><a href="招聘.html" class="menu_name">招聘</a></li>
      </ul>
      
   </div>
<form action="../Compleaints/insertCompl" method="post" class="messages">
     <div class="messlist">
      <label>姓名</label>
      <input type="text" name="cName" placeholder="姓名" />
      <div class="clears"></div>
     </div>
     <div class="messlist">
      <label>电子邮件</label>
      <input type="text" name="cEmail" placeholder="电子邮件" />
      <div class="clears"></div>
     </div>
     <div class="messlist">
      <label>手机号</label>
      <input type="text" name="cIp" placeholder="手机号" />
      <div class="clears"></div>
     </div>
     <div class="messlist textareas">
      <label>留言内容</label>
      <textarea placeholder="留言内容" name="cremark"></textarea>
      <div class="clears"></div>
     </div>
     <div class="messsub">
      <input type="submit" value="提交" style="background:#00a3eb;color:#fff;" />
      <input type="reset" value="重填" />
     </div>
</form>	 
<div class="Advantage_style">
 <div class="footerbox">
  <ul class="clearfix">
   <li class="clearfix ensure_name">
    <div class="left_icon"><img src="images/icon_img_17.png" /></div>
    <div class="right_content">
     <h3>全程购物安全保障</h3>
     <h4>用户消费，资金安全</h4>
    </div>
   </li>
    <li class="clearfix ensure_name">
    <div class="left_icon"><img src="images/icon_img_07.png" /></div>
    <div class="right_content">
     <h3>专业汽车销售平台</h3>
     <h4>实体汽车销售企业</h4>
    </div>
   </li>
    <li class="clearfix ensure_name">
    <div class="left_icon"><img src="images/icon_img_09.png" /></div>
    <div class="right_content">
     <h3>获得相关认证授权</h3>
     <h4>保险,汽车销售许可</h4>
    </div>
   </li>
    <li class="clearfix ensure_name">
    <div class="left_icon"><img src="images/icon_img_11.png" /></div>
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
   <div class="sys_style"><img src="images/waixin.png"  width="100px"/><h5>微信公众号</h5></div>
    <div class="sys_style"><img src="images/waixin.png"  width="100px"/><h5>微信公众号</h5></div>
  </div> 
  <div class="footer_phone"><img src="images/phone.png" /></div> 
 </div>
 <div class="Copyright">
 <div class="footerbox">
 保险业务经营许可证：2609570xxxx0800 xxxxxxxxxx有限公司：440301105759096 粤ICP备1xxxxxxxx号<br /> Copyright ©2006-2017 汽车销售汽车服务平台版权所有
 </div> 
 </div>
</div>
</body>
</html>