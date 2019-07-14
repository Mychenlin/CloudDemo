package com.direct.entity;

public class CarInfo {
	//汽车配置信息与数量
	private int id;//汽车配置ID
	private String name;//车型名称
	private String money;//厂商指导价(元)
	private String manufacturer;//厂商
	private String level;//级别
	private String energyType;//能源类型
	private String timeToMarket;//上市时间
	private String maximumPower;//最大功率(kW)
	private String maximumTorque;//最大扭矩(N·m)
	private String engine;//发动机
	private String transmissionCase;//变速箱
	private String lengthWidthHeight;//长*宽*高(mm)
	private String bodyStructure;//车身结构
	private String maximumSpeed;//最高车速(km/h)
	private String official0100kmHAccelerationS;//官方0-100km/h加速(s)
	private String normoL0100kmHAccelerationS;//实测0-100km/h加速(s)
	private String measured1000kmhBrakingM;//实测100-0km/h制动(m)
	private String integratedFuelConsumptionOfMinistryOfIndustryAndInformat;//工信部综合油耗(L/100km)
	private String measuredFuelConsumptionL100km;//实测油耗(L/100km)
	private String qualityAssurance;//整车质保
	private String mainCoPilotSeatAirbag;//主/副驾驶座安全气囊
	private String anteriorPosteriorLateralBalloon;//前/后排侧气囊
	private String frontRearHeadBalloonAirCurtain;//前/后排头部气囊(气帘)
	private String kneeAirbag;//膝部气囊
	private String rearSeatBeltAirbag;//后排安全带式气囊
	private String rearRowCentralAirbag;//后排中央安全气囊
	private String passivePedestrianProtection;//被动行人保护
	private String tirePressureMonitoringFunction;//胎压监测功能
	private String zeroTirePressureToContinueDriving;//零胎压继续行驶
	private String unfastenedSeatBeltReminder;//安全带未系提醒
	private String iSOFIXChildSeatInterface;//ISOFIX儿童座椅接口
	private String aBSAntiLockBraking;//ABS防抱死
	private String brakingForceDistributionEbdCbcEtc;//制动力分配(EBD/CBC等)
	private String brakeAssistanceEbaBasBaEtc;//刹车辅助(EBA/BAS/BA等)
	private String tractionControlAsrTcsTrcEtc;//牵引力控制(ASR/TCS/TRC等)
	private String bodyStabilityControlEscEspDscEtc;//车身稳定控制(ESC/ESP/DSC等)
	private String doublingAssistance;//并线辅助
	private String ldws;//车道偏离预警系统
	private String laneMaintenanceAssistanceSystem; //车道保持辅助系统
	private String roadTrafficSignRecognition;//道路交通标识识别
	private String activeBrakeActiveSafetySystem;//主动刹车/主动安全系统
	private String nightVisionSystem;//夜视系统
	private String tipsforFatigueDriving;//疲劳驾驶提示
	private int number;//库存数量
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getEnergyType() {
		return energyType;
	}
	public void setEnergyType(String energyType) {
		this.energyType = energyType;
	}
	public String getTimeToMarket() {
		return timeToMarket;
	}
	public void setTimeToMarket(String timeToMarket) {
		this.timeToMarket = timeToMarket;
	}
	public String getMaximumPower() {
		return maximumPower;
	}
	public void setMaximumPower(String maximumPower) {
		this.maximumPower = maximumPower;
	}
	public String getMaximumTorque() {
		return maximumTorque;
	}
	public void setMaximumTorque(String maximumTorque) {
		this.maximumTorque = maximumTorque;
	}
	public String getEngine() {
		return engine;
	}
	public void setEngine(String engine) {
		this.engine = engine;
	}
	public String getTransmissionCase() {
		return transmissionCase;
	}
	public void setTransmissionCase(String transmissionCase) {
		this.transmissionCase = transmissionCase;
	}
	public String getLengthWidthHeight() {
		return lengthWidthHeight;
	}
	public void setLengthWidthHeight(String lengthWidthHeight) {
		this.lengthWidthHeight = lengthWidthHeight;
	}
	public String getBodyStructure() {
		return bodyStructure;
	}
	public void setBodyStructure(String bodyStructure) {
		this.bodyStructure = bodyStructure;
	}
	public String getMaximumSpeed() {
		return maximumSpeed;
	}
	public void setMaximumSpeed(String maximumSpeed) {
		this.maximumSpeed = maximumSpeed;
	}
	public String getOfficial0100kmHAccelerationS() {
		return official0100kmHAccelerationS;
	}
	public void setOfficial0100kmHAccelerationS(String official0100kmHAccelerationS) {
		this.official0100kmHAccelerationS = official0100kmHAccelerationS;
	}
	public String getNormoL0100kmHAccelerationS() {
		return normoL0100kmHAccelerationS;
	}
	public void setNormoL0100kmHAccelerationS(String normoL0100kmHAccelerationS) {
		this.normoL0100kmHAccelerationS = normoL0100kmHAccelerationS;
	}
	public String getMeasured1000kmhBrakingM() {
		return measured1000kmhBrakingM;
	}
	public void setMeasured1000kmhBrakingM(String measured1000kmhBrakingM) {
		this.measured1000kmhBrakingM = measured1000kmhBrakingM;
	}
	public String getIntegratedFuelConsumptionOfMinistryOfIndustryAndInformat() {
		return integratedFuelConsumptionOfMinistryOfIndustryAndInformat;
	}
	public void setIntegratedFuelConsumptionOfMinistryOfIndustryAndInformat(
			String integratedFuelConsumptionOfMinistryOfIndustryAndInformat) {
		this.integratedFuelConsumptionOfMinistryOfIndustryAndInformat = integratedFuelConsumptionOfMinistryOfIndustryAndInformat;
	}
	public String getMeasuredFuelConsumptionL100km() {
		return measuredFuelConsumptionL100km;
	}
	public void setMeasuredFuelConsumptionL100km(
			String measuredFuelConsumptionL100km) {
		this.measuredFuelConsumptionL100km = measuredFuelConsumptionL100km;
	}
	public String getQualityAssurance() {
		return qualityAssurance;
	}
	public void setQualityAssurance(String qualityAssurance) {
		this.qualityAssurance = qualityAssurance;
	}
	public String getMainCoPilotSeatAirbag() {
		return mainCoPilotSeatAirbag;
	}
	public void setMainCoPilotSeatAirbag(String mainCoPilotSeatAirbag) {
		this.mainCoPilotSeatAirbag = mainCoPilotSeatAirbag;
	}
	public String getAnteriorPosteriorLateralBalloon() {
		return anteriorPosteriorLateralBalloon;
	}
	public void setAnteriorPosteriorLateralBalloon(
			String anteriorPosteriorLateralBalloon) {
		this.anteriorPosteriorLateralBalloon = anteriorPosteriorLateralBalloon;
	}
	public String getFrontRearHeadBalloonAirCurtain() {
		return frontRearHeadBalloonAirCurtain;
	}
	public void setFrontRearHeadBalloonAirCurtain(
			String frontRearHeadBalloonAirCurtain) {
		this.frontRearHeadBalloonAirCurtain = frontRearHeadBalloonAirCurtain;
	}
	public String getKneeAirbag() {
		return kneeAirbag;
	}
	public void setKneeAirbag(String kneeAirbag) {
		this.kneeAirbag = kneeAirbag;
	}
	public String getRearSeatBeltAirbag() {
		return rearSeatBeltAirbag;
	}
	public void setRearSeatBeltAirbag(String rearSeatBeltAirbag) {
		this.rearSeatBeltAirbag = rearSeatBeltAirbag;
	}
	public String getRearRowCentralAirbag() {
		return rearRowCentralAirbag;
	}
	public void setRearRowCentralAirbag(String rearRowCentralAirbag) {
		this.rearRowCentralAirbag = rearRowCentralAirbag;
	}
	public String getPassivePedestrianProtection() {
		return passivePedestrianProtection;
	}
	public void setPassivePedestrianProtection(String passivePedestrianProtection) {
		this.passivePedestrianProtection = passivePedestrianProtection;
	}
	public String getTirePressureMonitoringFunction() {
		return tirePressureMonitoringFunction;
	}
	public void setTirePressureMonitoringFunction(
			String tirePressureMonitoringFunction) {
		this.tirePressureMonitoringFunction = tirePressureMonitoringFunction;
	}
	public String getZeroTirePressureToContinueDriving() {
		return zeroTirePressureToContinueDriving;
	}
	public void setZeroTirePressureToContinueDriving(
			String zeroTirePressureToContinueDriving) {
		this.zeroTirePressureToContinueDriving = zeroTirePressureToContinueDriving;
	}
	public String getUnfastenedSeatBeltReminder() {
		return unfastenedSeatBeltReminder;
	}
	public void setUnfastenedSeatBeltReminder(String unfastenedSeatBeltReminder) {
		this.unfastenedSeatBeltReminder = unfastenedSeatBeltReminder;
	}
	
