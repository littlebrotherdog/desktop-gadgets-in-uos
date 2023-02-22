var city;

function setCityName(name) { city = name; }

function addZero(i) {
    if (i < 10) i = "0" + i;
    return i;
}

/* 1 Day */
function parseJSON() {
    var weatherAppKey = "f23961cb493d52dbd56fd0d656b3a396";

    if (weatherAppKey !== "") {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + weatherAppKey + "&lang=zh_cn");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var a = JSON.parse(xhr.responseText);
                if(a.cod === "404") {
                    console.log(a.message)
                    card_window.cityTemperature = "N/A"
                    card_window.highTemperature = "N/A"
                    card_window.lowTemperature = "N/A"
                } else {
                    parseWeatherData(a);
                }
            }
        }
        xhr.send();
    } else {
        console.log("ERROR: No App Key")
    }
}

function parseWeatherData(weatherData) {
    var temp = weatherData.main.temp - 273.15;
    var temp_min = weatherData.main.temp_min - 273.15;
    var temp_max = weatherData.main.temp_max - 273.15;
    var wind_speed = weatherData.wind.speed;                //m/sec
    var wind_direction = weatherData.wind.deg;              //angle
    var clouds = weatherData.clouds.all;                    //%
    var pressure = weatherData.main.pressure;               //hpa
    var humidity = weatherData.main.humidity;               //%
    var longitude = weatherData.coord.lon;
    var latitude = weatherData.coord.lat;
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

/* 5 Days */
function parseJSON5Days() {
    var weatherAppKey = "f23961cb493d52dbd56fd0d656b3a396";

    if (weatherAppKey !== "") {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "http://api.openweathermap.org/data/2.5/forecast?q=" + city + "&appid=" + weatherAppKey +
                 "&units=metric" + "&lang=zh_cn" + "&cnt=40");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var a = JSON.parse(xhr.responseText);
                parseWeatherData5Days(a);
            }
        }
        xhr.send();
    } else {
        console.log("ERROR: No App Key")
    }
}

function parseWeatherData5Days(weatherData) {
    /* Properties */
    var mintemp = 99;
    var maxtemp = -99;
    var maxDate = new Date();
    var pressureMin = 5000;
    var pressureMax = -5000;
    var windMin = 5000;
    var windMax = -5000;
    var index = 0;

    for(var i = 0; i < weatherData.cnt; i++) {
        var temperature = (weatherData.list[i].main.temp).toFixed(2);
        var temperature_min = (weatherData.list[i].main.temp_min - 273.15).toFixed(2);
        var temperature_max = (weatherData.list[i].main.temp_max - 273.15).toFixed(2);
        var pressure = (weatherData.list[i].main.pressure).toFixed(2);
        var clouds = weatherData.list[i].clouds.all;
        var wind = weatherData.list[i].wind.speed;
        var date = new Date(weatherData.list[i].dt_txt);
        var weathericon = weatherData.list[i].weather[0].icon;
        if(i < 6) {
            card_window.insertWeatherModel(i, {time: qsTr(date.getHours().toString() + "时"),
                                        weather_icon: "http://openweathermap.org/img/w/" + weathericon + ".png",
                                        temp: Math.round(temperature).toString() + "°"});
        }
        if(date.getHours() === 12 && i >= 1 && index < 5) {
            card_window.insertWeatherModel2(index, {time: qsTr(date.toString().slice(0,2)),
                                        weather_icon: "http://openweathermap.org/img/w/" + weathericon + ".png",
                                        temp: Math.round(temperature).toString() + "°"});
            index = index + 1;
        }
    }
}
