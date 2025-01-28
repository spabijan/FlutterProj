import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/pages/auto_dispose_family_copy/auto_dispose_family_test_provider.dart';

class AutoDisposeFamilyTestPage extends ConsumerStatefulWidget {
  const AutoDisposeFamilyTestPage({super.key});

  @override
  ConsumerState<AutoDisposeFamilyTestPage> createState() =>
      _AutoDisposeFamilyTestPageState();
}

class _AutoDisposeFamilyTestPageState
    extends ConsumerState<AutoDisposeFamilyTestPage> {
  String name = 'john';

  @override
  Widget build(BuildContext context) {
    final helloThere = ref.watch(autodisposeFamilyTestHelloProvider(name));
    return Scaffold(
      appBar: AppBar(
        title: const Text('FamilyProvider'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            helloThere,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 10,
          ),
          FilledButton(
              onPressed: () {
                setState(() {
                  name = name == 'john' ? 'jane' : 'john';
                });
              },
              child: Text(
                'Change Name',
                style: TextStyle(fontSize: 18),
              ))
        ],
      )),
    );
  }
}
