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
mixin _$IngredientEntry {

 Ingredient get ingredient; int get grams;
/// Create a copy of IngredientEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientEntryCopyWith<IngredientEntry> get copyWith => _$IngredientEntryCopyWithImpl<IngredientEntry>(this as IngredientEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as IngredientEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientEntry&&(identical(other.ingredient, _this.ingredient) || other.ingredient == _this.ingredient)&&(identical(other.grams, _this.grams) || other.grams == _this.grams));
}


@override
int get hashCode {
  final _this = this as IngredientEntry;
  return Object.hash(runtimeType,_this.ingredient,_this.grams);
}

@override
String toString() {
  final _this = this as IngredientEntry;
  return 'IngredientEntry(ingredient: ${_this.ingredient}, grams: ${_this.grams})';
}


}

/// @nodoc
abstract mixin class $IngredientEntryCopyWith<$Res>  {
  factory $IngredientEntryCopyWith(IngredientEntry value, $Res Function(IngredientEntry) _then) = _$IngredientEntryCopyWithImpl;
@useResult
$Res call({
 Ingredient ingredient, int grams
});


$IngredientCopyWith<$Res> get ingredient;

}
/// @nodoc
class _$IngredientEntryCopyWithImpl<$Res>
    implements $IngredientEntryCopyWith<$Res> {
  _$IngredientEntryCopyWithImpl(this._self, this._then);

  final IngredientEntry _self;
  final $Res Function(IngredientEntry) _then;

/// Create a copy of IngredientEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredient = null,Object? grams = null,}) {
  return _then(IngredientEntry(
ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient,grams: null == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of IngredientEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res> get ingredient {
  
  return $IngredientCopyWith<$Res>(_self.ingredient, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}


/// Adds pattern-matching-related methods to [IngredientEntry].
extension IngredientEntryPatterns on IngredientEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientEntry value)  $default,){
final _that = this;
switch (_that) {
case _IngredientEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientEntry value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientEntry() when $default != null:
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
case _IngredientEntry() when $default != null:
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
case _IngredientEntry():
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
case _IngredientEntry() when $default != null:
return $default(_that.ingredient,_that.grams);case _:
  return null;

}
}

}

/// @nodoc


class _IngredientEntry extends IngredientEntry {
  const _IngredientEntry({required this.ingredient, required this.grams}): super._();
  

@override final  Ingredient ingredient;
@override final  int grams;

/// Create a copy of IngredientEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientEntryCopyWith<_IngredientEntry> get copyWith => __$IngredientEntryCopyWithImpl<_IngredientEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientEntry&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.grams, grams) || other.grams == grams));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ingredient,grams);
}

@override
String toString() {
    return 'IngredientEntry(ingredient: $ingredient, grams: $grams)';
}


}

/// @nodoc
abstract mixin class _$IngredientEntryCopyWith<$Res> implements $IngredientEntryCopyWith<$Res> {
  factory _$IngredientEntryCopyWith(_IngredientEntry value, $Res Function(_IngredientEntry) _then) = __$IngredientEntryCopyWithImpl;
@override @useResult
$Res call({
 Ingredient ingredient, int grams
});


@override $IngredientCopyWith<$Res> get ingredient;

}
/// @nodoc
class __$IngredientEntryCopyWithImpl<$Res>
    implements _$IngredientEntryCopyWith<$Res> {
  __$IngredientEntryCopyWithImpl(this._self, this._then);

  final _IngredientEntry _self;
  final $Res Function(_IngredientEntry) _then;

/// Create a copy of IngredientEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredient = null,Object? grams = null,}) {
  return _then(_IngredientEntry(
ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient,grams: null == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of IngredientEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res> get ingredient {
  
  return $IngredientCopyWith<$Res>(_self.ingredient, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}

/// @nodoc
mixin _$RecipeEntry {

 Recipe get recipe; int get grams;
/// Create a copy of RecipeEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeEntryCopyWith<RecipeEntry> get copyWith => _$RecipeEntryCopyWithImpl<RecipeEntry>(this as RecipeEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RecipeEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeEntry&&(identical(other.recipe, _this.recipe) || other.recipe == _this.recipe)&&(identical(other.grams, _this.grams) || other.grams == _this.grams));
}


@override
int get hashCode {
  final _this = this as RecipeEntry;
  return Object.hash(runtimeType,_this.recipe,_this.grams);
}

@override
String toString() {
  final _this = this as RecipeEntry;
  return 'RecipeEntry(recipe: ${_this.recipe}, grams: ${_this.grams})';
}


}

/// @nodoc
abstract mixin class $RecipeEntryCopyWith<$Res>  {
  factory $RecipeEntryCopyWith(RecipeEntry value, $Res Function(RecipeEntry) _then) = _$RecipeEntryCopyWithImpl;
@useResult
$Res call({
 Recipe recipe, int grams
});


$RecipeCopyWith<$Res> get recipe;

}
/// @nodoc
class _$RecipeEntryCopyWithImpl<$Res>
    implements $RecipeEntryCopyWith<$Res> {
  _$RecipeEntryCopyWithImpl(this._self, this._then);

  final RecipeEntry _self;
  final $Res Function(RecipeEntry) _then;

/// Create a copy of RecipeEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipe = null,Object? grams = null,}) {
  return _then(RecipeEntry(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe,grams: null == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RecipeEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipe {
  
  return $RecipeCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecipeEntry].
extension RecipeEntryPatterns on RecipeEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeEntry value)  $default,){
final _that = this;
switch (_that) {
case _RecipeEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeEntry value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Recipe recipe,  int grams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeEntry() when $default != null:
return $default(_that.recipe,_that.grams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Recipe recipe,  int grams)  $default,) {final _that = this;
switch (_that) {
case _RecipeEntry():
return $default(_that.recipe,_that.grams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Recipe recipe,  int grams)?  $default,) {final _that = this;
switch (_that) {
case _RecipeEntry() when $default != null:
return $default(_that.recipe,_that.grams);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeEntry extends RecipeEntry {
  const _RecipeEntry({required this.recipe, required this.grams}): super._();
  

@override final  Recipe recipe;
@override final  int grams;

/// Create a copy of RecipeEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeEntryCopyWith<_RecipeEntry> get copyWith => __$RecipeEntryCopyWithImpl<_RecipeEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeEntry&&(identical(other.recipe, recipe) || other.recipe == recipe)&&(identical(other.grams, grams) || other.grams == grams));
}


@override
int get hashCode {
    return Object.hash(runtimeType,recipe,grams);
}

@override
String toString() {
    return 'RecipeEntry(recipe: $recipe, grams: $grams)';
}


}

/// @nodoc
abstract mixin class _$RecipeEntryCopyWith<$Res> implements $RecipeEntryCopyWith<$Res> {
  factory _$RecipeEntryCopyWith(_RecipeEntry value, $Res Function(_RecipeEntry) _then) = __$RecipeEntryCopyWithImpl;
@override @useResult
$Res call({
 Recipe recipe, int grams
});


@override $RecipeCopyWith<$Res> get recipe;

}
/// @nodoc
class __$RecipeEntryCopyWithImpl<$Res>
    implements _$RecipeEntryCopyWith<$Res> {
  __$RecipeEntryCopyWithImpl(this._self, this._then);

  final _RecipeEntry _self;
  final $Res Function(_RecipeEntry) _then;

/// Create a copy of RecipeEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipe = null,Object? grams = null,}) {
  return _then(_RecipeEntry(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe,grams: null == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RecipeEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipe {
  
  return $RecipeCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
