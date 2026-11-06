// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Nutrients {

 double get kcal; double get proteinG; double get carbsG; double get sugarsG; double get fatG; double get saturatedG; double get fiberG; double get saltMg;
/// Create a copy of Nutrients
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientsCopyWith<Nutrients> get copyWith => _$NutrientsCopyWithImpl<Nutrients>(this as Nutrients, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Nutrients;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Nutrients&&(identical(other.kcal, _this.kcal) || other.kcal == _this.kcal)&&(identical(other.proteinG, _this.proteinG) || other.proteinG == _this.proteinG)&&(identical(other.carbsG, _this.carbsG) || other.carbsG == _this.carbsG)&&(identical(other.sugarsG, _this.sugarsG) || other.sugarsG == _this.sugarsG)&&(identical(other.fatG, _this.fatG) || other.fatG == _this.fatG)&&(identical(other.saturatedG, _this.saturatedG) || other.saturatedG == _this.saturatedG)&&(identical(other.fiberG, _this.fiberG) || other.fiberG == _this.fiberG)&&(identical(other.saltMg, _this.saltMg) || other.saltMg == _this.saltMg));
}


@override
int get hashCode {
  final _this = this as Nutrients;
  return Object.hash(runtimeType,_this.kcal,_this.proteinG,_this.carbsG,_this.sugarsG,_this.fatG,_this.saturatedG,_this.fiberG,_this.saltMg);
}

@override
String toString() {
  final _this = this as Nutrients;
  return 'Nutrients(kcal: ${_this.kcal}, proteinG: ${_this.proteinG}, carbsG: ${_this.carbsG}, sugarsG: ${_this.sugarsG}, fatG: ${_this.fatG}, saturatedG: ${_this.saturatedG}, fiberG: ${_this.fiberG}, saltMg: ${_this.saltMg})';
}


}

/// @nodoc
abstract mixin class $NutrientsCopyWith<$Res>  {
  factory $NutrientsCopyWith(Nutrients value, $Res Function(Nutrients) _then) = _$NutrientsCopyWithImpl;
@useResult
$Res call({
 double kcal, double proteinG, double carbsG, double sugarsG, double fatG, double saturatedG, double fiberG, double saltMg
});




}
/// @nodoc
class _$NutrientsCopyWithImpl<$Res>
    implements $NutrientsCopyWith<$Res> {
  _$NutrientsCopyWithImpl(this._self, this._then);

  final Nutrients _self;
  final $Res Function(Nutrients) _then;

/// Create a copy of Nutrients
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kcal = null,Object? proteinG = null,Object? carbsG = null,Object? sugarsG = null,Object? fatG = null,Object? saturatedG = null,Object? fiberG = null,Object? saltMg = null,}) {
  return _then(Nutrients(
kcal: null == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double,proteinG: null == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double,carbsG: null == carbsG ? _self.carbsG : carbsG // ignore: cast_nullable_to_non_nullable
as double,sugarsG: null == sugarsG ? _self.sugarsG : sugarsG // ignore: cast_nullable_to_non_nullable
as double,fatG: null == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double,saturatedG: null == saturatedG ? _self.saturatedG : saturatedG // ignore: cast_nullable_to_non_nullable
as double,fiberG: null == fiberG ? _self.fiberG : fiberG // ignore: cast_nullable_to_non_nullable
as double,saltMg: null == saltMg ? _self.saltMg : saltMg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Nutrients].
extension NutrientsPatterns on Nutrients {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Nutrients value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Nutrients() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Nutrients value)  $default,){
final _that = this;
switch (_that) {
case _Nutrients():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Nutrients value)?  $default,){
final _that = this;
switch (_that) {
case _Nutrients() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double kcal,  double proteinG,  double carbsG,  double sugarsG,  double fatG,  double saturatedG,  double fiberG,  double saltMg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Nutrients() when $default != null:
return $default(_that.kcal,_that.proteinG,_that.carbsG,_that.sugarsG,_that.fatG,_that.saturatedG,_that.fiberG,_that.saltMg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double kcal,  double proteinG,  double carbsG,  double sugarsG,  double fatG,  double saturatedG,  double fiberG,  double saltMg)  $default,) {final _that = this;
switch (_that) {
case _Nutrients():
return $default(_that.kcal,_that.proteinG,_that.carbsG,_that.sugarsG,_that.fatG,_that.saturatedG,_that.fiberG,_that.saltMg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double kcal,  double proteinG,  double carbsG,  double sugarsG,  double fatG,  double saturatedG,  double fiberG,  double saltMg)?  $default,) {final _that = this;
switch (_that) {
case _Nutrients() when $default != null:
return $default(_that.kcal,_that.proteinG,_that.carbsG,_that.sugarsG,_that.fatG,_that.saturatedG,_that.fiberG,_that.saltMg);case _:
  return null;

}
}

}

/// @nodoc


class _Nutrients extends Nutrients {
  const _Nutrients({this.kcal = 0, this.proteinG = 0, this.carbsG = 0, this.sugarsG = 0, this.fatG = 0, this.saturatedG = 0, this.fiberG = 0, this.saltMg = 0}): super._();
  

@override@JsonKey() final  double kcal;
@override@JsonKey() final  double proteinG;
@override@JsonKey() final  double carbsG;
@override@JsonKey() final  double sugarsG;
@override@JsonKey() final  double fatG;
@override@JsonKey() final  double saturatedG;
@override@JsonKey() final  double fiberG;
@override@JsonKey() final  double saltMg;

/// Create a copy of Nutrients
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientsCopyWith<_Nutrients> get copyWith => __$NutrientsCopyWithImpl<_Nutrients>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Nutrients&&(identical(other.kcal, kcal) || other.kcal == kcal)&&(identical(other.proteinG, proteinG) || other.proteinG == proteinG)&&(identical(other.carbsG, carbsG) || other.carbsG == carbsG)&&(identical(other.sugarsG, sugarsG) || other.sugarsG == sugarsG)&&(identical(other.fatG, fatG) || other.fatG == fatG)&&(identical(other.saturatedG, saturatedG) || other.saturatedG == saturatedG)&&(identical(other.fiberG, fiberG) || other.fiberG == fiberG)&&(identical(other.saltMg, saltMg) || other.saltMg == saltMg));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kcal,proteinG,carbsG,sugarsG,fatG,saturatedG,fiberG,saltMg);
}

