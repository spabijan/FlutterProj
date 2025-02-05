import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod_asyncvalue/models/current_weather/current_weather.dart';
import 'package:weather_riverpod_asyncvalue/models/custom_error/custom_error.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/widgets/show_weather.dart';
import 'package:weather_riverpod_asyncvalue/pages/temp_settings/temp_settings_page.dart';
import 'package:weather_riverpod_asyncvalue/widgets/error_dialog.dart';

import '../../extensions/async_value_xx.dart';
import '../search/search_page.dart';
import 'providers/weather_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String? city;

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);
    print(weatherState.toStr);

    ref.listen<AsyncValue<CurrentWeather?>>(
      weatherProvider,
      (previous, next) => next.whenOrNull(
          error: (error, stackTrace) =>
              ErrorDialog.errorDialog(context, (error as CustomError).errMsg)),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () async {
              city = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
              if (city != null) {
                ref.read(weatherProvider.notifier).fetchWeather(city!);
              }
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TempSettingsPage(),
                  )),
              icon: Icon(Icons.settings))
        ],
      ),
      body: ShowWeather(weatherState: weatherState),
      floatingActionButton: FloatingActionButton(
        onPressed: city == null
            ? null
            : () => ref.read(weatherProvider.notifier).fetchWeather(city!),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
