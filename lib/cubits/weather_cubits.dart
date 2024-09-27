import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatehr_app/cubits/weather_cubit_state.dart';
import 'package:weatehr_app/models/weater_state.dart';
import 'package:weatehr_app/services/weather_service.dart';

class WeatherCubits extends Cubit<WeatherState> {
  WeatherCubits(this.weatherServices, super.initialState);
  Color color = Colors.blue;
  WeatherServices weatherServices;
  WeatherModels? weatherModels;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLodingState());

    try {
      weatherModels = await weatherServices.getWeather(city: cityName);
      color = weatherModels!.getColor();
      emit(WeatherSuccessState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
