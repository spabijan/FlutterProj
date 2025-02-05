import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/theme/theme_provider.dart';
import 'package:todo_riverpod_sync/repositories/fake_todos_repository.dart';
import 'package:todo_riverpod_sync/repositories/providers/todos_repository_provider.dart';

import 'pages/todos_page.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        todosRepositoryProvider.overrideWithValue(FakeTodosRepository())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Todos',
      debugShowCheckedModeBanner: false,
      theme: switch (theme) {
        AppTheme.light => ThemeData.light(useMaterial3: true),
        AppTheme.dark => ThemeData.dark(useMaterial3: true),
      },
      home: const TodosPage(),
    );
  }
}
