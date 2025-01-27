import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'method.freezed.dart';

@freezed
class Method with _$Method {
  const factory Method(String? methodname, {double? version}) = _Method;
  const Method._();

  void printMethod() {
    print('$methodname : ${version ?? 0.0}');
  }
}
