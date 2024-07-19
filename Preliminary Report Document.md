# 2023操作系统功能挑战初赛报告文档

报告小组：弃子争先

成员：北方工业大学 耿飚

## 目标描述

我们小组的选题为 
**[proj175-desktop-gadgets-in-uos](https://github.com/oscomp/proj175-desktop-gadgets-in-uos)** 。

题目要求如下：<br>
1、使用qt+qml进行开发。<br>
2、默认提供天气，时钟，便签三个部件。<br>
3、部件相对大小为以下可能中的几种或全部1x1,1x2,1x4,2x2,2x4,3x4,4x4。<br>
4、支持拖拽预览区域的部件到常用区域，部件拖拽流畅且自然，无卡顿。<br>
5、支持部分小部件调整大小，调整后也应该为目标3中的尺寸中的一个。

## 相关资料调研
Qt是一个1991年由Qt Company开发的跨平台C++图形用户界面应用程序开发框架。它既可以开发GUI程序，也可用于开发非GUI程序，比如控制台工具和服务器。<br>
Qt是面向对象的框架，使用特殊的代码生成扩展以及一些宏，Qt很容易扩展，并且允许真正地组件编程。<br> 
2008年，Qt Company科技被诺基亚公司收购，Qt也因此成为诺基亚旗下的编程语言工具。2012年，Qt被Digia收购。2014年4月，跨平台集成开发环境Qt Creator 3.1.0正式发布，实现了对于iOS的完全支持，新增WinRT、Beautifier等插件，废弃了无Python接口的GDB调试支持，集成了基于Clang的C/C++代码模块，并对Android支持做出了调整，至此实现了全面支持iOS、Android、WP，它提供给应用程序开发者建立艺术级的图形用户界面所需的所有功能。<br>
基本上，Qt 同 X Window 上的 Motif，Openwin，GTK 等图形界面库和 Windows 平台上的 MFC，OWL，VCL，ATL 是同类型的东西。  

## 系统框架

<div align=center><img src="https://github.com/littlebrotherdog/desktop-gadgets-in-uos/blob/main/display/%E7%B3%BB%E7%BB%9F%E6%A1%86%E6%9E%B6.jpg" alt="系统框架" width = 50% height = 50% /></div>

## 开发计划

### 第一步

阅读题目要求，对题目要求的技术语言进行大致了解。参考市面上的ui设计范例，对小组件实现效果进行大致构想。

预期产出：准备网络上或者书面上的语言学习资料，画出大致运行效果图 。

### 第二步

配置uos环境，在虚拟机上运行。配置c++编译环境和qt运行环境。

预期产出：复现qt自带范例的运行效果。

### 第三步

编写天气组件的基础运行程序。利用网站 **[https://openweathermap.org/](https://openweathermap.org/)** 获取天气数据，书写json文件进行数据交换。
利用Flipable类进行进行页面切换效果，切换出的新页面可以进行城市切换以获取当地天气。

预期产出：显示当地天气（包括温度、风速、湿度等一系列数据），切换城市且尽量使效果美观。

<div align=center><img src="https://github.com/littlebrotherdog/desktop-gadgets-in-uos/blob/main/display/display_weather_1.png" alt="天气" width = 60% height = 60% /></div>

<div align=center><img src="https://github.com/littlebrotherdog/desktop-gadgets-in-uos/blob/main/display/display_weather_2.png" alt="天气" width = 60% height = 60% /></div>


### 第四步

编写时钟组件的基础运行程序。编写显示时间的程序以及计时器并能够进行文字记录。

预期产出：显示当时时间，计时器实现开始和暂停功能并且界面美观。

<div align=center><img src="https://github.com/littlebrotherdog/desktop-gadgets-in-uos/blob/main/display/display_timer_1.png" alt="时钟" width = 60% height = 60% /></div>

<div align=center><img src="https://github.com/littlebrotherdog/desktop-gadgets-in-uos/blob/main/display/display_timer_2.png" alt="时钟" width = 60% height = 60% /></div>

### 第五步

编写备忘录组件的基础运行程序。运用ListView类设计滑动页面，实现添加和删除功能。最后实现基于关键字的文字检索功能。

预期产出：流畅滑动，可以添加、删除和检索备忘录，界面美观。

<div align=center><img src="https://github.com/littlebrotherdog/desktop-gadgets-in-uos/blob/main/display/display_memo_1.png" alt="备忘录" width = 60% height = 60% /></div>

<div align=center><img src="https://github.com/littlebrotherdog/desktop-gadgets-in-uos/blob/main/display/display_memo_2.png" alt="备忘录" width = 60% height = 60% /></div>

### 第六步

针对题目要求实现拖拽，切换界面大小等功能，同时绘制ui和icon，借助 **[https://iconpark.oceanengine.com/official](https://iconpark.oceanengine.com/official)** 网站获取合适比例的icon。

预期产出：流畅切换，各种效果无卡顿。

### 第七步

编写2048小程序。

预期产出：可以切换网格大小，记录历史分数。

<div align=center><img src="https://github.com/littlebrotherdog/desktop-gadgets-in-uos/blob/main/display/display_2048_start.png" alt="2048" width = 60% height = 60% /></div>

<div align=center><img src="https://github.com/littlebrotherdog/desktop-gadgets-in-uos/blob/main/display/display_2048_over.png" alt="2048" width = 60% height = 60% /></div>

### 第八步

编写小组件开发手册。

## 开发日程

2022.12 选题，查询资料。

2023.1 阅读《Qt Creator快速入门》，选取案例实践。

2023.2 实现main的window，实现拖拽功能和尺寸调整。

2023.2 实现天气，时钟和备忘录基础功能。

2023.2 绘制ui保持风格统一。

2023.3 增添时钟的计时器功能，可以实现暂停和还原。

2023.3 增添备忘录关键字检索功能，采用indexof函数高亮实现。

2023.4 修改字符串溢出输入框bug，更改换行规则采用：
```
wrapMode: TextEdit.WrapAnywhere //折行，不考虑单词边界
```
2023.4 添加代码注释，增加可读性。

2023.5 丰富小组件内容，更新了息屏特效和2048小程序。

## 系统测试情况

详情见视频讲解

## 遇到的主要问题和解决方法

1.json文件书写问题:设计天气组件时需要从网站api获取数据，这里参考了标准的格式模版，返回中文语言的天气情况

```
function parse_data (weatherData) {
    //var card_window
    var temp = weatherData.main.temp - 273.1500;
    var pressure = weatherData.main.pressure;
    var humidity = weatherData.main.humidity;
    var description = weatherData.weather[0].description;
    var weathericon = weatherData.weather[0].icon;


    card_window.city_T = Math.round(temp).toString() + "°";
    card_window.city_D = description;
    card_window.city_W = "http://openweathermap.org/img/w/" + weathericon + ".png";
    card_window.pressure = Math.round(pressure).toString() + "hpa";
    card_window.humidity = Math.round(humidity).toString() + "%";
}
```

2.icon素材导入无法显示：qrc路径设置为标准格式

```
Card {
	id: xxxxx
	anchors.leftMargin: 20
	anchors.topMargin: 20
	height: 48
	width :48
	img_source: "qrc:/image/xxxxx"

	Label {
		id: x_labelx
		color: "black"
		x: 10
		y: 50
		font.family: "Arial"
		font.pointSize: 10
		text: qsTr("xxxxx")
	}
}
```

3.备忘录检索设计问题：使用indexOf函数进行检索返回红色字体

```
ListView {
	id: list
	Layout.fillHeight: true
	Layout.fillWidth: true
	model: text_model
	
	delegate: Text {
	property string origText: modelData
	text: list.hightlightText(origText)
	}

	function hightlightText(txt){
		var str = input.text;
		var pos = txt.indexOf(str);
		if(pos !== (-1))	return txt.replace(str,"<font color='#FF0000'>" + str + "</font>")
		return txt;
	}
}
```

## 工作分配

耿飚：项目主导，Qt开发，Qt调试，性能测试。

## 比赛收获

当我参加Qt项目开发时，我感到非常兴奋和挑战。Qt是一个跨平台的应用程序开发框架，可以让我们轻松地开发适用于多种操作系统的应用程序。

在参加这个项目之前，我已经对Qt框架有一些基础知识。但是，项目的要求要求我们深入了解框架的各个方面，包括UI设计，信号和槽机制，以及Qt Quick等高级主题。这让我感到非常兴奋，因为我知道这将帮助我成为更好的Qt开发人员。

在项目开始后的前几周，我进行了大量的学习和实践。我花了很多时间来理解项目的需求和规格，并确保我都理解了项目的目标和时间表。

随着项目的推进，我开始感到越来越有信心。我遇到了一些挑战，但我的团队共同努力克服了这些问题，最终成功地完成了项目。

参加这个Qt项目让我学到了很多东西，不仅仅是Qt框架本身，还有项目管理等技能。我很高兴能够参加这样的项目，我期待着未来的机会，继续在Qt开发方面不断进步。

