import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/search_provider/search_provider.dart';
import 'package:todo_riverpod_sync/utils/debounce.dart';

class SearchTodo extends ConsumerStatefulWidget {
  const SearchTodo({super.key});

  @override
  ConsumerState<SearchTodo> createState() => _SearchTodoState();
}

class _SearchTodoState extends ConsumerState<SearchTodo> {
  final debounce = Debounce(milliseconds: 1000);

  @override
  void dispose() {
    super.dispose();
    debounce.close();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          labelText: 'Search todos...', border: InputBorder.none, filled: true),
      onChanged: (String? newSearchTerm) {
        if (newSearchTerm != null) {
          debounce.run(() => ref
              .read(todoSearchProvider.notifier)
              .setSearchTerm(newSearchTerm));
        }
      },
    );
  }
}
