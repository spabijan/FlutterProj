import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifier_provider_lewagon/model/activity.dart';
import 'package:notifier_provider_lewagon/pages/enum_activity/enum_activity_page.dart';
import 'package:notifier_provider_lewagon/pages/sealed_async_activity/sealed_async_activity_provider.dart';

import 'package:notifier_provider_lewagon/pages/sealed_async_activity/sealed_async_activity_state.dart';

class SealedAsyncActivityPage extends ConsumerStatefulWidget {
  const SealedAsyncActivityPage({super.key});

  @override
  ConsumerState<SealedAsyncActivityPage> createState() =>
      _SealedAsyncActivityPageState();
}

class _SealedAsyncActivityPageState
    extends ConsumerState<SealedAsyncActivityPage> {
  Widget? prevWidget;

  @override
  Widget build(BuildContext context) {
    ref.listen<SealedAsyncActivityState>(sealedActivityProvider,
        (previous, next) {
      switch (next) {
        case SealedAsyncActivityFailure(error: String error):
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(error),
                  ));
        case _:
          break;
      }
    });
    final activityState = ref.watch(sealedActivityProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('SealedAsyncctivityNotifier'),
        actions: [
          IconButton(
              onPressed: () => ref.invalidate(sealedActivityProvider),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: switch (activityState) {
        SealedAsyncActivityLoading() => Center(
            child: CircularProgressIndicator(),
          ),
        SealedAsyncActivitySuccess() => prevWidget =
            ActivityWidget(activity: activityState.activity),
        SealedAsyncActivityFailure() => prevWidget == null
            ? Center(
                child: Text(
                  'Get some activity',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            : prevWidget!
      },
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final randomNumber = Random().nextInt(activityTypes.length);
            ref
                .read(sealedActivityProvider.notifier)
                .fetchActivity(activityTypes[randomNumber]);
          },
          label: Text('New Activity',
              style: Theme.of(context).textTheme.labelMedium)),
    );
  }
}
