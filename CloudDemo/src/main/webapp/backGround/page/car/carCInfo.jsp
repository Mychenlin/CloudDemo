<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>My JSP 'Adduser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="../../layui/css/layui.css" />
	<script type="text/javascript" src="../../layui/layui.js" ></script>
	<style type="text/css">
		td{
			text-align: center;
		}
	</style>
	<script type="text/javascript">
	
	</script>
  </head>
  
  <body>
  	<form class="layui-form" action="">
  		<table class="layui-table " border="1px" bordercolor="gray" cellpadding="0" cellspacing="0">
  			<tr>
  				<td>车型名称</td>
  				<td>${ci.name}</td>
  				
  				<td>最大功率(kW)</td>
  				<td>${ci.maximumPower}</td>
  			</tr>
  			<tr>
  				<td>最大扭矩(N·m)</td>
  				<td>${ci.maximumTorque}</td>
  				
  				<td>发动机</td>
  				<td>${ci.engine}</td>
  			</tr>
  			<tr>
  				<td>变速箱</td>
  				<td>${ci.transmissionCase}</td>
  				
  				<td>长*宽*高(mm)</td>
  				<td>${ci.lengthWidthHeight}</td>
  			</tr>
  			<tr>
  				<td>车身结构</td>
  				<td>${ci.bodyStructure}</td>
  				
  				<td>最高车速(km/h)</td>
  				<td>${ci.maximumSpeed}</td>
  			</tr>
  			<tr>
  				<td>官方0-100km/h加速(s)</td>
  				<td>${ci.official0100kmHAccelerationS}</td>
  				
  				<td>实测0-100km/h加速(s)</td>
  				<td>${ci.normoL0100kmHAccelerationS}</td>
  			</tr>
  			<tr>
  				<td>实测100-0km/h制动(m)</td>
  				<td>${ci.measured1000kmhBrakingM}</td>
  				
  				<td>工信部综合油耗(L/100km)</td>
  				<td>${ci.integratedFuelConsumptionOfMinistryOfIndustryAndInformat}</td>
  			</tr>
  			<tr>
  				<td>实测油耗(L/100km)</td>
  				<td>${ci.measuredFuelConsumptionL100km}</td>
  				
  				<td>整车质保</td>
  				<td>${ci.qualityAssurance}</td>
  			</tr>
  			<tr>
  				<td>主/副驾驶座安全气囊</td>
  				<td>${ci.mainCoPilotSeatAirbag}</td>
  				
  				<td>前/后排侧气囊</td>
  				<td>${ci.anteriorPosteriorLateralBalloon}</td>
  			</tr>
  			<tr>
  				<td>前/后排头部气囊(气帘)</td>
  				<td>${ci.frontRearHeadBalloonAirCurtain}</td>
  				
  				<td>膝部气囊</td>
  				<td>${ci.kneeAirbag}</td>
  			</tr>
  			<tr>
  				<td>后排安全带式气囊</td>
  				<td>${ci.rearSeatBeltAirbag}</td>
  				
  				<td>后排中央安全气囊</td>
  				<td>${ci.rearRowCentralAirbag}</td>
  			</tr>
  			<tr>
  				<td>被动行人保护</td>
  				<td>${ci.passivePedestrianProtection}</td>
  				
  				<td>胎压监测功能</td>
  				<td>${ci.tirePressureMonitoringFunction}</td>
  			</tr>
  			<tr>
  				<td>零胎压继续行驶</td>
  				<td>${ci.zeroTirePressureToContinueDriving}</td>
  				
  				<td>安全带未系提醒</td>
  				<td>${ci.unfastenedSeatBeltReminder}</td>
  			</tr>
  			<tr>
  				<td>ISOFIX儿童座椅接口</td>
  				<td>${ci.iSOFIXChildSeatInterface}</td>
  				
  				<td>ABS防抱死</td>
  				<td>${ci.aBSAntiLockBraking}</td>
  			</tr>
  			<tr>
  				<td>制动力分配(EBD/CBC等)</td>
  				<td>${ci.brakingForceDistributionEbdCbcEtc}</td>
  				
  				<td>刹车辅助(EBA/BAS/BA等)</td>
  				<td>${ci.brakeAssistanceEbaBasBaEtc}</td>
  			</tr>
  			<tr>
  				<td>牵引力控制(ASR/TCS/TRC等)</td>
  				<td>${ci.tractionControlAsrTcsTrcEtc}</td>
  				
  				<td>车身稳定控制(ESC/ESP/DSC等)</td>
  				<td>${ci.bodyStabilityControlEscEspDscEtc}</td>
  			</tr>
  			<tr>
  				<td>并线辅助</td>
  				<td>${ci.doublingAssistance}</td>
  				
  				<td>车道偏离预警系统</td>
  				<td>${ci.ldws}</td>
  			</tr>
  			<tr>
  				<td>车道保持辅助系统</td>
  				<td>${ci.laneMaintenanceAssistanceSystem}</td>
  				
  				<td>道路交通标识识别</td>
  				<td>${ci.roadTrafficSignRecognition}</td>
  			</tr>
  			<tr>
  				<td>主动刹车/主动安全系统</td>
  				<td>${ci.activeBrakeActiveSafetySystem}</td>
  				
  				<td>夜视系统</td>
  				<td>${ci.nightVisionSystem}</td>
  			</tr>
  			<tr>
  				<td>疲劳驾驶提示</td>
  				<td>${ci.tipsforFatigueDriving}</td>
  				
  				<td>能源类型</td>
  				<td>${ci.energyType}</td>
  			</tr>
  		</table>
  	</form>
  </body>
</html>