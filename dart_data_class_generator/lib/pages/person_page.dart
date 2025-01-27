import 'package:dart_data_class_generator/model/person.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  Person generatePerson(
      {required int id, required String name, required String emailAddress}) {
    return Person(id: id, name: name, email: emailAddress);
  }

  @override
  Widget build(BuildContext context) {
    final person1 =
        generatePerson(id: 1, name: 'John', emailAddress: 'john@gmail.com');
    final person2 = person1.copyWith(id: 2, email: 'johndoe@gmail.com');
    final person3 =
        generatePerson(id: 1, name: 'John', emailAddress: 'john@gmail.com');
    print(person1);
    print(person2);
    print(person1 == person3);
    print(person1.hashCode);
    print(person3.hashCode);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
    );
  }
}
