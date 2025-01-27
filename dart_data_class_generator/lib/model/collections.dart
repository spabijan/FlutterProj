import 'package:dart_data_class_generator/model/person.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collections.freezed.dart';

@freezed
class ImmutableColl with _$ImmutableColl {
  const factory ImmutableColl(List<int> list) = _ImmutableColl;
}

@Freezed(makeCollectionsUnmodifiable: false)
class MutableColl with _$MutableColl {
  factory MutableColl(List<int> list) = _MutableColl;
}
