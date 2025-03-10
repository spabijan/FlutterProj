import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';
import 'package:notifier_provider_lewagon/model/activity.dart';

part 'enum_activity_state.freezed.dart';

enum ActivityStatus { initial, loading, success, failure }

@freezed
class EnumActivityState with _$EnumActivityState {
  const factory EnumActivityState(
      {required ActivityStatus status,
      required Activity activity,
      required String error}) = _EnumActivityState;

  factory EnumActivityState.initial() {
    return EnumActivityState(
        activity: Activity.empty(), status: ActivityStatus.initial, error: '');
  }
}
