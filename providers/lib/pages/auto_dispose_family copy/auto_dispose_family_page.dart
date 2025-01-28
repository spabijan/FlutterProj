import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/pages/auto_dispose_family/auto_dispose_family_provider.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloJohn = ref.watch(autodisposeFamilyHelloProvider('John'));
    final helloSteve = ref.watch(autodisposeFamilyHelloProvider('Jane'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('FamilyProvider'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            helloJohn,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            helloSteve,
            style: Theme.of(context).textTheme.headlineLarge,
          )
        ],
      )),
    );
  }
}
