import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider/pages/family/family_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inkVal = ref.watch(familyCounterProvider(10));
    final decVal = ref.watch(familyCounterProvider(-10));
    return Scaffold(
      appBar: AppBar(
        title: const Text('FamilyStateProvider'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$inkVal',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                width: 20,
              ),
              FilledButton(
                  onPressed: () => ref
                      .read(familyCounterProvider(10).notifier)
                      .update((value) => value + 10),
                  child: Text(
                    'Increment',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$decVal',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                width: 20,
              ),
              FilledButton(
                  onPressed: () => ref
                      .read(familyCounterProvider(-10).notifier)
                      .update((value) => value - 10),
                  child: Text(
                    'Decrement',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ],
      )),
    );
  }
}
