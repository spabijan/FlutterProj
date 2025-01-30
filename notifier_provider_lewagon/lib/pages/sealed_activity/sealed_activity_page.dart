import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifier_provider_lewagon/model/activity.dart';
import 'package:notifier_provider_lewagon/pages/enum_activity/enum_activity_page.dart';
import 'package:notifier_provider_lewagon/pages/sealed_activity/sealed_activity_provider.dart';
import 'package:notifier_provider_lewagon/pages/sealed_activity/sealed_activity_state.dart';

class SealedActivityPage extends ConsumerStatefulWidget {
  const SealedActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedActivityPageState();
}

class _SealedActivityPageState extends ConsumerState<SealedActivityPage> {
  Widget? prevWidget;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => ref
            .read(sealedActivityProvider.notifier)
            .fetchActivity(activityTypes[0]));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SealedActivityState>(sealedActivityProvider, (previous, next) {
      switch (next) {
        case SealedActivityFailure(error: String error):
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
        title: Text('EnumActivityNotifier'),
        actions: [
          IconButton(
              onPressed: () => ref.invalidate(sealedActivityProvider),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: switch (activityState) {
        SealedActivityInitial() => Center(
            child: Text('Get some activity'),
          ),
        SealedActivityLoading() => Center(
            child: CircularProgressIndicator(),
          ),
        SealedActivitySuccess() => prevWidget =
            ActivityWidget(activity: activityState.activity),
        SealedActivityFailure() => prevWidget == null
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
