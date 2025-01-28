import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Todo {
  String id;
  String desc;
  bool completed;
  Todo({
    required this.id,
    required this.desc,
    this.completed = false,
  });

  @override
  String toString() => 'Todo(id: $id, desc: $desc, completed: $completed)';

  factory Todo.add({required String desc}) {
    return Todo(id: uuid.v4(), desc: desc);
  }
}
