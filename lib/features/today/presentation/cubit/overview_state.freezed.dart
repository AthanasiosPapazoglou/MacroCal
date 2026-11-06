// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OverviewState {

 DailySummary get summary; OverviewStatus get status;
/// Create a copy of OverviewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverviewStateCopyWith<OverviewState> get copyWith => _$OverviewStateCopyWithImpl<OverviewState>(this as OverviewState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OverviewState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverviewState&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.status, _this.status) || other.status == _this.status));
}


@override
int get hashCode {
  final _this = this as OverviewState;
  return Object.hash(runtimeType,_this.summary,_this.status);
}

@override
String toString() {
  final _this = this as OverviewState;
  return 'OverviewState(summary: ${_this.summary}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $OverviewStateCopyWith<$Res>  {
  factory $OverviewStateCopyWith(OverviewState value, $Res Function(OverviewState) _then) = _$OverviewStateCopyWithImpl;
@useResult
$Res call({
 DailySummary summary, OverviewStatus status
});


$DailySummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$OverviewStateCopyWithImpl<$Res>
    implements $OverviewStateCopyWith<$Res> {
  _$OverviewStateCopyWithImpl(this._self, this._then);

  final OverviewState _self;
  final $Res Function(OverviewState) _then;

/// Create a copy of OverviewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? status = null,}) {
  return _then(OverviewState(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as DailySummary,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OverviewStatus,
  ));
}
/// Create a copy of OverviewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailySummaryCopyWith<$Res> get summary {
  
  return $DailySummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [OverviewState].
extension OverviewStatePatterns on OverviewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverviewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverviewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverviewState value)  $default,){
final _that = this;
switch (_that) {
case _OverviewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverviewState value)?  $default,){
final _that = this;
switch (_that) {
case _OverviewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DailySummary summary,  OverviewStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverviewState() when $default != null:
return $default(_that.summary,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DailySummary summary,  OverviewStatus status)  $default,) {final _that = this;
switch (_that) {
case _OverviewState():
return $default(_that.summary,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DailySummary summary,  OverviewStatus status)?  $default,) {final _that = this;
switch (_that) {
case _OverviewState() when $default != null:
return $default(_that.summary,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _OverviewState implements OverviewState {
  const _OverviewState({required this.summary, this.status = OverviewStatus.loading});
  

@override final  DailySummary summary;
@override@JsonKey() final  OverviewStatus status;

/// Create a copy of OverviewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverviewStateCopyWith<_OverviewState> get copyWith => __$OverviewStateCopyWithImpl<_OverviewState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverviewState&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode {
    return Object.hash(runtimeType,summary,status);
}

@override
String toString() {
    return 'OverviewState(summary: $summary, status: $status)';
}


}

/// @nodoc
abstract mixin class _$OverviewStateCopyWith<$Res> implements $OverviewStateCopyWith<$Res> {
  factory _$OverviewStateCopyWith(_OverviewState value, $Res Function(_OverviewState) _then) = __$OverviewStateCopyWithImpl;
@override @useResult
$Res call({
 DailySummary summary, OverviewStatus status
});


@override $DailySummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$OverviewStateCopyWithImpl<$Res>
    implements _$OverviewStateCopyWith<$Res> {
  __$OverviewStateCopyWithImpl(this._self, this._then);

  final _OverviewState _self;
  final $Res Function(_OverviewState) _then;

/// Create a copy of OverviewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? status = null,}) {
  return _then(_OverviewState(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as DailySummary,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OverviewStatus,
  ));
}

/// Create a copy of OverviewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailySummaryCopyWith<$Res> get summary {
  
  return $DailySummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
