import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/home_page.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/providers/theme_provider.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/providers/theme_state.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Weather app',
      debugShowCheckedModeBanner: false,
      theme: switch (theme) {
        LightTheme() => ThemeData.light(useMaterial3: true),
        DarkTheme() => ThemeData.dark(useMaterial3: true),
      },
      home: const HomePage(),
    );
  }
}
