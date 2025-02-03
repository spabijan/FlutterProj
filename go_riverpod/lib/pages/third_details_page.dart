import 'package:flutter/material.dart';

class ThirdDetailsPage extends StatelessWidget {
  const ThirdDetailsPage({
    super.key,
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final String id;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Details'),
      ),
      body: Center(
        child: Text(
          'your id: $id\n($firstName $lastName)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
