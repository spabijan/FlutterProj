import 'package:asyncvalue_details/extensions/async_value_xx.dart';
import 'package:asyncvalue_details/models/cities.dart';
import 'package:asyncvalue_details/pages/weather_first/weather_first_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

int _selectedCityIndex = 1;

class WeatherFirstPage extends ConsumerWidget {
  const WeatherFirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<String>>(weatherFirstProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(next.error.toString()),
          ),
        );
      }
    });
    final weather = ref.watch(weatherFirstProvider);
    print(weather.toStr);
    print(weather.props);

    try {
      print('walue: ${weather.value}');
    } on Exception catch (e) {
      print(e.toString());
    }

    print('valueOrNull: ${weather.valueOrNull}');

    try {
      print('requiredValue: ${weather.requireValue}');
    } on StateError {
      print('StateError');
    } catch (e) {
      print(e.toString());
    }
    print('==================');

    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncValue Details - First'),
        actions: [
          IconButton(
              onPressed: () {
                _selectedCityIndex = 1;
                ref.invalidate(weatherFirstProvider);
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
          child: weather.when(
              skipError: true,
              skipLoadingOnRefresh: false,
              data: (temp) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(temp,
                          style: Theme.of(context).textTheme.headlineLarge),
                      SizedBox(
                        height: 20,
                      ),
                      GetWeatherButton()
                    ],
                  ),
              error: (error, stackTrace) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        error.toString(),
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const GetWeatherButton()
                    ],
                  ),
              loading: () => CircularProgressIndicator())),
    );
  }
}

class GetWeatherButton extends ConsumerWidget {
  const GetWeatherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
        onPressed: () {
          final cityIndex = _selectedCityIndex % 4;
          final city = Cities.values[cityIndex];
          _selectedCityIndex++;
          ref.read(weatherFirstProvider.notifier).getTemperature(city);
        },
        child: Text('Get Weather'));
  }
}
