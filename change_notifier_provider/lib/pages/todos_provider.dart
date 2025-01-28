import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo_model.dart';

class TodosNotifier extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(String desc) {
    todos.add(Todo.add(desc: desc));
    notifyListeners();
  }

  void toggleTodo(String id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  void removeTodo(String id) {
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});

// class TodosNotifier extends StateNotifier<List<Todo>> {
//   TodosNotifier() : super([]);

//   void addTodo(String desc) {
//     state = [...state, Todo.add(desc: desc)];
//     // state.add(Todo.add(desc: desc));
//     // print('in addTodo: $state');
//   }

//   void toggleTodo(String id) {
//     state = [
//       for (final todo in state)
//         if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo
//     ];
//   }

//   void removeTodo(String id) {
//     state = [
//       for (final todo in state)
//         if (todo.id != id) todo
//     ];
//   }
// }

// final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
//   return TodosNotifier();
// });
