// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReferenceFood {

 int get code; String get nameEn; String get nameEl; Nutrients get per100g;
/// Create a copy of ReferenceFood
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceFoodCopyWith<ReferenceFood> get copyWith => _$ReferenceFoodCopyWithImpl<ReferenceFood>(this as ReferenceFood, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReferenceFood;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceFood&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.nameEn, _this.nameEn) || other.nameEn == _this.nameEn)&&(identical(other.nameEl, _this.nameEl) || other.nameEl == _this.nameEl)&&(identical(other.per100g, _this.per100g) || other.per100g == _this.per100g));
}


@override
int get hashCode {
  final _this = this as ReferenceFood;
  return Object.hash(runtimeType,_this.code,_this.nameEn,_this.nameEl,_this.per100g);
}

@override
String toString() {
  final _this = this as ReferenceFood;
  return 'ReferenceFood(code: ${_this.code}, nameEn: ${_this.nameEn}, nameEl: ${_this.nameEl}, per100g: ${_this.per100g})';
}


}

/// @nodoc
abstract mixin class $ReferenceFoodCopyWith<$Res>  {
  factory $ReferenceFoodCopyWith(ReferenceFood value, $Res Function(ReferenceFood) _then) = _$ReferenceFoodCopyWithImpl;
@useResult
$Res call({
 int code, String nameEn, String nameEl, Nutrients per100g
});


$NutrientsCopyWith<$Res> get per100g;

}
/// @nodoc
class _$ReferenceFoodCopyWithImpl<$Res>
    implements $ReferenceFoodCopyWith<$Res> {
  _$ReferenceFoodCopyWithImpl(this._self, this._then);

  final ReferenceFood _self;
  final $Res Function(ReferenceFood) _then;

/// Create a copy of ReferenceFood
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? nameEn = null,Object? nameEl = null,Object? per100g = null,}) {
  return _then(ReferenceFood(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameEl: null == nameEl ? _self.nameEl : nameEl // ignore: cast_nullable_to_non_nullable
as String,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as Nutrients,
  ));
}
/// Create a copy of ReferenceFood
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get per100g {
  
  return $NutrientsCopyWith<$Res>(_self.per100g, (value) {
    return _then(_self.copyWith(per100g: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReferenceFood].
extension ReferenceFoodPatterns on ReferenceFood {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceFood value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceFood() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceFood value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceFood():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceFood value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceFood() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int code,  String nameEn,  String nameEl,  Nutrients per100g)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceFood() when $default != null:
return $default(_that.code,_that.nameEn,_that.nameEl,_that.per100g);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int code,  String nameEn,  String nameEl,  Nutrients per100g)  $default,) {final _that = this;
switch (_that) {
case _ReferenceFood():
return $default(_that.code,_that.nameEn,_that.nameEl,_that.per100g);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int code,  String nameEn,  String nameEl,  Nutrients per100g)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceFood() when $default != null:
return $default(_that.code,_that.nameEn,_that.nameEl,_that.per100g);case _:
  return null;

}
}

}

/// @nodoc


class _ReferenceFood implements ReferenceFood {
  const _ReferenceFood({required this.code, required this.nameEn, required this.nameEl, required this.per100g});
  

@override final  int code;
@override final  String nameEn;
@override final  String nameEl;
@override final  Nutrients per100g;

/// Create a copy of ReferenceFood
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceFoodCopyWith<_ReferenceFood> get copyWith => __$ReferenceFoodCopyWithImpl<_ReferenceFood>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceFood&&(identical(other.code, code) || other.code == code)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameEl, nameEl) || other.nameEl == nameEl)&&(identical(other.per100g, per100g) || other.per100g == per100g));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code,nameEn,nameEl,per100g);
}

@override
String toString() {
    return 'ReferenceFood(code: $code, nameEn: $nameEn, nameEl: $nameEl, per100g: $per100g)';
}


}

/// @nodoc
abstract mixin class _$ReferenceFoodCopyWith<$Res> implements $ReferenceFoodCopyWith<$Res> {
  factory _$ReferenceFoodCopyWith(_ReferenceFood value, $Res Function(_ReferenceFood) _then) = __$ReferenceFoodCopyWithImpl;
@override @useResult
$Res call({
 int code, String nameEn, String nameEl, Nutrients per100g
});


@override $NutrientsCopyWith<$Res> get per100g;

}
/// @nodoc
class __$ReferenceFoodCopyWithImpl<$Res>
    implements _$ReferenceFoodCopyWith<$Res> {
  __$ReferenceFoodCopyWithImpl(this._self, this._then);

  final _ReferenceFood _self;
  final $Res Function(_ReferenceFood) _then;

/// Create a copy of ReferenceFood
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? nameEn = null,Object? nameEl = null,Object? per100g = null,}) {
  return _then(_ReferenceFood(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameEl: null == nameEl ? _self.nameEl : nameEl // ignore: cast_nullable_to_non_nullable
as String,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as Nutrients,
  ));
}

/// Create a copy of ReferenceFood
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get per100g {
  
  return $NutrientsCopyWith<$Res>(_self.per100g, (value) {
    return _then(_self.copyWith(per100g: value));
  });
}
}

// dart format on
