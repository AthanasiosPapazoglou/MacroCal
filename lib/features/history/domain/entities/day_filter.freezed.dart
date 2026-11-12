// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayFilter {

 TrackedGoal get goal; DayOutcome get outcome;
/// Create a copy of DayFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayFilterCopyWith<DayFilter> get copyWith => _$DayFilterCopyWithImpl<DayFilter>(this as DayFilter, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DayFilter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayFilter&&(identical(other.goal, _this.goal) || other.goal == _this.goal)&&(identical(other.outcome, _this.outcome) || other.outcome == _this.outcome));
}


@override
int get hashCode {
  final _this = this as DayFilter;
  return Object.hash(runtimeType,_this.goal,_this.outcome);
}

@override
String toString() {
  final _this = this as DayFilter;
  return 'DayFilter(goal: ${_this.goal}, outcome: ${_this.outcome})';
}


}

/// @nodoc
abstract mixin class $DayFilterCopyWith<$Res>  {
  factory $DayFilterCopyWith(DayFilter value, $Res Function(DayFilter) _then) = _$DayFilterCopyWithImpl;
@useResult
$Res call({
 TrackedGoal goal, DayOutcome outcome
});




}
/// @nodoc
class _$DayFilterCopyWithImpl<$Res>
    implements $DayFilterCopyWith<$Res> {
  _$DayFilterCopyWithImpl(this._self, this._then);

  final DayFilter _self;
  final $Res Function(DayFilter) _then;

/// Create a copy of DayFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goal = null,Object? outcome = null,}) {
  return _then(DayFilter(
goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as TrackedGoal,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as DayOutcome,
  ));
}

}


/// Adds pattern-matching-related methods to [DayFilter].
extension DayFilterPatterns on DayFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayFilter value)  $default,){
final _that = this;
switch (_that) {
case _DayFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayFilter value)?  $default,){
final _that = this;
switch (_that) {
case _DayFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TrackedGoal goal,  DayOutcome outcome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayFilter() when $default != null:
return $default(_that.goal,_that.outcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TrackedGoal goal,  DayOutcome outcome)  $default,) {final _that = this;
switch (_that) {
case _DayFilter():
return $default(_that.goal,_that.outcome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TrackedGoal goal,  DayOutcome outcome)?  $default,) {final _that = this;
switch (_that) {
case _DayFilter() when $default != null:
return $default(_that.goal,_that.outcome);case _:
  return null;

}
}

}

/// @nodoc


class _DayFilter implements DayFilter {
  const _DayFilter({required this.goal, required this.outcome});
  

@override final  TrackedGoal goal;
@override final  DayOutcome outcome;

/// Create a copy of DayFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayFilterCopyWith<_DayFilter> get copyWith => __$DayFilterCopyWithImpl<_DayFilter>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayFilter&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.outcome, outcome) || other.outcome == outcome));
}


@override
int get hashCode {
    return Object.hash(runtimeType,goal,outcome);
}

@override
String toString() {
    return 'DayFilter(goal: $goal, outcome: $outcome)';
}


}

/// @nodoc
abstract mixin class _$DayFilterCopyWith<$Res> implements $DayFilterCopyWith<$Res> {
  factory _$DayFilterCopyWith(_DayFilter value, $Res Function(_DayFilter) _then) = __$DayFilterCopyWithImpl;
@override @useResult
$Res call({
 TrackedGoal goal, DayOutcome outcome
});




}
/// @nodoc
class __$DayFilterCopyWithImpl<$Res>
    implements _$DayFilterCopyWith<$Res> {
  __$DayFilterCopyWithImpl(this._self, this._then);

  final _DayFilter _self;
  final $Res Function(_DayFilter) _then;

/// Create a copy of DayFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goal = null,Object? outcome = null,}) {
  return _then(_DayFilter(
goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as TrackedGoal,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as DayOutcome,
  ));
}


}

// dart format on
