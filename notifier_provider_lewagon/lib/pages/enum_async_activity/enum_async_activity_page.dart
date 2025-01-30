import 'dart:math';

import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notifier_provider_lewagon/model/activity.dart';
import 'package:notifier_provider_lewagon/pages/enum_async_activity/enum_async_activity_provider.dart';
import 'package:notifier_provider_lewagon/pages/enum_async_activity/enum_async_activity_state.dart';

class EnumAsyncActivityPage extends ConsumerWidget {
  const EnumAsyncActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<EnumAsyncActivityState>(
      enumAsyncActivityProvider,
      (previous, next) {
        if (next.status == AsyncActivityStatus.failure) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(next.error),
                  ));
        }
      },
    );
    final activityStatus = ref.watch(enumAsyncActivityProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('EnumActivityNotifier'),
        actions: [
          IconButton(
              onPressed: () => ref.invalidate(enumAsyncActivityProvider),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: switch (activityStatus.status) {
        AsyncActivityStatus.loading => Center(
            child: CircularProgressIndicator(),
          ),
        AsyncActivityStatus.failure =>
          activityStatus.activity == Activity.empty()
              ? Center(
                  child: Text(
                    'Get some activity',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                )
              : ActivityWidget(activity: activityStatus.activity),
        AsyncActivityStatus.success =>
          ActivityWidget(activity: activityStatus.activity),
      },
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final randomNumber = Random().nextInt(activityTypes.length);
            ref
                .read(enumAsyncActivityProvider.notifier)
                .fetchActivity(activityTypes[randomNumber]);
          },
          label: Text('New Activity',
              style: Theme.of(context).textTheme.labelMedium)),
    );
  }
}

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
    required this.activity,
  });
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            activity.type,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Divider(),
          BulletedList(
            bullet: Icon(
              Icons.check,
              color: Colors.green,
            ),
            listItems: [
              'activity ${activity.activity}',
              'accessibility ${activity.accessibility}',
              'participants ${activity.participants}',
              'price ${activity.price}',
              'key ${activity.key}',
            ],
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
