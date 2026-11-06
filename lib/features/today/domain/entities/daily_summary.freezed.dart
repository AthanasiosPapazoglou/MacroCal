// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailySummary {

 NutritionGoals get goals; Nutrients get consumed; double get burnedKcal; double get adjustedKcal; double get sugarLimitG; double get saturatedLimitG;
/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySummaryCopyWith<DailySummary> get copyWith => _$DailySummaryCopyWithImpl<DailySummary>(this as DailySummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DailySummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySummary&&(identical(other.goals, _this.goals) || other.goals == _this.goals)&&(identical(other.consumed, _this.consumed) || other.consumed == _this.consumed)&&(identical(other.burnedKcal, _this.burnedKcal) || other.burnedKcal == _this.burnedKcal)&&(identical(other.adjustedKcal, _this.adjustedKcal) || other.adjustedKcal == _this.adjustedKcal)&&(identical(other.sugarLimitG, _this.sugarLimitG) || other.sugarLimitG == _this.sugarLimitG)&&(identical(other.saturatedLimitG, _this.saturatedLimitG) || other.saturatedLimitG == _this.saturatedLimitG));
}


@override
int get hashCode {
  final _this = this as DailySummary;
  return Object.hash(runtimeType,_this.goals,_this.consumed,_this.burnedKcal,_this.adjustedKcal,_this.sugarLimitG,_this.saturatedLimitG);
}

@override
String toString() {
  final _this = this as DailySummary;
  return 'DailySummary(goals: ${_this.goals}, consumed: ${_this.consumed}, burnedKcal: ${_this.burnedKcal}, adjustedKcal: ${_this.adjustedKcal}, sugarLimitG: ${_this.sugarLimitG}, saturatedLimitG: ${_this.saturatedLimitG})';
}


}

/// @nodoc
abstract mixin class $DailySummaryCopyWith<$Res>  {
  factory $DailySummaryCopyWith(DailySummary value, $Res Function(DailySummary) _then) = _$DailySummaryCopyWithImpl;
@useResult
$Res call({
 NutritionGoals goals, Nutrients consumed, double burnedKcal, double adjustedKcal, double sugarLimitG, double saturatedLimitG
});


$NutritionGoalsCopyWith<$Res> get goals;$NutrientsCopyWith<$Res> get consumed;

}
/// @nodoc
class _$DailySummaryCopyWithImpl<$Res>
    implements $DailySummaryCopyWith<$Res> {
  _$DailySummaryCopyWithImpl(this._self, this._then);

  final DailySummary _self;
  final $Res Function(DailySummary) _then;

/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goals = null,Object? consumed = null,Object? burnedKcal = null,Object? adjustedKcal = null,Object? sugarLimitG = null,Object? saturatedLimitG = null,}) {
  return _then(DailySummary(
goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as NutritionGoals,consumed: null == consumed ? _self.consumed : consumed // ignore: cast_nullable_to_non_nullable
as Nutrients,burnedKcal: null == burnedKcal ? _self.burnedKcal : burnedKcal // ignore: cast_nullable_to_non_nullable
as double,adjustedKcal: null == adjustedKcal ? _self.adjustedKcal : adjustedKcal // ignore: cast_nullable_to_non_nullable
as double,sugarLimitG: null == sugarLimitG ? _self.sugarLimitG : sugarLimitG // ignore: cast_nullable_to_non_nullable
as double,saturatedLimitG: null == saturatedLimitG ? _self.saturatedLimitG : saturatedLimitG // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionGoalsCopyWith<$Res> get goals {
  
  return $NutritionGoalsCopyWith<$Res>(_self.goals, (value) {
    return _then(_self.copyWith(goals: value));
  });
}/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get consumed {
  
  return $NutrientsCopyWith<$Res>(_self.consumed, (value) {
    return _then(_self.copyWith(consumed: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailySummary].
extension DailySummaryPatterns on DailySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySummary value)  $default,){
final _that = this;
switch (_that) {
case _DailySummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySummary value)?  $default,){
final _that = this;
switch (_that) {
case _DailySummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NutritionGoals goals,  Nutrients consumed,  double burnedKcal,  double adjustedKcal,  double sugarLimitG,  double saturatedLimitG)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySummary() when $default != null:
return $default(_that.goals,_that.consumed,_that.burnedKcal,_that.adjustedKcal,_that.sugarLimitG,_that.saturatedLimitG);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NutritionGoals goals,  Nutrients consumed,  double burnedKcal,  double adjustedKcal,  double sugarLimitG,  double saturatedLimitG)  $default,) {final _that = this;
switch (_that) {
case _DailySummary():
return $default(_that.goals,_that.consumed,_that.burnedKcal,_that.adjustedKcal,_that.sugarLimitG,_that.saturatedLimitG);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NutritionGoals goals,  Nutrients consumed,  double burnedKcal,  double adjustedKcal,  double sugarLimitG,  double saturatedLimitG)?  $default,) {final _that = this;
switch (_that) {
case _DailySummary() when $default != null:
return $default(_that.goals,_that.consumed,_that.burnedKcal,_that.adjustedKcal,_that.sugarLimitG,_that.saturatedLimitG);case _:
  return null;

}
}

}

/// @nodoc


class _DailySummary implements DailySummary {
  const _DailySummary({required this.goals, required this.consumed, required this.burnedKcal, required this.adjustedKcal, required this.sugarLimitG, required this.saturatedLimitG});
  

@override final  NutritionGoals goals;
@override final  Nutrients consumed;
@override final  double burnedKcal;
@override final  double adjustedKcal;
@override final  double sugarLimitG;
@override final  double saturatedLimitG;

/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySummaryCopyWith<_DailySummary> get copyWith => __$DailySummaryCopyWithImpl<_DailySummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySummary&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.consumed, consumed) || other.consumed == consumed)&&(identical(other.burnedKcal, burnedKcal) || other.burnedKcal == burnedKcal)&&(identical(other.adjustedKcal, adjustedKcal) || other.adjustedKcal == adjustedKcal)&&(identical(other.sugarLimitG, sugarLimitG) || other.sugarLimitG == sugarLimitG)&&(identical(other.saturatedLimitG, saturatedLimitG) || other.saturatedLimitG == saturatedLimitG));
}


