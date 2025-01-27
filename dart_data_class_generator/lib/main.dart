import 'package:dart_data_class_generator/pages/collections_page.dart';
import 'package:dart_data_class_generator/pages/hotel_page.dart';
import 'package:dart_data_class_generator/pages/method.dart';
import 'package:dart_data_class_generator/pages/mutable_person_page.dart';
import 'package:dart_data_class_generator/pages/person_page.dart';
import 'package:dart_data_class_generator/pages/user_list_page.dart';
import 'package:dart_data_class_generator/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart data class generator',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 18))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: const [
            CustomButton(title: 'Person', child: PersonPage()),
            CustomButton(title: 'Mutable Person', child: MutablePersonPage()),
            CustomButton(title: 'Collections', child: CollectionsPage()),
            CustomButton(title: 'User List', child: UserListPage()),
            CustomButton(title: 'Method', child: MethodPage()),
            CustomButton(title: 'Hotel List', child: HotelListPage())
          ],
        ),
      ),
    );
  }
}
