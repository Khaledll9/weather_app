import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatehr_app/cubits/weather_cubit_state.dart';
import 'package:weatehr_app/cubits/weather_cubits.dart';
import 'package:weatehr_app/pages/home_page.dart';
import 'package:weatehr_app/services/weather_service.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) =>
          WeatherCubits(WeatherServices(), WeatherinitialState()),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
