import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/filtered_todos/filtered_todos_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_tem/todo_item.dart';
import 'package:todo_riverpod_sync/pages/widgets/todo_item.dart';

class ShowTodos extends ConsumerWidget {
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTodos = ref.watch(filteredTodosProvider);

    return ListView.separated(
        itemBuilder: (_, index) => ProviderScope(
              overrides: [
                todoItemProvider.overrideWithValue(filteredTodos[index])
              ],
              child: const TodoItem(),
            ),
        separatorBuilder: (_, __) => const Divider(
              color: Colors.grey,
            ),
        itemCount: filteredTodos.length);
  }
}
