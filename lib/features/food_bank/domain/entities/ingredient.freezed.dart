// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Ingredient {

 int get id; String get name; Nutrients get per100g; String? get category; double get referenceGrams;
/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientCopyWith<Ingredient> get copyWith => _$IngredientCopyWithImpl<Ingredient>(this as Ingredient, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Ingredient;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredient&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.per100g, _this.per100g) || other.per100g == _this.per100g)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.referenceGrams, _this.referenceGrams) || other.referenceGrams == _this.referenceGrams));
}


@override
int get hashCode {
  final _this = this as Ingredient;
  return Object.hash(runtimeType,_this.id,_this.name,_this.per100g,_this.category,_this.referenceGrams);
}

@override
String toString() {
  final _this = this as Ingredient;
  return 'Ingredient(id: ${_this.id}, name: ${_this.name}, per100g: ${_this.per100g}, category: ${_this.category}, referenceGrams: ${_this.referenceGrams})';
}


}

/// @nodoc
abstract mixin class $IngredientCopyWith<$Res>  {
  factory $IngredientCopyWith(Ingredient value, $Res Function(Ingredient) _then) = _$IngredientCopyWithImpl;
@useResult
$Res call({
 int id, String name, Nutrients per100g, String? category, double referenceGrams
});


$NutrientsCopyWith<$Res> get per100g;

}
/// @nodoc
class _$IngredientCopyWithImpl<$Res>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._self, this._then);

  final Ingredient _self;
  final $Res Function(Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? per100g = null,Object? category = freezed,Object? referenceGrams = null,}) {
  return _then(Ingredient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as Nutrients,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,referenceGrams: null == referenceGrams ? _self.referenceGrams : referenceGrams // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get per100g {
  
  return $NutrientsCopyWith<$Res>(_self.per100g, (value) {
    return _then(_self.copyWith(per100g: value));
  });
}
}


/// Adds pattern-matching-related methods to [Ingredient].
extension IngredientPatterns on Ingredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ingredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ingredient value)  $default,){
final _that = this;
switch (_that) {
case _Ingredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ingredient value)?  $default,){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  Nutrients per100g,  String? category,  double referenceGrams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.id,_that.name,_that.per100g,_that.category,_that.referenceGrams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  Nutrients per100g,  String? category,  double referenceGrams)  $default,) {final _that = this;
switch (_that) {
case _Ingredient():
return $default(_that.id,_that.name,_that.per100g,_that.category,_that.referenceGrams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  Nutrients per100g,  String? category,  double referenceGrams)?  $default,) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.id,_that.name,_that.per100g,_that.category,_that.referenceGrams);case _:
  return null;

}
}

}

/// @nodoc


class _Ingredient implements Ingredient {
  const _Ingredient({required this.id, required this.name, required this.per100g, this.category, this.referenceGrams = 100});
  

@override final  int id;
@override final  String name;
@override final  Nutrients per100g;
@override final  String? category;
@override@JsonKey() final  double referenceGrams;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientCopyWith<_Ingredient> get copyWith => __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ingredient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.per100g, per100g) || other.per100g == per100g)&&(identical(other.category, category) || other.category == category)&&(identical(other.referenceGrams, referenceGrams) || other.referenceGrams == referenceGrams));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,per100g,category,referenceGrams);
}

@override
String toString() {
    return 'Ingredient(id: $id, name: $name, per100g: $per100g, category: $category, referenceGrams: $referenceGrams)';
}


}

/// @nodoc
abstract mixin class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(_Ingredient value, $Res Function(_Ingredient) _then) = __$IngredientCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, Nutrients per100g, String? category, double referenceGrams
});


@override $NutrientsCopyWith<$Res> get per100g;

}
/// @nodoc
class __$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(this._self, this._then);

  final _Ingredient _self;
  final $Res Function(_Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? per100g = null,Object? category = freezed,Object? referenceGrams = null,}) {
  return _then(_Ingredient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as Nutrients,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,referenceGrams: null == referenceGrams ? _self.referenceGrams : referenceGrams // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of Ingredient
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
