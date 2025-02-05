import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_riverpod_sync/models/todo_model.dart';

sealed class TodoListState {
  const TodoListState();
}

final class TodoListStateIntial extends TodoListState {
  const TodoListStateIntial();

  @override
  String toString() => 'TodoListStateIntial';
}

final class TodoListStateLoading extends TodoListState {
  const TodoListStateLoading();

  @override
  String toString() => 'TodoListStateLoading';
}

final class TodoListStateFailure extends TodoListState {
  TodoListStateFailure({required this.error});

  final String error;

  @override
  String toString() => 'TodoListStateError($error)';
}

final class TodoListStateSuccess extends TodoListState {
  const TodoListStateSuccess({required this.todos});

  final List<Todo> todos;

  @override
  String toString() => 'TodoListStateSuccess(todos $todos)';
}