@override
int get hashCode {
    return Object.hash(runtimeType,goals,consumed,burnedKcal,adjustedKcal,sugarLimitG,saturatedLimitG);
}

@override
String toString() {
    return 'DailySummary(goals: $goals, consumed: $consumed, burnedKcal: $burnedKcal, adjustedKcal: $adjustedKcal, sugarLimitG: $sugarLimitG, saturatedLimitG: $saturatedLimitG)';
}


}

/// @nodoc
abstract mixin class _$DailySummaryCopyWith<$Res> implements $DailySummaryCopyWith<$Res> {
  factory _$DailySummaryCopyWith(_DailySummary value, $Res Function(_DailySummary) _then) = __$DailySummaryCopyWithImpl;
@override @useResult
$Res call({
 NutritionGoals goals, Nutrients consumed, double burnedKcal, double adjustedKcal, double sugarLimitG, double saturatedLimitG
});


@override $NutritionGoalsCopyWith<$Res> get goals;@override $NutrientsCopyWith<$Res> get consumed;

}
/// @nodoc
class __$DailySummaryCopyWithImpl<$Res>
    implements _$DailySummaryCopyWith<$Res> {
  __$DailySummaryCopyWithImpl(this._self, this._then);

  final _DailySummary _self;
  final $Res Function(_DailySummary) _then;

/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goals = null,Object? consumed = null,Object? burnedKcal = null,Object? adjustedKcal = null,Object? sugarLimitG = null,Object? saturatedLimitG = null,}) {
  return _then(_DailySummary(
goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as NutritionGoals,consumed: null == consumed ? _self.consumed : consumed // ignore: cast_nullable_to_non_nullable
as Nutrients,burnedKcal: null == burnedKcal ? _self.burnedKcal : burnedKcal // ignore: cast_nullable_to_non_nullable
as double,adjustedKcal: null == adjustedKcal ? _self.adjustedKcal : adjustedKcal // ignore: cast_nullable_to_non_nullable
as double,sugarLimitG: null == sugarLimitG ? _self.sugarLimitG : sugarLimitG // ignore: cast_nullable_to_non_nullable
as double,saturatedLimitG: null == saturatedLimitG ? _self.saturatedLimitG : saturatedLimitG // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionGoalsCopyWith<$Res> get goals {
  
  return $NutritionGoalsCopyWith<$Res>(_self.goals, (value) {
    return _then(_self.copyWith(goals: value));
  });
}/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get consumed {
  
  return $NutrientsCopyWith<$Res>(_self.consumed, (value) {
    return _then(_self.copyWith(consumed: value));
  });
}
}

// dart format on
