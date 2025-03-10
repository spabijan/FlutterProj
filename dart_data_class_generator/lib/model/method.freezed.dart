// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Method {
  String? get methodname => throw _privateConstructorUsedError;
  double? get version => throw _privateConstructorUsedError;

  /// Create a copy of Method
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MethodCopyWith<Method> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MethodCopyWith<$Res> {
  factory $MethodCopyWith(Method value, $Res Function(Method) then) =
      _$MethodCopyWithImpl<$Res, Method>;
  @useResult
  $Res call({String? methodname, double? version});
}

/// @nodoc
class _$MethodCopyWithImpl<$Res, $Val extends Method>
    implements $MethodCopyWith<$Res> {
  _$MethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Method
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodname = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      methodname: freezed == methodname
          ? _value.methodname
          : methodname // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MethodImplCopyWith<$Res> implements $MethodCopyWith<$Res> {
  factory _$$MethodImplCopyWith(
          _$MethodImpl value, $Res Function(_$MethodImpl) then) =
      __$$MethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? methodname, double? version});
}

/// @nodoc
class __$$MethodImplCopyWithImpl<$Res>
    extends _$MethodCopyWithImpl<$Res, _$MethodImpl>
    implements _$$MethodImplCopyWith<$Res> {
  __$$MethodImplCopyWithImpl(
      _$MethodImpl _value, $Res Function(_$MethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of Method
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodname = freezed,
    Object? version = freezed,
  }) {
    return _then(_$MethodImpl(
      freezed == methodname
          ? _value.methodname
          : methodname // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$MethodImpl extends _Method with DiagnosticableTreeMixin {
  const _$MethodImpl(this.methodname, {this.version}) : super._();

  @override
  final String? methodname;
  @override
  final double? version;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Method(methodname: $methodname, version: $version)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Method'))
      ..add(DiagnosticsProperty('methodname', methodname))
      ..add(DiagnosticsProperty('version', version));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MethodImpl &&
            (identical(other.methodname, methodname) ||
                other.methodname == methodname) &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, methodname, version);

  /// Create a copy of Method
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MethodImplCopyWith<_$MethodImpl> get copyWith =>
      __$$MethodImplCopyWithImpl<_$MethodImpl>(this, _$identity);
}

abstract class _Method extends Method {
  const factory _Method(final String? methodname, {final double? version}) =
      _$MethodImpl;
  const _Method._() : super._();

  @override
  String? get methodname;
  @override
  double? get version;

  /// Create a copy of Method
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MethodImplCopyWith<_$MethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
