import 'dart:math';

import 'package:async_notifier_provider_lewagon/async_activity/async_activity_provider.dart';
import 'package:async_notifier_provider_lewagon/extensions/async_value_extension.dart';
import 'package:async_notifier_provider_lewagon/models/activity.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncActivityPage extends ConsumerWidget {
  const AsyncActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      asyncActivityProvider,
      (previous, next) {
        if (next.hasError && next.isLoading == false) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(next.error.toString()),
                  ));
        }
      },
    );
    final activityState = ref.watch(asyncActivityProvider);
    print(activityState.toStr);
    print(activityState.props);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncActivityProvider'),
      ),
      body: activityState.when(
        skipError: true,
        skipLoadingOnRefresh: false,
        data: (data) => ActivityWidget(activity: data),
        error: (error, stackTrace) => Center(
          child: Text(error.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.red),
              textAlign: TextAlign.center),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'New Activity',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(asyncActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
      ),
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
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Text(
            activity.type,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Divider(),
          BulletedList(
            bullet: const Icon(
              Icons.check,
              color: Colors.green,
            ),
            listItems: [
              'activity: ${activity.activity}',
              'participants: ${activity.participants}',
              'price: ${activity.price}',
              'accessibility: ${activity.accessibility}',
              'key: ${activity.key}',
            ],
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
