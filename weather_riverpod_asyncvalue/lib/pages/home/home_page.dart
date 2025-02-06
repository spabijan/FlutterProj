import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_riverpod_asyncvalue/constants/constants.dart';
import 'package:weather_riverpod_asyncvalue/models/current_weather/app_weather.dart';
import 'package:weather_riverpod_asyncvalue/models/current_weather/current_weather.dart';
import 'package:weather_riverpod_asyncvalue/models/custom_error/custom_error.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/providers/theme_provider.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/providers/theme_state.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/widgets/show_weather.dart';
import 'package:weather_riverpod_asyncvalue/pages/temp_settings/temp_settings_page.dart';
import 'package:weather_riverpod_asyncvalue/services/providers/weather_api_services_provider.dart';
import 'package:weather_riverpod_asyncvalue/utils/geolocator.dart';
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
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _getInitialLocation();
  }

  void _showGeolocationError(String errorMessage) {
    Future.microtask(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$errorMessage using ${Constants.kdefaultLocation}'),
        ),
      );
    });
  }

  void _getInitialLocation() async {
    final bool permitted = await GeolocatorUtils.getLocationPermission(
        showGeolocationError: _showGeolocationError);

    if (permitted) {
      try {
        setState(() => loading = true);
        final pos = await Geolocator.getCurrentPosition();
        city = await ref
            .read(weatherApiServicesProvider)
            .getReverseGeocoding(lat: pos.latitude, lon: pos.longitude);
      } catch (e) {
        city = Constants.kdefaultLocation;
      } finally {
        setState(() => loading = false);
      }
    } else {
      city = Constants.kdefaultLocation;
    }
    ref.read(weatherProvider.notifier).fetchWeather(city!);
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);
    print(weatherState.toStr);

    ref.listen<AsyncValue<CurrentWeather?>>(
      weatherProvider,
      (previous, next) => next.whenOrNull(
          data: (CurrentWeather? currentWeather) {
            if (currentWeather == null) return;

            final weather = AppWeather.fromCurrentWeather(currentWeather);
            ref.read(themeProvider.notifier).changeTheme(
                (weather.temp >= Constants.kIsWarm)
                    ? const LightTheme()
                    : const DarkTheme());
          },
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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ShowWeather(weatherState: weatherState),
      floatingActionButton: FloatingActionButton(
        onPressed: city == null
            ? null
            : () => ref.read(weatherProvider.notifier).fetchWeather(city!),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