	public String getiSOFIXChildSeatInterface() {
		return iSOFIXChildSeatInterface;
	}
	public void setiSOFIXChildSeatInterface(String iSOFIXChildSeatInterface) {
		this.iSOFIXChildSeatInterface = iSOFIXChildSeatInterface;
	}
	public String getaBSAntiLockBraking() {
		return aBSAntiLockBraking;
	}
	public void setaBSAntiLockBraking(String aBSAntiLockBraking) {
		this.aBSAntiLockBraking = aBSAntiLockBraking;
	}
	public String getBrakingForceDistributionEbdCbcEtc() {
		return brakingForceDistributionEbdCbcEtc;
	}
	public void setBrakingForceDistributionEbdCbcEtc(
			String brakingForceDistributionEbdCbcEtc) {
		this.brakingForceDistributionEbdCbcEtc = brakingForceDistributionEbdCbcEtc;
	}
	public String getBrakeAssistanceEbaBasBaEtc() {
		return brakeAssistanceEbaBasBaEtc;
	}
	public void setBrakeAssistanceEbaBasBaEtc(String brakeAssistanceEbaBasBaEtc) {
		this.brakeAssistanceEbaBasBaEtc = brakeAssistanceEbaBasBaEtc;
	}
	public String getTractionControlAsrTcsTrcEtc() {
		return tractionControlAsrTcsTrcEtc;
	}
	public void setTractionControlAsrTcsTrcEtc(String tractionControlAsrTcsTrcEtc) {
		this.tractionControlAsrTcsTrcEtc = tractionControlAsrTcsTrcEtc;
	}
	public String getBodyStabilityControlEscEspDscEtc() {
		return bodyStabilityControlEscEspDscEtc;
	}
	public void setBodyStabilityControlEscEspDscEtc(
			String bodyStabilityControlEscEspDscEtc) {
		this.bodyStabilityControlEscEspDscEtc = bodyStabilityControlEscEspDscEtc;
	}
	public String getDoublingAssistance() {
		return doublingAssistance;
	}
	public void setDoublingAssistance(String doublingAssistance) {
		this.doublingAssistance = doublingAssistance;
	}
	public String getLdws() {
		return ldws;
	}
	public void setLdws(String ldws) {
		this.ldws = ldws;
	}
	public String getLaneMaintenanceAssistanceSystem() {
		return laneMaintenanceAssistanceSystem;
	}
	public void setLaneMaintenanceAssistanceSystem(
			String laneMaintenanceAssistanceSystem) {
		this.laneMaintenanceAssistanceSystem = laneMaintenanceAssistanceSystem;
	}
	public String getRoadTrafficSignRecognition() {
		return roadTrafficSignRecognition;
	}
	public void setRoadTrafficSignRecognition(String roadTrafficSignRecognition) {
		this.roadTrafficSignRecognition = roadTrafficSignRecognition;
	}
	public String getActiveBrakeActiveSafetySystem() {
		return activeBrakeActiveSafetySystem;
	}
	public void setActiveBrakeActiveSafetySystem(
			String activeBrakeActiveSafetySystem) {
		this.activeBrakeActiveSafetySystem = activeBrakeActiveSafetySystem;
	}
	public String getNightVisionSystem() {
		return nightVisionSystem;
	}
	public void setNightVisionSystem(String nightVisionSystem) {
		this.nightVisionSystem = nightVisionSystem;
	}
	public String getTipsforFatigueDriving() {
		return tipsforFatigueDriving;
	}
	public void setTipsforFatigueDriving(String tipsforFatigueDriving) {
		this.tipsforFatigueDriving = tipsforFatigueDriving;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
}
