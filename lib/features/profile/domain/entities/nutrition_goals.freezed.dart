// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_goals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutritionGoals {

 double get dailyKcal; double get proteinG; double get fiberG; double get sugarLimitPct; double get saturatedLimitPct; double get saltLimitMg;
/// Create a copy of NutritionGoals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionGoalsCopyWith<NutritionGoals> get copyWith => _$NutritionGoalsCopyWithImpl<NutritionGoals>(this as NutritionGoals, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NutritionGoals;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionGoals&&(identical(other.dailyKcal, _this.dailyKcal) || other.dailyKcal == _this.dailyKcal)&&(identical(other.proteinG, _this.proteinG) || other.proteinG == _this.proteinG)&&(identical(other.fiberG, _this.fiberG) || other.fiberG == _this.fiberG)&&(identical(other.sugarLimitPct, _this.sugarLimitPct) || other.sugarLimitPct == _this.sugarLimitPct)&&(identical(other.saturatedLimitPct, _this.saturatedLimitPct) || other.saturatedLimitPct == _this.saturatedLimitPct)&&(identical(other.saltLimitMg, _this.saltLimitMg) || other.saltLimitMg == _this.saltLimitMg));
}


@override
int get hashCode {
  final _this = this as NutritionGoals;
  return Object.hash(runtimeType,_this.dailyKcal,_this.proteinG,_this.fiberG,_this.sugarLimitPct,_this.saturatedLimitPct,_this.saltLimitMg);
}

@override
String toString() {
  final _this = this as NutritionGoals;
  return 'NutritionGoals(dailyKcal: ${_this.dailyKcal}, proteinG: ${_this.proteinG}, fiberG: ${_this.fiberG}, sugarLimitPct: ${_this.sugarLimitPct}, saturatedLimitPct: ${_this.saturatedLimitPct}, saltLimitMg: ${_this.saltLimitMg})';
}


}

