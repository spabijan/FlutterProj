import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';

part 'active_todo_count_provider.g.dart';

@riverpod
int activeTodoCount(Ref ref) {
  final todoListState = ref.watch(todoListProvider);
  return todoListState.todos
      .where((element) => !element.completed)
      .toList()
      .length;
}
