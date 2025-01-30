// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enum_async_activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnumAsyncActivityState {
  AsyncActivityStatus get status => throw _privateConstructorUsedError;
  Activity get activity => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Create a copy of EnumAsyncActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnumAsyncActivityStateCopyWith<EnumAsyncActivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnumAsyncActivityStateCopyWith<$Res> {
  factory $EnumAsyncActivityStateCopyWith(EnumAsyncActivityState value,
          $Res Function(EnumAsyncActivityState) then) =
      _$EnumAsyncActivityStateCopyWithImpl<$Res, EnumAsyncActivityState>;
  @useResult
  $Res call({AsyncActivityStatus status, Activity activity, String error});

  $ActivityCopyWith<$Res> get activity;
}

/// @nodoc
class _$EnumAsyncActivityStateCopyWithImpl<$Res,
        $Val extends EnumAsyncActivityState>
    implements $EnumAsyncActivityStateCopyWith<$Res> {
  _$EnumAsyncActivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnumAsyncActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activity = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncActivityStatus,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of EnumAsyncActivityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivityCopyWith<$Res> get activity {
    return $ActivityCopyWith<$Res>(_value.activity, (value) {
      return _then(_value.copyWith(activity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EnumAsyncActivityStateImplCopyWith<$Res>
    implements $EnumAsyncActivityStateCopyWith<$Res> {
  factory _$$EnumAsyncActivityStateImplCopyWith(
          _$EnumAsyncActivityStateImpl value,
          $Res Function(_$EnumAsyncActivityStateImpl) then) =
      __$$EnumAsyncActivityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncActivityStatus status, Activity activity, String error});

  @override
  $ActivityCopyWith<$Res> get activity;
}

/// @nodoc
class __$$EnumAsyncActivityStateImplCopyWithImpl<$Res>
    extends _$EnumAsyncActivityStateCopyWithImpl<$Res,
        _$EnumAsyncActivityStateImpl>
    implements _$$EnumAsyncActivityStateImplCopyWith<$Res> {
  __$$EnumAsyncActivityStateImplCopyWithImpl(
      _$EnumAsyncActivityStateImpl _value,
      $Res Function(_$EnumAsyncActivityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnumAsyncActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activity = null,
    Object? error = null,
  }) {
    return _then(_$EnumAsyncActivityStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncActivityStatus,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EnumAsyncActivityStateImpl
    with DiagnosticableTreeMixin
    implements _EnumAsyncActivityState {
  const _$EnumAsyncActivityStateImpl(
      {required this.status, required this.activity, required this.error});

  @override
  final AsyncActivityStatus status;
  @override
  final Activity activity;
  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EnumAsyncActivityState(status: $status, activity: $activity, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EnumAsyncActivityState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('activity', activity))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnumAsyncActivityStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, activity, error);

  /// Create a copy of EnumAsyncActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnumAsyncActivityStateImplCopyWith<_$EnumAsyncActivityStateImpl>
      get copyWith => __$$EnumAsyncActivityStateImplCopyWithImpl<
          _$EnumAsyncActivityStateImpl>(this, _$identity);
}

abstract class _EnumAsyncActivityState implements EnumAsyncActivityState {
  const factory _EnumAsyncActivityState(
      {required final AsyncActivityStatus status,
      required final Activity activity,
      required final String error}) = _$EnumAsyncActivityStateImpl;

  @override
  AsyncActivityStatus get status;
  @override
  Activity get activity;
  @override
  String get error;

  /// Create a copy of EnumAsyncActivityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnumAsyncActivityStateImplCopyWith<_$EnumAsyncActivityStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
