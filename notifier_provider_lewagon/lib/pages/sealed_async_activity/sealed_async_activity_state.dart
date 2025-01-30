import 'package:notifier_provider_lewagon/model/activity.dart';

sealed class SealedAsyncActivityState {
  const SealedAsyncActivityState();
}

// final class SealedAsyncActivityInitial extends SealedAsyncActivityState {
//   const SealedAsyncActivityInitial();

//   @override
//   String toString() {
//     return 'SealedAsyncActivityInitial';
//   }
// }

final class SealedAsyncActivityLoading extends SealedAsyncActivityState {
  const SealedAsyncActivityLoading();

  @override
  String toString() {
    return 'SealedActivityLoading';
  }
}

final class SealedAsyncActivitySuccess extends SealedAsyncActivityState {
  const SealedAsyncActivitySuccess({required this.activity});
  final Activity activity;

  @override
  String toString() {
    return 'SealedActivitySuccess';
  }
}

final class SealedAsyncActivityFailure extends SealedAsyncActivityState {
  const SealedAsyncActivityFailure({required this.error});
  final String error;
  @override
  String toString() {
    return 'SealedActivityFailure($error)';
  }
}
