import 'package:dart_data_class_generator/model/method.dart';
import 'package:flutter/material.dart';

class MethodPage extends StatelessWidget {
  const MethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    const method1 = Method('method1');
    method1.printMethod();
    const method2 = Method('method1', version: 1.2);
    method2.printMethod();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method'),
      ),
    );
  }
}
