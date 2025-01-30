import 'package:async_notifier_provider_lewagon/pages/counter/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider(10));
    print(counter);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
          child: counter.when(
              skipLoadingOnRefresh: false,
              data: (count) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$count',
                          style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
                              heroTag: 'decrement',
                              onPressed: () => ref
                                  .read(counterProvider(10).notifier)
                                  .decrement(),
                              child: const Icon(Icons.remove)),
                          FloatingActionButton(
                              heroTag: 'Increment',
                              child: const Icon(Icons.add),
                              onPressed: () => ref
                                  .read(counterProvider(10).notifier)
                                  .increment()),
                        ],
                      )
                    ],
                  ),
              error: (error, stackTrace) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(error.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                          onPressed: () => ref.invalidate(counterProvider),
                          child: const Icon(Icons.refresh))
                    ],
                  ),
              loading: () => const CircularProgressIndicator()),
        ));
  }
}
