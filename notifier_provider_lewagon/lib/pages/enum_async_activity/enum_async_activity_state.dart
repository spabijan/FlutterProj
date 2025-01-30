import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';
import 'package:notifier_provider_lewagon/model/activity.dart';

part 'enum_async_activity_state.freezed.dart';

enum AsyncActivityStatus { loading, success, failure }

@freezed
class EnumAsyncActivityState with _$EnumAsyncActivityState {
  const factory EnumAsyncActivityState(
      {required AsyncActivityStatus status,
      required Activity activity,
      required String error}) = _EnumAsyncActivityState;

  factory EnumAsyncActivityState.initial() {
    return EnumAsyncActivityState(
        activity: Activity.empty(),
        status: AsyncActivityStatus.loading,
        error: '');
  }
}
