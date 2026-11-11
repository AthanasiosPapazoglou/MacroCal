// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryStats {

 int get daysLogged; Nutrients get averageConsumed; double get averageAdjustedKcal; double get averageBurnedKcal; Map<TrackedGoal, int> get daysMet; int get currentStreak;
/// Create a copy of HistoryStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryStatsCopyWith<HistoryStats> get copyWith => _$HistoryStatsCopyWithImpl<HistoryStats>(this as HistoryStats, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HistoryStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryStats&&(identical(other.daysLogged, _this.daysLogged) || other.daysLogged == _this.daysLogged)&&(identical(other.averageConsumed, _this.averageConsumed) || other.averageConsumed == _this.averageConsumed)&&(identical(other.averageAdjustedKcal, _this.averageAdjustedKcal) || other.averageAdjustedKcal == _this.averageAdjustedKcal)&&(identical(other.averageBurnedKcal, _this.averageBurnedKcal) || other.averageBurnedKcal == _this.averageBurnedKcal)&&const DeepCollectionEquality().equals(other.daysMet, _this.daysMet)&&(identical(other.currentStreak, _this.currentStreak) || other.currentStreak == _this.currentStreak));
}


@override
int get hashCode {
  final _this = this as HistoryStats;
  return Object.hash(runtimeType,_this.daysLogged,_this.averageConsumed,_this.averageAdjustedKcal,_this.averageBurnedKcal,const DeepCollectionEquality().hash(_this.daysMet),_this.currentStreak);
}

@override
String toString() {
  final _this = this as HistoryStats;
  return 'HistoryStats(daysLogged: ${_this.daysLogged}, averageConsumed: ${_this.averageConsumed}, averageAdjustedKcal: ${_this.averageAdjustedKcal}, averageBurnedKcal: ${_this.averageBurnedKcal}, daysMet: ${_this.daysMet}, currentStreak: ${_this.currentStreak})';
}


}

