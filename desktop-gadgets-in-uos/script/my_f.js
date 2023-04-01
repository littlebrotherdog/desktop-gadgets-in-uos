var city,country,town,weather,time;
var x,y,z,u,v,w;

function op(){
    const isJson = str => {
      try {
        JSON.parse(str);
        return true;
      } catch (e) {
        return false;
      }
    };
    isJson('{"name":"小明","address":"苏州"}');
    isJson('{"name":"小王",address:"南京"}');
}

function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear();
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1):date.getMonth()+1);
        var D = (date.getDate()< 10 ? '0'+date.getDate():date.getDate());
        return Y+"年"+M+"月"+D+"日";
}

function getNowFormatDate() {
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + "年" + month + "月" + strDate + "日";
        $("#time").html(currentdate)
        return currentdate;
}

function toDecimal(x) {
        var f = parseFloat(x);
        if (isNaN(f)) {
            return;
        }
        f = Math.round(x*100)/100;
        return f;
}

var digitUppercase = function(n) {
        var fraction = ['角', '分'];
        var digit = [
            '零', '壹', '贰', '叁', '肆',
            '伍', '陆', '柒', '捌', '玖'
        ];
        var unit = [
            ['元', '万', '亿'],
            ['', '拾', '佰', '仟']
        ];
        var head = n < 0 ? '欠' : '';
        n = Math.abs(n);
        var s = '';
        for (var i = 0; i < fraction.length; i++) {
            s += (digit[Math.floor(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');
        }
        s = s || '整';
        n = Math.floor(n);

        return head + s.replace(/(零.)*零元/, '元')
                .replace(/(零.)+/g, '零')
                .replace(/^整$/, '零元整');
 }

function setCityName(name) {
    city = name;
}

function setrandom(name) {
    time = name;
}

function addZero(i) {
    if (i < 10) i = "0" + i;
    return i;
}

function itIsDate(DateString , Dilimeter)
{
  if (DateString===null) return false;
  if (Dilimeter==='' || Dilimeter===null)
   Dilimeter = '-';
  var tempy='';
  var tempm='';
  var tempd='';
  var tempArray;
  if (DateString.length<8 && DateString.length>10)
    return false;
  tempArray = DateString.split(Dilimeter);
  if (tempArray.length!==3)
   return false;
  if (tempArray[0].length===4)
  {
   tempy = tempArray[0];
   tempd = tempArray[2];
  }
  else
  {
   tempy = tempArray[2];
   tempd = tempArray[1];
  }
  tempm = tempArray[1];
  var tDateString = tempy + '/'+tempm + '/'+tempd+' 8:0:0';//加八小时是因为我们处于东八区
  var tempDate = new Date(tDateString);
  if (isNaN(tempDate))
   return false;
 if (((tempDate.getUTCFullYear()).toString()===tempy) && (tempDate.getMonth()===parseInt(tempm)-1) && (tempDate.getDate()===parseInt(tempd)))
  {
   return true;
  }
  else
  {
   return false;
  }
}

function getExplorerInfo() {
  let t = navigator.userAgent.toLowerCase();
  return 0 <= t.indexOf("msie") ? { //ie < 11
    type: "IE",
    version: Number(t.match(/msie ([\d]+)/)[1])
  } : !!t.match(/trident\/.+?rv:(([\d.]+))/) ? { // ie 11
    type: "IE",
    version: 11
  } : 0 <= t.indexOf("edge") ? {
    type: "Edge",
    version: Number(t.match(/edge\/([\d]+)/)[1])
  } : 0 <= t.indexOf("firefox") ? {
    type: "Firefox",
    version: Number(t.match(/firefox\/([\d]+)/)[1])
  } : 0 <= t.indexOf("chrome") ? {
    type: "Chrome",
    version: Number(t.match(/chrome\/([\d]+)/)[1])
  } : 0 <= t.indexOf("opera") ? {
    type: "Opera",
    version: Number(t.match(/opera.([\d]+)/)[1])
  } : 0 <= t.indexOf("Safari") ? {
    type: "Safari",
    version: Number(t.match(/version\/([\d]+)/)[1])
  } : {
    type: t,
    version: -1
  }
}

function parse_JS_1() {
    var weatherAppKey = "f23961cb493d52dbd56fd0d656b3a396";
    var cnt_cnt=0;
    var num=1,sum;


    if (weatherAppKey !== "") {
        var addr = new XMLHttpRequest;
        addr.open("GET", "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + weatherAppKey + "&lang=zh_cn");

        addr.onreadystatechange = function() {
            if (addr.readyState === XMLHttpRequest.DONE) {
                var u = JSON.parse(addr.responseText);
                var v = JSON.parse(addr.responseText);
                var w = JSON.parse(addr.responseText);
                if(u.cod === "404") {
                    card_window.cityTemperature = "xxx"
                    card_window.highTemperature = "xxx"
                    card_window.lowTemperature = "xxx"
                    card_window.humidity = "xxx"
                    card_window.cityDescription = "xxx"
                }
                else parse_data(u);
            }
        }
        addr.send();
    }
    else cnt_cnt++;

    if(cnt_cnt === 10086) sum+=num;
}

function parse_data (weatherData) {

    var temp = weatherData.main.temp - 273.15;
    var wind_speed = weatherData.wind.speed;
    var wind_direction = weatherData.wind.deg;
    var clouds = weatherData.clouds.all;
    var pressure = weatherData.main.pressure;
    var humidity = weatherData.main.humidity;
    var country = weatherData.sys.country;
    var description = weatherData.weather[0].description;
    var weathericon = weatherData.weather[0].icon;
    var sunrise = new Date(weatherData.sys.sunrise * 1000);
    var sunset = new Date(weatherData.sys.sunset * 1000);
    var sea_level = weatherData.main.sea_level;
    var grd_level = weatherData.main.grnd_level;
    var wind_deg = weatherData.wind.deg;

    card_window.cityTemperature = Math.round(temp.toFixed(2)).toString() + "°";
    card_window.pressure = Math.round(pressure.toFixed(2)).toString() + "hpa";
    card_window.humidity = Math.round(humidity.toFixed(2)).toString() + "%";
    card_window.cityDescription = description
    card_window.cityWeatherIcon = "http://openweathermap.org/img/w/" + weathericon + ".png"
}

function parse_JS_5() {
    var weatherAppKey = "f23961cb493d52dbd56fd0d656b3a396";
    var cnt=0;

    if (weatherAppKey !== "") {
        var addr = new XMLHttpRequest;
        addr.open("GET", "http://api.openweathermap.org/data/2.5/forecast?q=" + city + "&appid=" + weatherAppKey +"&units=metric" + "&lang=zh_cn" + "&cnt=40");

        addr.onreadystatechange = function() {
            if (addr.readyState === XMLHttpRequest.DONE) {
                var u = JSON.parse(addr.responseText);
                var v = JSON.parse(addr.responseText);
                var w = JSON.parse(addr.responseText);
                parse_data_5(u); 
            }
        }
        addr.send();
    }

    else cnt++;
}

function downloadFile(filename, data){
  let DownloadLink = document.createElement('a');

  if ( DownloadLink ){
    document.body.appendChild(DownloadLink);
    DownloadLink.style = 'display: none';
    DownloadLink.download = filename;
    DownloadLink.href = data;

    if ( document.createEvent ){
      let DownloadEvt = document.createEvent('MouseEvents');

      DownloadEvt.initEvent('click', true, false);
      DownloadLink.dispatchEvent(DownloadEvt);
    }
    else if ( document.createEventObject )
      DownloadLink.fireEvent('onclick');
    else if (typeof DownloadLink.onclick == 'function' )
      DownloadLink.onclick();

    document.body.removeChild(DownloadLink);
  }
}

function parse_data_5 (weatherData) {

    var cnt = 0;
    var sum = 0;

    for(var i = 0; i < weatherData.cnt; i++) {

        var temperature = (weatherData.list[i].main.temp).toFixed(2);
        var temp = weatherData.list[i].main.temp;
        var p = weatherData.list[i].main.pressure;
        var pressure = (weatherData.list[i].main.pressure).toFixed(2);
        var clouds = weatherData.list[i].clouds.all;
        var wind = weatherData.list[i].wind.speed;
        var date = new Date(weatherData.list[i].dt_txt);
        var weathericon = weatherData.list[i].weather[0].icon;
        if(i < 6) {
            card_window.insert_Model(i, {time: qsTr(date.getHours().toString() + "时"),weather_icon: "http://openweathermap.org/img/w/" + weathericon + ".png",
            temp: Math.round(temperature).toString() + "°"});
        }
        if(date.getHours() === 12 && i >= 1 && cnt < 5) {
            card_window.insert_Model2(cnt, {time: qsTr(date.toString().slice(0,2)),weather_icon: "http://openweathermap.org/img/w/" + weathericon + ".png",
            temp: Math.round(temperature).toString() + "°"});
            cnt++;
        }
    }
}

function browserRedirect() {
                //var sUserAgent = navigator.userAgent.toLowerCase();
                var bIsIpad = sUserAgent.match(/ipad/i) === "ipad";
                var bIsIphoneOs = sUserAgent.match(/iphone os/i) === "iphone os";
                var bIsMidp = sUserAgent.match(/midp/i) === "midp";
                var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) === "rv:1.2.3.4";
                var bIsUc = sUserAgent.match(/ucweb/i) === "ucweb";
                var bIsAndroid = sUserAgent.match(/android/i) === "android";
                var bIsCE = sUserAgent.match(/windows ce/i) === "windows ce";
                var bIsWM = sUserAgent.match(/windows mobile/i) === "windows mobile";
                if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
                    //手机端
                } else {
                    //pc端
                    $('*').css("width",'100%');
                    $('*').css("height",'100%');
                }
}
browserRedirect();      //判断是手机端还是pc端
$(function(){
                var h = window.screen.height;
                var w = window.screen.width;
                $('#myiframe').attr("width",w);  //把宽属性追加进去
                $('#myiframe').attr("height",h);  //把高属性追加进去
 })
//返回最近七天的日期
    function getday2() {
        var days = [];
        var date = new Date();
        for(var i=0; i<=144;i+=24){    //144是前六天的小时数
            var dateItem=new Date(date.getTime() - i * 60 * 60 * 1000);  //使用当天时间戳减去以前的时间毫秒（小时*分*秒*毫秒）
            var y = dateItem.getFullYear();  //获取年份
            var m = dateItem.getMonth() + 1;  //获取月份js月份从0开始，需要+1
            var d= dateItem.getDate();  //获取日期
            m = addDate0(m);  //给为单数的月份补零
            d = addDate0(d);  //给为单数的日期补零
            var valueItem= y + '-' + m + '-' + d;  //组合
            days.push(valueItem);  //添加至数组
        }
        console.log('最近七天日期：',days);
        return days;
    }

    //给日期加0
    function addDate0(time) {
        if (time.toString().length === 1) {
            time = '0' + time.toString();
        }
        return time;
    }
function randombetween(min, max){
    return min + (Math.random() * (max-min +1));
}
