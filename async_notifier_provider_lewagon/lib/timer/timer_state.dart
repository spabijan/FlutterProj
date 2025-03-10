sealed class TimerState {
  final int duration;

  const TimerState(this.duration);
}

final class TimerInitial extends TimerState {
  TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial(duration: $duration)';
}

final class TimerRunning extends TimerState {
  TimerRunning(super.duration);

  @override
  String toString() => 'TimerRunning(duration: $duration)';
}

final class TimerPaused extends TimerState {
  TimerPaused(super.duration);

  @override
  String toString() => 'TimerPaused(duration: $duration)';
}

final class TimerFinished extends TimerState {
  const TimerFinished() : super(0);

  @override
  String toString() => 'TimerFinished(duration: $duration)';
}
