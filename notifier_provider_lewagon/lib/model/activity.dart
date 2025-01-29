import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  const factory Activity(
      {required String activity,
      required String type,
      required double accessibility,
      required int participants,
      required double price,
      required String key}) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  factory Activity.empty() => const Activity(
      activity: '',
      type: '',
      accessibility: 0.0,
      participants: 0,
      price: 0.0,
      key: '');
}

final activityTypes = [
  "education",
  "recreational",
  "social",
  "diy",
  "charity",
  "cooking",
  "relaxation",
  "music",
  "busywork"
];
