// import 'package:demo_application/models/current_weather_model.dart';
// import 'package:demo_application/models/hourly_weather_model.dart';

// import '../consts/strings.dart';
import 'package:http/http.dart' as http;
import 'package:weather_info/consts/strings.dart';
import 'package:weather_info/models/current_weather_model.dart';
import 'package:weather_info/models/hourly_weather_model.dart';



 var hourlylink = "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$langitude&appid=$ApiKey&units=metric";




getCurrentWeather(lat, lang) async {
  var link = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lang&appid=$ApiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = currentWeatherDataFromJson(res.body.toString());
print("data is recieved ");
    return data;
  }   
}

getHourlyWeather(lat, lang) async {
  var link = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lang&appid=$ApiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
   
   var data = hourlyWeatherDataFromJson(res.body.toString());
print("hourly weather updated");
    return data;
  }
}
