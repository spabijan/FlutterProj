import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/models/todo_model.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_filter/todo_filter_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_state.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_search/todo_search_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_tem/todo_item.dart';
import 'package:todo_riverpod_sync/pages/widgets/todo_item.dart';

class ShowTodos extends ConsumerStatefulWidget {
  const ShowTodos({super.key});

  @override
  ConsumerState<ShowTodos> createState() => _ShowTodosState();
}

class _ShowTodosState extends ConsumerState<ShowTodos> {
  Widget _prevTodosWidget = const SizedBox.shrink();

  List<Todo> _filterTodos(List<Todo> allTodos) {
    final filter = ref.watch(todoFilterProvider);
    final search = ref.watch(todoSearchProvider);

    List<Todo> tempTodos;

    tempTodos = switch (filter) {
      Filter.active => allTodos.where((todo) => !todo.completed).toList(),
      Filter.completed => allTodos.where((todo) => todo.completed).toList(),
      Filter.all => allTodos,
    };

    if (search.isNotEmpty) {
      tempTodos = tempTodos
          .where(
              (todo) => todo.desc.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    return tempTodos;
  }

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
      switch (next) {
        case TodoListStateFailure(error: String error):
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Error',
                textAlign: TextAlign.center,
              ),
              content: Text(
                error,
                textAlign: TextAlign.center,
              ),
            ),
          );
        case _:
          break;
      }
    });
    final todoListState = ref.watch(todoListProvider);

    switch (todoListState) {
      case TodoListStateIntial():
        return const SizedBox.shrink();
      case TodoListStateLoading():
        return const Center(child: CircularProgressIndicator());
      case TodoListStateFailure(error: var error)
          when _prevTodosWidget is SizedBox:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error,
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
      case TodoListStateFailure(error: _):
        return _prevTodosWidget;
      case TodoListStateSuccess(todos: List<Todo> todos):
        final filteredTodos = _filterTodos(todos);
        _prevTodosWidget = ListView.separated(
            itemBuilder: (_, index) {
              return ProviderScope(
                overrides: [
                  todoItemProvider.overrideWithValue(filteredTodos[index])
                ],
                child: const TodoItem(),
              );
            },
            separatorBuilder: (_, __) => const Divider(
                  color: Colors.grey,
                ),
            itemCount: filteredTodos.length);
        return _prevTodosWidget;
    }
  }
}
