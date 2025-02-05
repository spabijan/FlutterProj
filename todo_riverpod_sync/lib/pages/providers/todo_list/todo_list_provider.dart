import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_riverpod_sync/models/todo_model.dart';
import 'package:todo_riverpod_sync/repositories/providers/todos_repository_provider.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  FutureOr<List<Todo>> build() {
    return _getTodos();
  }

  Future<List<Todo>> _getTodos() {
    return ref.read(todosRepositoryProvider).getTodos();
  }

  void addTodo(String desc) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final newTodo = Todo.add(desc: desc);
      await ref.read(todosRepositoryProvider).addTodo(todo: newTodo);
      return [...state.value!, newTodo];
    });
  }

  void editTodo(String id, String desc) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return [
        for (final todo in state.value!)
          if (todo.id == id) todo.copyWith(desc: desc) else todo
      ];
    });
  }

  void toggleTodo(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return [
        for (final todo in state.value!)
          if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo
      ];
    });
  }

  void removeTodo(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return [
        for (final todo in state.value!)
          if (todo.id != id) todo
      ];
    });
  }
}
