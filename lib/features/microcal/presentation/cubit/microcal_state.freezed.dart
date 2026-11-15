// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'microcal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MicroCalState {

 MicroCalStatus get status; MicroCalPeriod get period; bool get enabled; MicroIntake get today; MicroIntake get week; int get weekDays; Sex? get sex; int? get age; Map<Micronutrient, ReferenceIntake>? get references;
/// Create a copy of MicroCalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MicroCalStateCopyWith<MicroCalState> get copyWith => _$MicroCalStateCopyWithImpl<MicroCalState>(this as MicroCalState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MicroCalState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MicroCalState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.today, _this.today) || other.today == _this.today)&&(identical(other.week, _this.week) || other.week == _this.week)&&(identical(other.weekDays, _this.weekDays) || other.weekDays == _this.weekDays)&&(identical(other.sex, _this.sex) || other.sex == _this.sex)&&(identical(other.age, _this.age) || other.age == _this.age)&&const DeepCollectionEquality().equals(other.references, _this.references));
}


@override
int get hashCode {
  final _this = this as MicroCalState;
  return Object.hash(runtimeType,_this.status,_this.period,_this.enabled,_this.today,_this.week,_this.weekDays,_this.sex,_this.age,const DeepCollectionEquality().hash(_this.references));
}

@override
String toString() {
  final _this = this as MicroCalState;
  return 'MicroCalState(status: ${_this.status}, period: ${_this.period}, enabled: ${_this.enabled}, today: ${_this.today}, week: ${_this.week}, weekDays: ${_this.weekDays}, sex: ${_this.sex}, age: ${_this.age}, references: ${_this.references})';
}


}

/// @nodoc
abstract mixin class $MicroCalStateCopyWith<$Res>  {
  factory $MicroCalStateCopyWith(MicroCalState value, $Res Function(MicroCalState) _then) = _$MicroCalStateCopyWithImpl;
@useResult
$Res call({
 MicroCalStatus status, MicroCalPeriod period, bool enabled, MicroIntake today, MicroIntake week, int weekDays, Sex? sex, int? age, Map<Micronutrient, ReferenceIntake>? references
});


$MicroIntakeCopyWith<$Res> get today;$MicroIntakeCopyWith<$Res> get week;

}
/// @nodoc
class _$MicroCalStateCopyWithImpl<$Res>
    implements $MicroCalStateCopyWith<$Res> {
  _$MicroCalStateCopyWithImpl(this._self, this._then);

  final MicroCalState _self;
  final $Res Function(MicroCalState) _then;

/// Create a copy of MicroCalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? period = null,Object? enabled = null,Object? today = null,Object? week = null,Object? weekDays = null,Object? sex = freezed,Object? age = freezed,Object? references = freezed,}) {
  return _then(MicroCalState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MicroCalStatus,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as MicroCalPeriod,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as MicroIntake,week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as MicroIntake,weekDays: null == weekDays ? _self.weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as int,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,references: freezed == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, ReferenceIntake>?,
  ));
}
/// Create a copy of MicroCalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicroIntakeCopyWith<$Res> get today {
  
  return $MicroIntakeCopyWith<$Res>(_self.today, (value) {
    return _then(_self.copyWith(today: value));
  });
}/// Create a copy of MicroCalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicroIntakeCopyWith<$Res> get week {
  
  return $MicroIntakeCopyWith<$Res>(_self.week, (value) {
    return _then(_self.copyWith(week: value));
  });
}
}


/// Adds pattern-matching-related methods to [MicroCalState].
extension MicroCalStatePatterns on MicroCalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MicroCalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MicroCalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MicroCalState value)  $default,){
final _that = this;
switch (_that) {
case _MicroCalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MicroCalState value)?  $default,){
final _that = this;
switch (_that) {
case _MicroCalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MicroCalStatus status,  MicroCalPeriod period,  bool enabled,  MicroIntake today,  MicroIntake week,  int weekDays,  Sex? sex,  int? age,  Map<Micronutrient, ReferenceIntake>? references)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MicroCalState() when $default != null:
return $default(_that.status,_that.period,_that.enabled,_that.today,_that.week,_that.weekDays,_that.sex,_that.age,_that.references);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MicroCalStatus status,  MicroCalPeriod period,  bool enabled,  MicroIntake today,  MicroIntake week,  int weekDays,  Sex? sex,  int? age,  Map<Micronutrient, ReferenceIntake>? references)  $default,) {final _that = this;
switch (_that) {
case _MicroCalState():
return $default(_that.status,_that.period,_that.enabled,_that.today,_that.week,_that.weekDays,_that.sex,_that.age,_that.references);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MicroCalStatus status,  MicroCalPeriod period,  bool enabled,  MicroIntake today,  MicroIntake week,  int weekDays,  Sex? sex,  int? age,  Map<Micronutrient, ReferenceIntake>? references)?  $default,) {final _that = this;
switch (_that) {
case _MicroCalState() when $default != null:
return $default(_that.status,_that.period,_that.enabled,_that.today,_that.week,_that.weekDays,_that.sex,_that.age,_that.references);case _:
  return null;

}
}

}

