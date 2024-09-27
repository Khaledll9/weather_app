import 'package:flutter/material.dart';
import 'package:weatehr_app/models/weater_state.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModels? _weatherModels;
  String? cityName;
  set weatherModels(WeatherModels? weaterState) {
    _weatherModels = weaterState;
    notifyListeners();
  }

  WeatherModels? get weatherModels => _weatherModels;
}
