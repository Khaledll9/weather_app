import 'package:flutter/material.dart';

class WeatherModels {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModels(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModels.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    return WeatherModels(
        date: data["location"]["localtime"],
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }
  @override
  String toString() {
    return 'date: $date temp: $temp maxTemp: $maxTemp minTemp: $minTemp state: $weatherStateName';
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Clooud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Snow' || weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstrom' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Clooud' ||
        weatherStateName == 'Patchy rain nearby') {
      return Colors.cyan;
    } else if (weatherStateName == 'Snow' || weatherStateName == 'Hail') {
      return Colors.orange;
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Moderate rain') {
      return Colors.grey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Thunderstrom' ||
        weatherStateName == 'Sunny' ||
        weatherStateName == 'Thunder') {
      return Colors.lightGreen;
    } else {
      return Colors.orange;
    }
  }
}
