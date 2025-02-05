import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:todo_riverpod_sync/models/todo_model.dart';
import 'package:todo_riverpod_sync/pages/providers/theme/theme_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_state.dart';

class TodoHeader extends ConsumerStatefulWidget {
  const TodoHeader({super.key});

  @override
  ConsumerState<TodoHeader> createState() => _TodoHeaderState();
}

class _TodoHeaderState extends ConsumerState<TodoHeader> {
  final Widget _prevTodoCountWidget = const SizedBox.shrink();

  Widget _getActiveTodoCount(List<Todo> todos) {
    final length = todos.length;
    final activeTodos =
        todos.where((element) => !element.completed).toList().length;

    return Text(
      '($activeTodos/$length item${activeTodos != 1 ? "s" : ""} left)',
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.blue[900],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoListState = ref.watch(todoListProvider);

    switch (todoListState) {
      case TodoListStateLoading():
        context.loaderOverlay.show();
      case _:
        context.loaderOverlay.hide();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'TODO',
              style: TextStyle(fontSize: 36.0),
            ),
            const SizedBox(width: 10),
            switch (todoListState) {
              TodoListStateSuccess(todos: var todos) =>
                _getActiveTodoCount(todos),
              _ => _prevTodoCountWidget
            }
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: todoListState is TodoListStateLoading
                    ? null
                    : ref.read(todoListProvider.notifier).getTodos,
                icon: const Icon(Icons.refresh)),
            IconButton(
                onPressed: todoListState is TodoListStateLoading
                    ? null
                    : ref.read(themeProvider.notifier).toggleTheme,
                icon: const Icon(Icons.light_mode)),
          ],
        )
      ],
    );
  }
}