@override
String toString() {
    return 'Nutrients(kcal: $kcal, proteinG: $proteinG, carbsG: $carbsG, sugarsG: $sugarsG, fatG: $fatG, saturatedG: $saturatedG, fiberG: $fiberG, saltMg: $saltMg)';
}


}

/// @nodoc
abstract mixin class _$NutrientsCopyWith<$Res> implements $NutrientsCopyWith<$Res> {
  factory _$NutrientsCopyWith(_Nutrients value, $Res Function(_Nutrients) _then) = __$NutrientsCopyWithImpl;
@override @useResult
$Res call({
 double kcal, double proteinG, double carbsG, double sugarsG, double fatG, double saturatedG, double fiberG, double saltMg
});




}
/// @nodoc
class __$NutrientsCopyWithImpl<$Res>
    implements _$NutrientsCopyWith<$Res> {
  __$NutrientsCopyWithImpl(this._self, this._then);

  final _Nutrients _self;
  final $Res Function(_Nutrients) _then;

/// Create a copy of Nutrients
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kcal = null,Object? proteinG = null,Object? carbsG = null,Object? sugarsG = null,Object? fatG = null,Object? saturatedG = null,Object? fiberG = null,Object? saltMg = null,}) {
  return _then(_Nutrients(
kcal: null == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double,proteinG: null == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double,carbsG: null == carbsG ? _self.carbsG : carbsG // ignore: cast_nullable_to_non_nullable
as double,sugarsG: null == sugarsG ? _self.sugarsG : sugarsG // ignore: cast_nullable_to_non_nullable
as double,fatG: null == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double,saturatedG: null == saturatedG ? _self.saturatedG : saturatedG // ignore: cast_nullable_to_non_nullable
as double,fiberG: null == fiberG ? _self.fiberG : fiberG // ignore: cast_nullable_to_non_nullable
as double,saltMg: null == saltMg ? _self.saltMg : saltMg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