/// @nodoc


class _MicroCalState extends MicroCalState {
  const _MicroCalState({this.status = MicroCalStatus.loading, this.period = MicroCalPeriod.week, this.enabled = false, this.today = const MicroIntake(), this.week = const MicroIntake(), this.weekDays = 0, this.sex, this.age,  Map<Micronutrient, ReferenceIntake>? references}): _references = references,super._();
  

@override@JsonKey() final  MicroCalStatus status;
@override@JsonKey() final  MicroCalPeriod period;
@override@JsonKey() final  bool enabled;
@override@JsonKey() final  MicroIntake today;
@override@JsonKey() final  MicroIntake week;
@override@JsonKey() final  int weekDays;
@override final  Sex? sex;
@override final  int? age;
 final  Map<Micronutrient, ReferenceIntake>? _references;
@override Map<Micronutrient, ReferenceIntake>? get references {
  final value = _references;
  if (value == null) return null;
  if (_references is EqualUnmodifiableMapView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MicroCalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MicroCalStateCopyWith<_MicroCalState> get copyWith => __$MicroCalStateCopyWithImpl<_MicroCalState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MicroCalState&&(identical(other.status, status) || other.status == status)&&(identical(other.period, period) || other.period == period)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.today, today) || other.today == today)&&(identical(other.week, week) || other.week == week)&&(identical(other.weekDays, weekDays) || other.weekDays == weekDays)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.age, age) || other.age == age)&&const DeepCollectionEquality().equals(other.references, _references));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,period,enabled,today,week,weekDays,sex,age,const DeepCollectionEquality().hash(_references));
}

@override
String toString() {
    return 'MicroCalState(status: $status, period: $period, enabled: $enabled, today: $today, week: $week, weekDays: $weekDays, sex: $sex, age: $age, references: $references)';
}


}

/// @nodoc
abstract mixin class _$MicroCalStateCopyWith<$Res> implements $MicroCalStateCopyWith<$Res> {
  factory _$MicroCalStateCopyWith(_MicroCalState value, $Res Function(_MicroCalState) _then) = __$MicroCalStateCopyWithImpl;
@override @useResult
$Res call({
 MicroCalStatus status, MicroCalPeriod period, bool enabled, MicroIntake today, MicroIntake week, int weekDays, Sex? sex, int? age, Map<Micronutrient, ReferenceIntake>? references
});


@override $MicroIntakeCopyWith<$Res> get today;@override $MicroIntakeCopyWith<$Res> get week;

}
/// @nodoc
class __$MicroCalStateCopyWithImpl<$Res>
    implements _$MicroCalStateCopyWith<$Res> {
  __$MicroCalStateCopyWithImpl(this._self, this._then);

  final _MicroCalState _self;
  final $Res Function(_MicroCalState) _then;

/// Create a copy of MicroCalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? period = null,Object? enabled = null,Object? today = null,Object? week = null,Object? weekDays = null,Object? sex = freezed,Object? age = freezed,Object? references = freezed,}) {
  return _then(_MicroCalState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MicroCalStatus,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as MicroCalPeriod,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as MicroIntake,week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as MicroIntake,weekDays: null == weekDays ? _self.weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as int,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,references: freezed == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, ReferenceIntake>?,
  ));
}

/// Create a copy of MicroCalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicroIntakeCopyWith<$Res> get today {
  
  return $MicroIntakeCopyWith<$Res>(_self.today, (value) {
    return _then(_self.copyWith(today: value));
  });
}/// Create a copy of MicroCalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicroIntakeCopyWith<$Res> get week {
  
  return $MicroIntakeCopyWith<$Res>(_self.week, (value) {
    return _then(_self.copyWith(week: value));
  });
}
}

// dart format on
