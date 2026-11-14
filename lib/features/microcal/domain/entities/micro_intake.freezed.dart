// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'micro_intake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MicroIntake {

 Micronutrients get food; Micronutrients get supplements; Map<Micronutrient, double> get coverage;
/// Create a copy of MicroIntake
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MicroIntakeCopyWith<MicroIntake> get copyWith => _$MicroIntakeCopyWithImpl<MicroIntake>(this as MicroIntake, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MicroIntake;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MicroIntake&&(identical(other.food, _this.food) || other.food == _this.food)&&(identical(other.supplements, _this.supplements) || other.supplements == _this.supplements)&&const DeepCollectionEquality().equals(other.coverage, _this.coverage));
}


@override
int get hashCode {
  final _this = this as MicroIntake;
  return Object.hash(runtimeType,_this.food,_this.supplements,const DeepCollectionEquality().hash(_this.coverage));
}

@override
String toString() {
  final _this = this as MicroIntake;
  return 'MicroIntake(food: ${_this.food}, supplements: ${_this.supplements}, coverage: ${_this.coverage})';
}


}

/// @nodoc
abstract mixin class $MicroIntakeCopyWith<$Res>  {
  factory $MicroIntakeCopyWith(MicroIntake value, $Res Function(MicroIntake) _then) = _$MicroIntakeCopyWithImpl;
@useResult
$Res call({
 Micronutrients food, Micronutrients supplements, Map<Micronutrient, double> coverage
});


$MicronutrientsCopyWith<$Res> get food;$MicronutrientsCopyWith<$Res> get supplements;

}
/// @nodoc
class _$MicroIntakeCopyWithImpl<$Res>
    implements $MicroIntakeCopyWith<$Res> {
  _$MicroIntakeCopyWithImpl(this._self, this._then);

  final MicroIntake _self;
  final $Res Function(MicroIntake) _then;

/// Create a copy of MicroIntake
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? food = null,Object? supplements = null,Object? coverage = null,}) {
  return _then(MicroIntake(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as Micronutrients,supplements: null == supplements ? _self.supplements : supplements // ignore: cast_nullable_to_non_nullable
as Micronutrients,coverage: null == coverage ? _self.coverage : coverage // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, double>,
  ));
}
/// Create a copy of MicroIntake
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicronutrientsCopyWith<$Res> get food {
  
  return $MicronutrientsCopyWith<$Res>(_self.food, (value) {
    return _then(_self.copyWith(food: value));
  });
}/// Create a copy of MicroIntake
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicronutrientsCopyWith<$Res> get supplements {
  
  return $MicronutrientsCopyWith<$Res>(_self.supplements, (value) {
    return _then(_self.copyWith(supplements: value));
  });
}
}


/// Adds pattern-matching-related methods to [MicroIntake].
extension MicroIntakePatterns on MicroIntake {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MicroIntake value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MicroIntake() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MicroIntake value)  $default,){
final _that = this;
switch (_that) {
case _MicroIntake():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MicroIntake value)?  $default,){
final _that = this;
switch (_that) {
case _MicroIntake() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Micronutrients food,  Micronutrients supplements,  Map<Micronutrient, double> coverage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MicroIntake() when $default != null:
return $default(_that.food,_that.supplements,_that.coverage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Micronutrients food,  Micronutrients supplements,  Map<Micronutrient, double> coverage)  $default,) {final _that = this;
switch (_that) {
case _MicroIntake():
return $default(_that.food,_that.supplements,_that.coverage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Micronutrients food,  Micronutrients supplements,  Map<Micronutrient, double> coverage)?  $default,) {final _that = this;
switch (_that) {
case _MicroIntake() when $default != null:
return $default(_that.food,_that.supplements,_that.coverage);case _:
  return null;

}
}

}

/// @nodoc


class _MicroIntake extends MicroIntake {
  const _MicroIntake({this.food = const Micronutrients(), this.supplements = const Micronutrients(),  Map<Micronutrient, double> coverage = const <Micronutrient, double>{}}): _coverage = coverage,super._();
  

@override@JsonKey() final  Micronutrients food;
@override@JsonKey() final  Micronutrients supplements;
 final  Map<Micronutrient, double> _coverage;
@override@JsonKey() Map<Micronutrient, double> get coverage {
  if (_coverage is EqualUnmodifiableMapView) return _coverage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coverage);
}


/// Create a copy of MicroIntake
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MicroIntakeCopyWith<_MicroIntake> get copyWith => __$MicroIntakeCopyWithImpl<_MicroIntake>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MicroIntake&&(identical(other.food, food) || other.food == food)&&(identical(other.supplements, supplements) || other.supplements == supplements)&&const DeepCollectionEquality().equals(other.coverage, _coverage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,food,supplements,const DeepCollectionEquality().hash(_coverage));
}

@override
String toString() {
    return 'MicroIntake(food: $food, supplements: $supplements, coverage: $coverage)';
}


}

/// @nodoc
abstract mixin class _$MicroIntakeCopyWith<$Res> implements $MicroIntakeCopyWith<$Res> {
  factory _$MicroIntakeCopyWith(_MicroIntake value, $Res Function(_MicroIntake) _then) = __$MicroIntakeCopyWithImpl;
@override @useResult
$Res call({
 Micronutrients food, Micronutrients supplements, Map<Micronutrient, double> coverage
});


@override $MicronutrientsCopyWith<$Res> get food;@override $MicronutrientsCopyWith<$Res> get supplements;

}
/// @nodoc
class __$MicroIntakeCopyWithImpl<$Res>
    implements _$MicroIntakeCopyWith<$Res> {
  __$MicroIntakeCopyWithImpl(this._self, this._then);

  final _MicroIntake _self;
  final $Res Function(_MicroIntake) _then;

/// Create a copy of MicroIntake
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? food = null,Object? supplements = null,Object? coverage = null,}) {
  return _then(_MicroIntake(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as Micronutrients,supplements: null == supplements ? _self.supplements : supplements // ignore: cast_nullable_to_non_nullable
as Micronutrients,coverage: null == coverage ? _self._coverage : coverage // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, double>,
  ));
}

/// Create a copy of MicroIntake
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicronutrientsCopyWith<$Res> get food {
  
  return $MicronutrientsCopyWith<$Res>(_self.food, (value) {
    return _then(_self.copyWith(food: value));
  });
}/// Create a copy of MicroIntake
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicronutrientsCopyWith<$Res> get supplements {
  
  return $MicronutrientsCopyWith<$Res>(_self.supplements, (value) {
    return _then(_self.copyWith(supplements: value));
  });
}
}

// dart format on
