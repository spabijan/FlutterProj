import 'package:async_notifier_provider_lewagon/timer/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerValue extends ConsumerWidget {
  const TimerValue({super.key});

  String zeroPaddedTwoDigits(double ticks) {
    return ticks.floor().toString().padLeft(2, '0');
  }

  String formatTimer(int ticks) {
    final minutes = zeroPaddedTwoDigits((ticks / 60) % 60);
    final seconds = zeroPaddedTwoDigits(ticks % 60);

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    print(timerState);

    return timerState.maybeWhen(
        data: (value) => Text(
              formatTimer(value.duration),
              style: Theme.of(context).textTheme.displayLarge,
            ),
        orElse: () => const SizedBox.shrink());

    //return SizedBox.shrink();
  }
}
