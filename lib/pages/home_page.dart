import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatehr_app/cubits/weather_cubit_state.dart';
import 'package:weatehr_app/cubits/weather_cubits.dart';
import 'package:weatehr_app/models/weater_state.dart';
import 'package:weatehr_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModels? weatherData;
    return BlocBuilder<WeatherCubits, WeatherState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: BlocProvider.of<WeatherCubits>(context).color,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const SearchPage();
                      }),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
              title: const Text(
                'Weather',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: BlocBuilder<WeatherCubits, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLodingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherFailureState) {
                  return const Center(
                    child: Text('Something went wrong, Please try again'),
                  );
                } else if (state is WeatherSuccessState) {
                  weatherData =
                      BlocProvider.of<WeatherCubits>(context).weatherModels;
                  return SuccessBody(weatherData: weatherData!);
                } else {
                  return const Center(
                    child: Text(
                      'There is no weather 😅 yet. Start searching now ',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
              },
            ));
      },
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({required this.weatherData, super.key});

  final WeatherModels weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BlocProvider.of<WeatherCubits>(context).color,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            weatherData.getColor(),
            weatherData.getColor()[300]!,
            weatherData.getColor()[100]!,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              BlocProvider.of<WeatherCubits>(context).cityName!,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'updata ${weatherData.date.toString()}',
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData.getImage()),
                Text(
                  '${weatherData.temp}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      weatherData.maxTemp.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      weatherData.minTemp.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              weatherData.weatherStateName.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
