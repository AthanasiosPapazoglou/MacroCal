// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayDetailState {

 DayDetailStatus get status; DayLog? get log;
/// Create a copy of DayDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayDetailStateCopyWith<DayDetailState> get copyWith => _$DayDetailStateCopyWithImpl<DayDetailState>(this as DayDetailState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DayDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayDetailState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.log, _this.log) || other.log == _this.log));
}


@override
int get hashCode {
  final _this = this as DayDetailState;
  return Object.hash(runtimeType,_this.status,_this.log);
}

@override
String toString() {
  final _this = this as DayDetailState;
  return 'DayDetailState(status: ${_this.status}, log: ${_this.log})';
}


}

/// @nodoc
abstract mixin class $DayDetailStateCopyWith<$Res>  {
  factory $DayDetailStateCopyWith(DayDetailState value, $Res Function(DayDetailState) _then) = _$DayDetailStateCopyWithImpl;
@useResult
$Res call({
 DayDetailStatus status, DayLog? log
});


$DayLogCopyWith<$Res>? get log;

}
/// @nodoc
class _$DayDetailStateCopyWithImpl<$Res>
    implements $DayDetailStateCopyWith<$Res> {
  _$DayDetailStateCopyWithImpl(this._self, this._then);

  final DayDetailState _self;
  final $Res Function(DayDetailState) _then;

/// Create a copy of DayDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? log = freezed,}) {
  return _then(DayDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DayDetailStatus,log: freezed == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as DayLog?,
  ));
}
/// Create a copy of DayDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DayLogCopyWith<$Res>? get log {
    if (_self.log == null) {
    return null;
  }

  return $DayLogCopyWith<$Res>(_self.log!, (value) {
    return _then(_self.copyWith(log: value));
  });
}
}


/// Adds pattern-matching-related methods to [DayDetailState].
extension DayDetailStatePatterns on DayDetailState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayDetailState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayDetailState value)  $default,){
final _that = this;
switch (_that) {
case _DayDetailState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _DayDetailState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DayDetailStatus status,  DayLog? log)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayDetailState() when $default != null:
return $default(_that.status,_that.log);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DayDetailStatus status,  DayLog? log)  $default,) {final _that = this;
switch (_that) {
case _DayDetailState():
return $default(_that.status,_that.log);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DayDetailStatus status,  DayLog? log)?  $default,) {final _that = this;
switch (_that) {
case _DayDetailState() when $default != null:
return $default(_that.status,_that.log);case _:
  return null;

}
}

}

/// @nodoc


class _DayDetailState implements DayDetailState {
  const _DayDetailState({this.status = DayDetailStatus.loading, this.log});
  

@override@JsonKey() final  DayDetailStatus status;
@override final  DayLog? log;

/// Create a copy of DayDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayDetailStateCopyWith<_DayDetailState> get copyWith => __$DayDetailStateCopyWithImpl<_DayDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.log, log) || other.log == log));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,log);
}

@override
String toString() {
    return 'DayDetailState(status: $status, log: $log)';
}


}

/// @nodoc
abstract mixin class _$DayDetailStateCopyWith<$Res> implements $DayDetailStateCopyWith<$Res> {
  factory _$DayDetailStateCopyWith(_DayDetailState value, $Res Function(_DayDetailState) _then) = __$DayDetailStateCopyWithImpl;
@override @useResult
$Res call({
 DayDetailStatus status, DayLog? log
});


@override $DayLogCopyWith<$Res>? get log;

}
/// @nodoc
class __$DayDetailStateCopyWithImpl<$Res>
    implements _$DayDetailStateCopyWith<$Res> {
  __$DayDetailStateCopyWithImpl(this._self, this._then);

  final _DayDetailState _self;
  final $Res Function(_DayDetailState) _then;

/// Create a copy of DayDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? log = freezed,}) {
  return _then(_DayDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DayDetailStatus,log: freezed == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as DayLog?,
  ));
}

/// Create a copy of DayDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DayLogCopyWith<$Res>? get log {
    if (_self.log == null) {
    return null;
  }

  return $DayLogCopyWith<$Res>(_self.log!, (value) {
    return _then(_self.copyWith(log: value));
  });
}
}

// dart format on