/// @nodoc
abstract mixin class $HistoryStatsCopyWith<$Res>  {
  factory $HistoryStatsCopyWith(HistoryStats value, $Res Function(HistoryStats) _then) = _$HistoryStatsCopyWithImpl;
@useResult
$Res call({
 int daysLogged, Nutrients averageConsumed, double averageAdjustedKcal, double averageBurnedKcal, Map<TrackedGoal, int> daysMet, int currentStreak
});


$NutrientsCopyWith<$Res> get averageConsumed;

}
/// @nodoc
class _$HistoryStatsCopyWithImpl<$Res>
    implements $HistoryStatsCopyWith<$Res> {
  _$HistoryStatsCopyWithImpl(this._self, this._then);

  final HistoryStats _self;
  final $Res Function(HistoryStats) _then;

/// Create a copy of HistoryStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? daysLogged = null,Object? averageConsumed = null,Object? averageAdjustedKcal = null,Object? averageBurnedKcal = null,Object? daysMet = null,Object? currentStreak = null,}) {
  return _then(HistoryStats(
daysLogged: null == daysLogged ? _self.daysLogged : daysLogged // ignore: cast_nullable_to_non_nullable
as int,averageConsumed: null == averageConsumed ? _self.averageConsumed : averageConsumed // ignore: cast_nullable_to_non_nullable
as Nutrients,averageAdjustedKcal: null == averageAdjustedKcal ? _self.averageAdjustedKcal : averageAdjustedKcal // ignore: cast_nullable_to_non_nullable
as double,averageBurnedKcal: null == averageBurnedKcal ? _self.averageBurnedKcal : averageBurnedKcal // ignore: cast_nullable_to_non_nullable
as double,daysMet: null == daysMet ? _self.daysMet : daysMet // ignore: cast_nullable_to_non_nullable
as Map<TrackedGoal, int>,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HistoryStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get averageConsumed {
  
  return $NutrientsCopyWith<$Res>(_self.averageConsumed, (value) {
    return _then(_self.copyWith(averageConsumed: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryStats].
extension HistoryStatsPatterns on HistoryStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryStats value)  $default,){
final _that = this;
switch (_that) {
case _HistoryStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryStats value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int daysLogged,  Nutrients averageConsumed,  double averageAdjustedKcal,  double averageBurnedKcal,  Map<TrackedGoal, int> daysMet,  int currentStreak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryStats() when $default != null:
return $default(_that.daysLogged,_that.averageConsumed,_that.averageAdjustedKcal,_that.averageBurnedKcal,_that.daysMet,_that.currentStreak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int daysLogged,  Nutrients averageConsumed,  double averageAdjustedKcal,  double averageBurnedKcal,  Map<TrackedGoal, int> daysMet,  int currentStreak)  $default,) {final _that = this;
switch (_that) {
case _HistoryStats():
return $default(_that.daysLogged,_that.averageConsumed,_that.averageAdjustedKcal,_that.averageBurnedKcal,_that.daysMet,_that.currentStreak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int daysLogged,  Nutrients averageConsumed,  double averageAdjustedKcal,  double averageBurnedKcal,  Map<TrackedGoal, int> daysMet,  int currentStreak)?  $default,) {final _that = this;
switch (_that) {
case _HistoryStats() when $default != null:
return $default(_that.daysLogged,_that.averageConsumed,_that.averageAdjustedKcal,_that.averageBurnedKcal,_that.daysMet,_that.currentStreak);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryStats extends HistoryStats {
  const _HistoryStats({this.daysLogged = 0, this.averageConsumed = const Nutrients(), this.averageAdjustedKcal = 0, this.averageBurnedKcal = 0,  Map<TrackedGoal, int> daysMet = const {}, this.currentStreak = 0}): _daysMet = daysMet,super._();
  

@override@JsonKey() final  int daysLogged;
@override@JsonKey() final  Nutrients averageConsumed;
@override@JsonKey() final  double averageAdjustedKcal;
@override@JsonKey() final  double averageBurnedKcal;
 final  Map<TrackedGoal, int> _daysMet;
@override@JsonKey() Map<TrackedGoal, int> get daysMet {
  if (_daysMet is EqualUnmodifiableMapView) return _daysMet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_daysMet);
}

@override@JsonKey() final  int currentStreak;

/// Create a copy of HistoryStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryStatsCopyWith<_HistoryStats> get copyWith => __$HistoryStatsCopyWithImpl<_HistoryStats>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryStats&&(identical(other.daysLogged, daysLogged) || other.daysLogged == daysLogged)&&(identical(other.averageConsumed, averageConsumed) || other.averageConsumed == averageConsumed)&&(identical(other.averageAdjustedKcal, averageAdjustedKcal) || other.averageAdjustedKcal == averageAdjustedKcal)&&(identical(other.averageBurnedKcal, averageBurnedKcal) || other.averageBurnedKcal == averageBurnedKcal)&&const DeepCollectionEquality().equals(other.daysMet, _daysMet)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak));
}


@override
int get hashCode {
    return Object.hash(runtimeType,daysLogged,averageConsumed,averageAdjustedKcal,averageBurnedKcal,const DeepCollectionEquality().hash(_daysMet),currentStreak);
}

@override
String toString() {
    return 'HistoryStats(daysLogged: $daysLogged, averageConsumed: $averageConsumed, averageAdjustedKcal: $averageAdjustedKcal, averageBurnedKcal: $averageBurnedKcal, daysMet: $daysMet, currentStreak: $currentStreak)';
}


}

/// @nodoc
abstract mixin class _$HistoryStatsCopyWith<$Res> implements $HistoryStatsCopyWith<$Res> {
  factory _$HistoryStatsCopyWith(_HistoryStats value, $Res Function(_HistoryStats) _then) = __$HistoryStatsCopyWithImpl;
@override @useResult
$Res call({
 int daysLogged, Nutrients averageConsumed, double averageAdjustedKcal, double averageBurnedKcal, Map<TrackedGoal, int> daysMet, int currentStreak
});


@override $NutrientsCopyWith<$Res> get averageConsumed;

}
/// @nodoc
class __$HistoryStatsCopyWithImpl<$Res>
    implements _$HistoryStatsCopyWith<$Res> {
  __$HistoryStatsCopyWithImpl(this._self, this._then);

  final _HistoryStats _self;
  final $Res Function(_HistoryStats) _then;

/// Create a copy of HistoryStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? daysLogged = null,Object? averageConsumed = null,Object? averageAdjustedKcal = null,Object? averageBurnedKcal = null,Object? daysMet = null,Object? currentStreak = null,}) {
  return _then(_HistoryStats(
daysLogged: null == daysLogged ? _self.daysLogged : daysLogged // ignore: cast_nullable_to_non_nullable
as int,averageConsumed: null == averageConsumed ? _self.averageConsumed : averageConsumed // ignore: cast_nullable_to_non_nullable
as Nutrients,averageAdjustedKcal: null == averageAdjustedKcal ? _self.averageAdjustedKcal : averageAdjustedKcal // ignore: cast_nullable_to_non_nullable
as double,averageBurnedKcal: null == averageBurnedKcal ? _self.averageBurnedKcal : averageBurnedKcal // ignore: cast_nullable_to_non_nullable
as double,daysMet: null == daysMet ? _self._daysMet : daysMet // ignore: cast_nullable_to_non_nullable
as Map<TrackedGoal, int>,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HistoryStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get averageConsumed {
  
  return $NutrientsCopyWith<$Res>(_self.averageConsumed, (value) {
    return _then(_self.copyWith(averageConsumed: value));
  });
}
}

// dart format on
