import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatehr_app/models/weater_state.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String keyUrl = 'c742587313ab4103942193536241706&q';
  Future<WeatherModels?> getWeather({required String city}) async {
    WeatherModels? weather;
    try {
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$keyUrl=$city&days=1');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModels.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
