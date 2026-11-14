// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Supplement {

 int get id; String get name; SupplementUnit get unit; Micronutrients get microsPerUnit;
/// Create a copy of Supplement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplementCopyWith<Supplement> get copyWith => _$SupplementCopyWithImpl<Supplement>(this as Supplement, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Supplement;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Supplement&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.microsPerUnit, _this.microsPerUnit) || other.microsPerUnit == _this.microsPerUnit));
}


@override
int get hashCode {
  final _this = this as Supplement;
  return Object.hash(runtimeType,_this.id,_this.name,_this.unit,_this.microsPerUnit);
}

@override
String toString() {
  final _this = this as Supplement;
  return 'Supplement(id: ${_this.id}, name: ${_this.name}, unit: ${_this.unit}, microsPerUnit: ${_this.microsPerUnit})';
}


}

/// @nodoc
abstract mixin class $SupplementCopyWith<$Res>  {
  factory $SupplementCopyWith(Supplement value, $Res Function(Supplement) _then) = _$SupplementCopyWithImpl;
@useResult
$Res call({
 int id, String name, SupplementUnit unit, Micronutrients microsPerUnit
});


$MicronutrientsCopyWith<$Res> get microsPerUnit;

}
/// @nodoc
class _$SupplementCopyWithImpl<$Res>
    implements $SupplementCopyWith<$Res> {
  _$SupplementCopyWithImpl(this._self, this._then);

  final Supplement _self;
  final $Res Function(Supplement) _then;

/// Create a copy of Supplement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? unit = null,Object? microsPerUnit = null,}) {
  return _then(Supplement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as SupplementUnit,microsPerUnit: null == microsPerUnit ? _self.microsPerUnit : microsPerUnit // ignore: cast_nullable_to_non_nullable
as Micronutrients,
  ));
}
/// Create a copy of Supplement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicronutrientsCopyWith<$Res> get microsPerUnit {
  
  return $MicronutrientsCopyWith<$Res>(_self.microsPerUnit, (value) {
    return _then(_self.copyWith(microsPerUnit: value));
  });
}
}


/// Adds pattern-matching-related methods to [Supplement].
extension SupplementPatterns on Supplement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Supplement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Supplement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Supplement value)  $default,){
final _that = this;
switch (_that) {
case _Supplement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Supplement value)?  $default,){
final _that = this;
switch (_that) {
case _Supplement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  SupplementUnit unit,  Micronutrients microsPerUnit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Supplement() when $default != null:
return $default(_that.id,_that.name,_that.unit,_that.microsPerUnit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  SupplementUnit unit,  Micronutrients microsPerUnit)  $default,) {final _that = this;
switch (_that) {
case _Supplement():
return $default(_that.id,_that.name,_that.unit,_that.microsPerUnit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  SupplementUnit unit,  Micronutrients microsPerUnit)?  $default,) {final _that = this;
switch (_that) {
case _Supplement() when $default != null:
return $default(_that.id,_that.name,_that.unit,_that.microsPerUnit);case _:
  return null;

}
}

}

/// @nodoc


class _Supplement implements Supplement {
  const _Supplement({required this.id, required this.name, required this.unit, this.microsPerUnit = const Micronutrients()});
  

@override final  int id;
@override final  String name;
@override final  SupplementUnit unit;
@override@JsonKey() final  Micronutrients microsPerUnit;

/// Create a copy of Supplement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplementCopyWith<_Supplement> get copyWith => __$SupplementCopyWithImpl<_Supplement>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Supplement&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.microsPerUnit, microsPerUnit) || other.microsPerUnit == microsPerUnit));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,unit,microsPerUnit);
}

@override
String toString() {
    return 'Supplement(id: $id, name: $name, unit: $unit, microsPerUnit: $microsPerUnit)';
}


}

/// @nodoc
abstract mixin class _$SupplementCopyWith<$Res> implements $SupplementCopyWith<$Res> {
  factory _$SupplementCopyWith(_Supplement value, $Res Function(_Supplement) _then) = __$SupplementCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, SupplementUnit unit, Micronutrients microsPerUnit
});


@override $MicronutrientsCopyWith<$Res> get microsPerUnit;

}
/// @nodoc
class __$SupplementCopyWithImpl<$Res>
    implements _$SupplementCopyWith<$Res> {
  __$SupplementCopyWithImpl(this._self, this._then);

  final _Supplement _self;
  final $Res Function(_Supplement) _then;

/// Create a copy of Supplement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? unit = null,Object? microsPerUnit = null,}) {
  return _then(_Supplement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as SupplementUnit,microsPerUnit: null == microsPerUnit ? _self.microsPerUnit : microsPerUnit // ignore: cast_nullable_to_non_nullable
as Micronutrients,
  ));
}

/// Create a copy of Supplement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicronutrientsCopyWith<$Res> get microsPerUnit {
  
  return $MicronutrientsCopyWith<$Res>(_self.microsPerUnit, (value) {
    return _then(_self.copyWith(microsPerUnit: value));
  });
}
}

// dart format on