/// @nodoc
abstract mixin class $NutritionGoalsCopyWith<$Res>  {
  factory $NutritionGoalsCopyWith(NutritionGoals value, $Res Function(NutritionGoals) _then) = _$NutritionGoalsCopyWithImpl;
@useResult
$Res call({
 double dailyKcal, double proteinG, double fiberG, double sugarLimitPct, double saturatedLimitPct, double saltLimitMg
});




}
/// @nodoc
class _$NutritionGoalsCopyWithImpl<$Res>
    implements $NutritionGoalsCopyWith<$Res> {
  _$NutritionGoalsCopyWithImpl(this._self, this._then);

  final NutritionGoals _self;
  final $Res Function(NutritionGoals) _then;

/// Create a copy of NutritionGoals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyKcal = null,Object? proteinG = null,Object? fiberG = null,Object? sugarLimitPct = null,Object? saturatedLimitPct = null,Object? saltLimitMg = null,}) {
  return _then(NutritionGoals(
dailyKcal: null == dailyKcal ? _self.dailyKcal : dailyKcal // ignore: cast_nullable_to_non_nullable
as double,proteinG: null == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double,fiberG: null == fiberG ? _self.fiberG : fiberG // ignore: cast_nullable_to_non_nullable
as double,sugarLimitPct: null == sugarLimitPct ? _self.sugarLimitPct : sugarLimitPct // ignore: cast_nullable_to_non_nullable
as double,saturatedLimitPct: null == saturatedLimitPct ? _self.saturatedLimitPct : saturatedLimitPct // ignore: cast_nullable_to_non_nullable
as double,saltLimitMg: null == saltLimitMg ? _self.saltLimitMg : saltLimitMg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionGoals].
extension NutritionGoalsPatterns on NutritionGoals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionGoals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionGoals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionGoals value)  $default,){
final _that = this;
switch (_that) {
case _NutritionGoals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionGoals value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionGoals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double dailyKcal,  double proteinG,  double fiberG,  double sugarLimitPct,  double saturatedLimitPct,  double saltLimitMg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionGoals() when $default != null:
return $default(_that.dailyKcal,_that.proteinG,_that.fiberG,_that.sugarLimitPct,_that.saturatedLimitPct,_that.saltLimitMg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double dailyKcal,  double proteinG,  double fiberG,  double sugarLimitPct,  double saturatedLimitPct,  double saltLimitMg)  $default,) {final _that = this;
switch (_that) {
case _NutritionGoals():
return $default(_that.dailyKcal,_that.proteinG,_that.fiberG,_that.sugarLimitPct,_that.saturatedLimitPct,_that.saltLimitMg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double dailyKcal,  double proteinG,  double fiberG,  double sugarLimitPct,  double saturatedLimitPct,  double saltLimitMg)?  $default,) {final _that = this;
switch (_that) {
case _NutritionGoals() when $default != null:
return $default(_that.dailyKcal,_that.proteinG,_that.fiberG,_that.sugarLimitPct,_that.saturatedLimitPct,_that.saltLimitMg);case _:
  return null;

}
}

}

/// @nodoc


class _NutritionGoals implements NutritionGoals {
  const _NutritionGoals({this.dailyKcal = 2100, this.proteinG = 100, this.fiberG = 35, this.sugarLimitPct = 10, this.saturatedLimitPct = 8, this.saltLimitMg = 5800});
  

@override@JsonKey() final  double dailyKcal;
@override@JsonKey() final  double proteinG;
@override@JsonKey() final  double fiberG;
@override@JsonKey() final  double sugarLimitPct;
@override@JsonKey() final  double saturatedLimitPct;
@override@JsonKey() final  double saltLimitMg;

/// Create a copy of NutritionGoals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionGoalsCopyWith<_NutritionGoals> get copyWith => __$NutritionGoalsCopyWithImpl<_NutritionGoals>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionGoals&&(identical(other.dailyKcal, dailyKcal) || other.dailyKcal == dailyKcal)&&(identical(other.proteinG, proteinG) || other.proteinG == proteinG)&&(identical(other.fiberG, fiberG) || other.fiberG == fiberG)&&(identical(other.sugarLimitPct, sugarLimitPct) || other.sugarLimitPct == sugarLimitPct)&&(identical(other.saturatedLimitPct, saturatedLimitPct) || other.saturatedLimitPct == saturatedLimitPct)&&(identical(other.saltLimitMg, saltLimitMg) || other.saltLimitMg == saltLimitMg));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dailyKcal,proteinG,fiberG,sugarLimitPct,saturatedLimitPct,saltLimitMg);
}

@override
String toString() {
    return 'NutritionGoals(dailyKcal: $dailyKcal, proteinG: $proteinG, fiberG: $fiberG, sugarLimitPct: $sugarLimitPct, saturatedLimitPct: $saturatedLimitPct, saltLimitMg: $saltLimitMg)';
}


}

/// @nodoc
abstract mixin class _$NutritionGoalsCopyWith<$Res> implements $NutritionGoalsCopyWith<$Res> {
  factory _$NutritionGoalsCopyWith(_NutritionGoals value, $Res Function(_NutritionGoals) _then) = __$NutritionGoalsCopyWithImpl;
@override @useResult
$Res call({
 double dailyKcal, double proteinG, double fiberG, double sugarLimitPct, double saturatedLimitPct, double saltLimitMg
});




}
/// @nodoc
class __$NutritionGoalsCopyWithImpl<$Res>
    implements _$NutritionGoalsCopyWith<$Res> {
  __$NutritionGoalsCopyWithImpl(this._self, this._then);

  final _NutritionGoals _self;
  final $Res Function(_NutritionGoals) _then;

/// Create a copy of NutritionGoals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyKcal = null,Object? proteinG = null,Object? fiberG = null,Object? sugarLimitPct = null,Object? saturatedLimitPct = null,Object? saltLimitMg = null,}) {
  return _then(_NutritionGoals(
dailyKcal: null == dailyKcal ? _self.dailyKcal : dailyKcal // ignore: cast_nullable_to_non_nullable
as double,proteinG: null == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double,fiberG: null == fiberG ? _self.fiberG : fiberG // ignore: cast_nullable_to_non_nullable
as double,sugarLimitPct: null == sugarLimitPct ? _self.sugarLimitPct : sugarLimitPct // ignore: cast_nullable_to_non_nullable
as double,saturatedLimitPct: null == saturatedLimitPct ? _self.saturatedLimitPct : saturatedLimitPct // ignore: cast_nullable_to_non_nullable
as double,saltLimitMg: null == saltLimitMg ? _self.saltLimitMg : saltLimitMg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
