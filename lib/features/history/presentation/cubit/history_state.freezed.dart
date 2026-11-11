// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryState {

 HistoryStatus get status; HistoryRange get range; List<DayLog> get logs; HistoryStats get stats;
/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryStateCopyWith<HistoryState> get copyWith => _$HistoryStateCopyWithImpl<HistoryState>(this as HistoryState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HistoryState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.range, _this.range) || other.range == _this.range)&&const DeepCollectionEquality().equals(other.logs, _this.logs)&&(identical(other.stats, _this.stats) || other.stats == _this.stats));
}


@override
int get hashCode {
  final _this = this as HistoryState;
  return Object.hash(runtimeType,_this.status,_this.range,const DeepCollectionEquality().hash(_this.logs),_this.stats);
}

@override
String toString() {
  final _this = this as HistoryState;
  return 'HistoryState(status: ${_this.status}, range: ${_this.range}, logs: ${_this.logs}, stats: ${_this.stats})';
}


}

/// @nodoc
abstract mixin class $HistoryStateCopyWith<$Res>  {
  factory $HistoryStateCopyWith(HistoryState value, $Res Function(HistoryState) _then) = _$HistoryStateCopyWithImpl;
@useResult
$Res call({
 HistoryStatus status, HistoryRange range, List<DayLog> logs, HistoryStats stats
});


$HistoryStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._self, this._then);

  final HistoryState _self;
  final $Res Function(HistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? range = null,Object? logs = null,Object? stats = null,}) {
  return _then(HistoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryStatus,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as HistoryRange,logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<DayLog>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as HistoryStats,
  ));
}
/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryStatsCopyWith<$Res> get stats {
  
  return $HistoryStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryState].
extension HistoryStatePatterns on HistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryStatus status,  HistoryRange range,  List<DayLog> logs,  HistoryStats stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that.status,_that.range,_that.logs,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryStatus status,  HistoryRange range,  List<DayLog> logs,  HistoryStats stats)  $default,) {final _that = this;
switch (_that) {
case _HistoryState():
return $default(_that.status,_that.range,_that.logs,_that.stats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryStatus status,  HistoryRange range,  List<DayLog> logs,  HistoryStats stats)?  $default,) {final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that.status,_that.range,_that.logs,_that.stats);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryState implements HistoryState {
  const _HistoryState({this.status = HistoryStatus.loading, this.range = HistoryRange.week,  List<DayLog> logs = const <DayLog>[], this.stats = const HistoryStats()}): _logs = logs;
  

@override@JsonKey() final  HistoryStatus status;
@override@JsonKey() final  HistoryRange range;
 final  List<DayLog> _logs;
@override@JsonKey() List<DayLog> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

@override@JsonKey() final  HistoryStats stats;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryStateCopyWith<_HistoryState> get copyWith => __$HistoryStateCopyWithImpl<_HistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryState&&(identical(other.status, status) || other.status == status)&&(identical(other.range, range) || other.range == range)&&const DeepCollectionEquality().equals(other.logs, _logs)&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,range,const DeepCollectionEquality().hash(_logs),stats);
}

@override
String toString() {
    return 'HistoryState(status: $status, range: $range, logs: $logs, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$HistoryStateCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory _$HistoryStateCopyWith(_HistoryState value, $Res Function(_HistoryState) _then) = __$HistoryStateCopyWithImpl;
@override @useResult
$Res call({
 HistoryStatus status, HistoryRange range, List<DayLog> logs, HistoryStats stats
});


@override $HistoryStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$HistoryStateCopyWithImpl<$Res>
    implements _$HistoryStateCopyWith<$Res> {
  __$HistoryStateCopyWithImpl(this._self, this._then);

  final _HistoryState _self;
  final $Res Function(_HistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? range = null,Object? logs = null,Object? stats = null,}) {
  return _then(_HistoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HistoryStatus,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as HistoryRange,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<DayLog>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as HistoryStats,
  ));
}

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryStatsCopyWith<$Res> get stats {
  
  return $HistoryStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

// dart format on
