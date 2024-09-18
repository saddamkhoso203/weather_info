// // To parse this JSON data, do
// //
// //     final currentWeatherData = currentWeatherDataFromJson(jsonString);

// import 'dart:convert';

// CurrentWeatherData currentWeatherDataFromJson(String str) => CurrentWeatherData.fromJson(json.decode(str));

// class CurrentWeatherData {
//   CurrentWeatherData({
//     this.weather,
//     this.main,
//     this.wind,
//     this.clouds,
//     this.dt,
//     this.name,
//   });

//   List<Weather>? weather;

//   Main? main;

//   Wind? wind;
//   Clouds? clouds;
//   int? dt;

//   String? name;

//   factory CurrentWeatherData.fromJson(Map<String, dynamic> json) => CurrentWeatherData(
//         weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
//         main: Main.fromJson(json["main"]),
//         wind: Wind.fromJson(json["wind"]),
//         clouds: Clouds.fromJson(json["clouds"]),
//         dt: json["dt"],
//         name: json["name"],
//       );
// }

// class Clouds {
//   Clouds({
//     this.all,
//   });

//   int? all;

//   factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
//         all: json["all"],
//       );

//   Map<String, dynamic> toJson() => {
//         "all": all,
//       };
// }

// class Main {
//   Main({
//     this.temp,
//     this.tempMin,
//     this.tempMax,
//     this.humidity,
//   });

//   int? temp;

//   int? tempMin;
//   int? tempMax;

//   int? humidity;

//   factory Main.fromJson(Map<String, dynamic> json) => Main(
//         temp: json["temp"].toInt(),
//         tempMin: json["temp_min"].toInt(),
//         tempMax: json["temp_max"].toInt(),
//         humidity: json["humidity"],
//       );
// }

// class Weather {
//   Weather({
//     this.main,
//     this.icon,
//   });

//   String? main;

//   String? icon;

//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//         main: json["main"],
//         icon: json["icon"],
//       );
// }

// class Wind {
//   Wind({
//     this.speed,
//     this.deg,
//   });

//   double? speed;
//   int? deg;

//   factory Wind.fromJson(Map<String, dynamic> json) => Wind(
//         speed: json["speed"].toDouble(),
//         deg: json["deg"],
//       );

//   Map<String, dynamic> toJson() => {
//         "speed": speed,
//         "deg": deg,
//       };
// }

// To parse this JSON data, do
//
//     final currentWeatherData = currentWeatherDataFromJson(jsonString);

import 'dart:convert';

CurrentWeatherData currentWeatherDataFromJson(String str) => CurrentWeatherData.fromJson(json.decode(str));

String currentWeatherDataToJson(CurrentWeatherData data) => json.encode(data.toJson());

class CurrentWeatherData {
    Coord coord;
    List<Weather> weather;
    String base;
    Main main;
    int visibility;
    Wind wind;
    Clouds clouds;
    int dt;
    Sys sys;
    int timezone;
    int id;
    String name;
    int cod;

    CurrentWeatherData({
        required this.coord,
        required this.weather,
        required this.base,
        required this.main,
        required this.visibility,
        required this.wind,
        required this.clouds,
        required this.dt,
        required this.sys,
        required this.timezone,
        required this.id,
        required this.name,
        required this.cod,
    });

    factory CurrentWeatherData.fromJson(Map<String, dynamic> json) => CurrentWeatherData(
        coord: Coord.fromJson(json["coord"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"],
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
    };
}

class Clouds {
    int all;

    Clouds({
        required this.all,
    });

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class Coord {
    double lon;
    double lat;

    Coord({
        required this.lon,
        required this.lat,
    });

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
    };
}

class Main {
    double temp;
    double feelsLike;
    double tempMin;
    double tempMax;
    int pressure;
    int humidity;
    int seaLevel;
    int grndLevel;

    Main({
        required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.humidity,
        required this.seaLevel,
        required this.grndLevel,
    });

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
    };
}

class Sys {
    String country;
    int sunrise;
    int sunset;

    Sys({
        required this.country,
        required this.sunrise,
        required this.sunset,
    });

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Weather {
    int id;
    String main;
    String description;
    String icon;

    Weather({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}

class Wind {
    double speed;
    int deg;
    double gust;

    Wind({
        required this.speed,
        required this.deg,
        required this.gust,
    });

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
    };
}
