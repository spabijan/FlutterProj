import 'package:dart_data_class_generator/model/mutable_person.dart';
import 'package:flutter/material.dart';

class MutablePersonPage extends StatelessWidget {
  const MutablePersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final person1 = MutablePerson(id: 1, name: 'John', email: 'john@gmail.com');
    final person2 = person1.copyWith(id: 2, email: 'johndoe@gmail.com');

    person1.name = 'New Name';
    print(person1);
    print(person2);
    print(person1.hashCode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mutable Person'),
      ),
    );
  }
}
