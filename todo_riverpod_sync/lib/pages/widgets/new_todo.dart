import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';

class NewTodo extends ConsumerStatefulWidget {
  const NewTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewTodoState();
}

class _NewTodoState extends ConsumerState<NewTodo> {
  final newTodoController = TextEditingController();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      decoration: const InputDecoration(labelText: 'What to do?'),
      onSubmitted: (String? value) {
        if (value != null && value.trim().isNotEmpty) {
          ref.read(todoListProvider.notifier).addTodo(value);
          newTodoController.clear();
        }
      },
    );
  }
}
