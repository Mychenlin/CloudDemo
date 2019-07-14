var navs = [{
	"title" : "后台首页",
	"icon" : "icon-computer",
	"href" : "page/main.html",
	"spread" : false
},{
	"title" : "文章列表",
	"icon" : "icon-text",
	"href" : "page/news/newsList.html",
	"spread" : false
},{
	"title" : "车辆管理",
	"icon" : "",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "汽车品牌",
			"icon" : "icon-text",
			"href" : "page/car/car.jsp",
			"spread" : false
		},
		{
			"title" : "汽车类型",
			"icon" : "icon-text",
			"href" : "page/car/carType.jsp",
			"spread" : false
		},{
			"title" : "汽车配置信息",
			"icon" : "icon-text",
			"href" : "page/car/carInfo.jsp",
			"spread" : false
		},{
			"title" : "采购申请",
			"icon" : "&#xe631;",
			"href" : "page/car/CarPay.jsp",
			"spread" : false
		}
	]
},{
	"title" : "汽车管理",
	"icon" : "icon-text",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "汽车销售",
			"icon" : "icon-text",
			"href" : "page/car/insertCar.jsp",
			"spread" : false
		},
		{
			"title" : "汽车购买",
			"icon" : "icon-text",
			"href" : "",
			"spread" : false
		}
	]
},{
	"title" : "财务管理",
	"icon" : "",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "员工薪资发放",
			"icon" : "&#xe631;",
			"href" : "page/Money/insertMoney.jsp",
			"spread" : false
		},{
			"title" : "其它薪资支出",
			"icon" : "&#xe631;",
			"href" : "page/Money/insertOther.jsp",
			"spread" : false
		},
		{
			"title" : "薪资查看",
			"icon" : "&#xe631;",
			"href" : "../SalaryC/ShowSal",
			"spread" : false
		},{
			"title" : "其它薪资查看",
			"icon" : "&#xe631;",
			"href" : "../OtherC/ShowOth",
			"spread" : false
		}
	]
},{
	"title" : "新闻管理",
	"icon" : "",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "查看新闻",
			"icon" : "&#xe631;",
			"href" : "/CloudDemo/backGround/page/news/QueryNew.jsp",
			"spread" : false
		}
	]
},{
	"title" : "人事管理",
	"icon" : "",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "部门管理",
			"icon" : "&#xe631;",
			"href" : "page/personnel/bacher.jsp",
			"spread" : false
		},
		{
			"title" : "职位管理",
			"icon" : "&#xe631;",
			"href" : "page/personnel/post.jsp",
			"spread" : false
		},
		{
			"title" : "员工管理",
			"icon" : "&#xe631;",
			"href" : "page/personnel/Staffinfo.jsp",
			"spread" : false
		}
	]
},{
	"title" : "意见与反馈",
	"icon" : "icon-text",
	"href" : "page/personnel/Compleaintss.jsp",
	"spread" : false
},{
	"title" : "预约管理",
	"icon" : "icon-text",
	"href" : "page/Yuyue/Yuyues.jsp",
	"spread" : false
},
{
	"title" : "门店管理",
	"icon" : "icon-text",
	"href" : "page/MenDian/MenDiane.jsp",
	"spread" : false
},{

	"title" : "考勤管理",
	"icon" : "",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "请假申请",
			"icon" : "&#xe631;",
			"href" : "page/attendance/addLeave.jsp",
			"spread" : false
		},
		{
			"title":"审批假条",
			"icon" :"&#xe631;",
			"href" :"page/attendance/auditLeave.jsp",
			"spread" : false
		},
		{
			"title" : "已审核假条",
			"icon" : "&#xe631;",
			"href" : "page/attendance/audit.jsp",
			"spread" : false
		},{
			"title" : "考勤查看",
			"icon" : "&#xe631",
			"href" : "page/attendance/punchTheClock.jsp",
			"spread" : false
		},{
			"title" : "模拟打卡",
			"icon" : "&#xe631",
			"href" : "page/attendance/analogClock.jsp",
			"spread" : false
		}
	]
},{
	"title" : "招聘管理",
	"icon" : "",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "招聘查看",
			"icon" : "&#xe631;",
			"href" : "/CloudDemo/backGround/page/recruitment/recruit.jsp",
			"spread" : false
		},
		{
			"title":"应聘查看",
			"icon" :"&#xe631;",
			"href" :"/CloudDemo/backGround/page/recruitment/Application.jsp",
			"spread" : false
		}
	]
},{
	"title" : "客户管理",
	"icon" : "",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "客户查看",
			"icon" : "&#xe631;",
			"href" : "/CloudDemo/backGround/page/customer/Customer.jsp",
			"spread" : false
		},
		{
			"title":"客户预约",
			"icon" :"&#xe631;",
			"href" :"/CloudDemo/backGround/page/customer/Appointment.jsp",
			"spread" : false
		}
	]
},{
	"title" : "系统基本参数",
	"icon" : "&#xe631;",
	"href" : "page/systemParameter/systemParameter.html",
	"spread" : false
},{
	"title" : "二级菜单演示",
	"icon" : "&#xe61c;",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "二级菜单1",
			"icon" : "&#xe631;",
			"href" : "",
			"spread" : false
		},
		{
			"title" : "二级菜单2",
			"icon" : "&#xe631;",
			"href" : "",
			"spread" : false
		}
	]
}]