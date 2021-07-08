import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubit/weather_cubit.dart';
import 'package:weather_app_bloc/data/repositories/weather_repository.dart';
import 'package:weather_app_bloc/screens/weather_search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        weatherRepository: FakeWeatherRepository(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: WeatherSearchScreen(),
      ),
    );
  }
}
