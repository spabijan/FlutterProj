import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/filtered_todos/filtered_todos_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_state.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_tem/todo_item.dart';
import 'package:todo_riverpod_sync/pages/widgets/todo_item.dart';

class ShowTodos extends ConsumerStatefulWidget {
  const ShowTodos({super.key});

  @override
  ConsumerState<ShowTodos> createState() => _ShowTodosState();
}

class _ShowTodosState extends ConsumerState<ShowTodos> {
  Widget _prevTodosWidget = const SizedBox.shrink();

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref.read(todoListProvider.notifier).getTodos();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(todoListProvider, (previous, next) {
      if (next.status == TodoListStatus.failure) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text(
              'Error',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    });
    final todoListState = ref.watch(todoListProvider);
    final filteredTodos = ref.watch(filteredTodosProvider);

    switch (todoListState.status) {
      case TodoListStatus.initial:
        return const SizedBox.shrink();
      case TodoListStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case TodoListStatus.failure when _prevTodosWidget is SizedBox:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                todoListState.error,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () => Future.microtask(
                        ref.read(todoListProvider.notifier).getTodos,
                      ),
                  child: const Text(
                    'Please Retry!',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        );
      case TodoListStatus.failure:
      case TodoListStatus.success:
        _prevTodosWidget = ListView.separated(
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
        return _prevTodosWidget;
    }
  }
}
