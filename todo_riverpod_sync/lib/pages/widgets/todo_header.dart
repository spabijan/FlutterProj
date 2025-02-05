import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:todo_riverpod_sync/models/todo_model.dart';
import 'package:todo_riverpod_sync/pages/providers/theme/theme_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';

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

    todoListState.maybeWhen(
        skipLoadingOnRefresh: false,
        loading: () => context.loaderOverlay.show(),
        orElse: () => context.loaderOverlay.hide());

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
            todoListState.maybeWhen(
                data: (todos) => _getActiveTodoCount(todos),
                orElse: () => _prevTodoCountWidget)
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () => ref.invalidate(todoListProvider),
                icon: const Icon(Icons.refresh)),
            IconButton(
                onPressed: ref.read(themeProvider.notifier).toggleTheme,
                icon: const Icon(Icons.light_mode)),
          ],
        )
      ],
    );
  }
}
