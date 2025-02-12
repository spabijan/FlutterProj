import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mvvm_basic/constants/my_app_theme_data.dart';
import 'package:flutter_mvvm_basic/screens/movies_screen.dart';
import 'package:flutter_mvvm_basic/utils/init_getit.dart';
import 'package:flutter_mvvm_basic/utils/app_context_utils.dart';
import 'package:flutter_mvvm_basic/widgets/splash_sreen.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) async {
      await dotenv.load(fileName: '.env');
      runApp(const MainApp());
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: getIt<NavigationUtils>().navigatorKey,
        title: 'Flutter demo',
        theme: MyAppThemeData.lightTheme,
        home: SplashSreen());
  }
}
