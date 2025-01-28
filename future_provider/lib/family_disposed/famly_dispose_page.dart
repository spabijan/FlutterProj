import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/pages/users/users_providers.dart';

class FamlyDisposePage extends ConsumerWidget {
  const FamlyDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(userDetailProvider(1));
    ref.watch(userDetailProvider(2));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Family Dispose"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            OutlinedButton(
                onPressed: () => ref.invalidate(userDetailProvider),
                child: Text('invalidate',
                    style: Theme.of(context).textTheme.labelMedium)),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () => ref.refresh(userDetailProvider(1)),
                child: Text('refresh',
                    style: Theme.of(context).textTheme.labelMedium)),
          ],
        ),
      ),
    );
  }
}
