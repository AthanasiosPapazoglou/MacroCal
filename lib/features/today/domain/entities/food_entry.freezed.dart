// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoodEntry {

 Ingredient get ingredient; int get grams;
/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodEntryCopyWith<FoodEntry> get copyWith => _$FoodEntryCopyWithImpl<FoodEntry>(this as FoodEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FoodEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodEntry&&(identical(other.ingredient, _this.ingredient) || other.ingredient == _this.ingredient)&&(identical(other.grams, _this.grams) || other.grams == _this.grams));
}


@override
int get hashCode {
  final _this = this as FoodEntry;
  return Object.hash(runtimeType,_this.ingredient,_this.grams);
}

@override
String toString() {
  final _this = this as FoodEntry;
  return 'FoodEntry(ingredient: ${_this.ingredient}, grams: ${_this.grams})';
}


}

/// @nodoc
abstract mixin class $FoodEntryCopyWith<$Res>  {
  factory $FoodEntryCopyWith(FoodEntry value, $Res Function(FoodEntry) _then) = _$FoodEntryCopyWithImpl;
@useResult
$Res call({
 Ingredient ingredient, int grams
});


$IngredientCopyWith<$Res> get ingredient;

}
/// @nodoc
class _$FoodEntryCopyWithImpl<$Res>
    implements $FoodEntryCopyWith<$Res> {
  _$FoodEntryCopyWithImpl(this._self, this._then);

  final FoodEntry _self;
  final $Res Function(FoodEntry) _then;

/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredient = null,Object? grams = null,}) {
  return _then(FoodEntry(
ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient,grams: null == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res> get ingredient {
  
  return $IngredientCopyWith<$Res>(_self.ingredient, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}


/// Adds pattern-matching-related methods to [FoodEntry].
extension FoodEntryPatterns on FoodEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodEntry value)  $default,){
final _that = this;
switch (_that) {
case _FoodEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodEntry value)?  $default,){
final _that = this;
switch (_that) {
case _FoodEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Ingredient ingredient,  int grams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodEntry() when $default != null:
return $default(_that.ingredient,_that.grams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Ingredient ingredient,  int grams)  $default,) {final _that = this;
switch (_that) {
case _FoodEntry():
return $default(_that.ingredient,_that.grams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Ingredient ingredient,  int grams)?  $default,) {final _that = this;
switch (_that) {
case _FoodEntry() when $default != null:
return $default(_that.ingredient,_that.grams);case _:
  return null;

}
}

}

/// @nodoc


class _FoodEntry implements FoodEntry {
  const _FoodEntry({required this.ingredient, required this.grams});
  

@override final  Ingredient ingredient;
@override final  int grams;

/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodEntryCopyWith<_FoodEntry> get copyWith => __$FoodEntryCopyWithImpl<_FoodEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodEntry&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.grams, grams) || other.grams == grams));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ingredient,grams);
}

@override
String toString() {
    return 'FoodEntry(ingredient: $ingredient, grams: $grams)';
}


}

/// @nodoc
abstract mixin class _$FoodEntryCopyWith<$Res> implements $FoodEntryCopyWith<$Res> {
  factory _$FoodEntryCopyWith(_FoodEntry value, $Res Function(_FoodEntry) _then) = __$FoodEntryCopyWithImpl;
@override @useResult
$Res call({
 Ingredient ingredient, int grams
});


@override $IngredientCopyWith<$Res> get ingredient;

}
/// @nodoc
class __$FoodEntryCopyWithImpl<$Res>
    implements _$FoodEntryCopyWith<$Res> {
  __$FoodEntryCopyWithImpl(this._self, this._then);

  final _FoodEntry _self;
  final $Res Function(_FoodEntry) _then;

/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredient = null,Object? grams = null,}) {
  return _then(_FoodEntry(
ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient,grams: null == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res> get ingredient {
  
  return $IngredientCopyWith<$Res>(_self.ingredient, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}

// dart format on
