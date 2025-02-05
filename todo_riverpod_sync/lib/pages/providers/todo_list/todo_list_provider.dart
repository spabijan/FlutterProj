import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_riverpod_sync/models/todo_model.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_state.dart';
import 'package:todo_riverpod_sync/repositories/providers/todos_repository_provider.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  List<Todo> _todos = [];

  @override
  TodoListState build() {
    return const TodoListStateIntial();
  }

  void getTodos() async {
    state = const TodoListStateLoading();

    try {
      _todos = await ref.read(todosRepositoryProvider).getTodos();
      state = TodoListStateSuccess(todos: _todos);
    } catch (e) {
      state = TodoListStateFailure(error: e.toString());
    }
  }

  void addTodo(String desc) async {
    state = const TodoListStateLoading();

    try {
      final newTodo = Todo.add(desc: desc);
      await ref.read(todosRepositoryProvider).addTodo(todo: newTodo);
      _todos = [..._todos, newTodo];

      state = TodoListStateSuccess(todos: _todos);
    } catch (e) {
      state = state = TodoListStateFailure(error: e.toString());
    }
  }

  void editTodo(String id, String desc) async {
    state = const TodoListStateLoading();
    try {
      await ref.read(todosRepositoryProvider).editTodo(id: id, desc: desc);
      _todos = [
        for (final todo in _todos)
          if (todo.id == id) todo.copyWith(desc: desc) else todo
      ];
      state = TodoListStateSuccess(todos: _todos);
    } catch (e) {
      state = state = TodoListStateFailure(error: e.toString());
    }
  }

  void toggleTodo(String id) async {
    state = const TodoListStateLoading();
    try {
      await ref.read(todosRepositoryProvider).toggleTodo(id: id);
      _todos = [
        for (final todo in _todos)
          if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo
      ];
      state = TodoListStateSuccess(todos: _todos);
    } catch (e) {
      state = state = state = TodoListStateFailure(error: e.toString());
    }
  }

  void removeTodo(String id) async {
    state = const TodoListStateLoading();
    try {
      await ref.read(todosRepositoryProvider).removeTodo(id: id);
      _todos = [
        for (final todo in _todos)
          if (todo.id != id) todo
      ];
      state = TodoListStateSuccess(todos: _todos);
    } catch (e) {
      state = state = TodoListStateFailure(error: e.toString());
    }
  }
}
