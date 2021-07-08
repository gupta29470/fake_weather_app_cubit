import 'package:bloc/bloc.dart';
import 'package:weather_app_bloc/data/repositories/weather_repository.dart';

import '../data/models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather: weather));
    } on NetworkException {
      emit(
        WeatherError(
          errorMessage:
              "Couldn't fetch weather, check your internet or try again later.",
        ),
      );
    }
  }
}
