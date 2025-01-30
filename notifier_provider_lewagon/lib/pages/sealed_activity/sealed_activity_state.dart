import 'package:notifier_provider_lewagon/model/activity.dart';

sealed class SealedActivityState {
  const SealedActivityState();
}

final class SealedActivityInitial extends SealedActivityState {
  const SealedActivityInitial();

  @override
  String toString() {
    return 'SealedActivityInitial';
  }
}

final class SealedActivityLoading extends SealedActivityState {
  const SealedActivityLoading();

  @override
  String toString() {
    return 'SealedActivityLoading';
  }
}

final class SealedActivitySuccess extends SealedActivityState {
  const SealedActivitySuccess({required this.activity});
  final Activity activity;

  @override
  String toString() {
    return 'SealedActivitySuccess';
  }
}

final class SealedActivityFailure extends SealedActivityState {
  const SealedActivityFailure({required this.error});
  final String error;
  @override
  String toString() {
    return 'SealedActivityFailure($error)';
  }
}
