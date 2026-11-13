// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeFormState {

 RecipeFormStatus get status; List<Ingredient> get ingredients; List<RecipeIngredient> get items; int? get finalWeightGrams;
/// Create a copy of RecipeFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeFormStateCopyWith<RecipeFormState> get copyWith => _$RecipeFormStateCopyWithImpl<RecipeFormState>(this as RecipeFormState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RecipeFormState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeFormState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.finalWeightGrams, _this.finalWeightGrams) || other.finalWeightGrams == _this.finalWeightGrams));
}


@override
int get hashCode {
  final _this = this as RecipeFormState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.ingredients),const DeepCollectionEquality().hash(_this.items),_this.finalWeightGrams);
}

@override
String toString() {
  final _this = this as RecipeFormState;
  return 'RecipeFormState(status: ${_this.status}, ingredients: ${_this.ingredients}, items: ${_this.items}, finalWeightGrams: ${_this.finalWeightGrams})';
}


}

/// @nodoc
abstract mixin class $RecipeFormStateCopyWith<$Res>  {
  factory $RecipeFormStateCopyWith(RecipeFormState value, $Res Function(RecipeFormState) _then) = _$RecipeFormStateCopyWithImpl;
@useResult
$Res call({
 RecipeFormStatus status, List<Ingredient> ingredients, List<RecipeIngredient> items, int? finalWeightGrams
});




}
/// @nodoc
class _$RecipeFormStateCopyWithImpl<$Res>
    implements $RecipeFormStateCopyWith<$Res> {
  _$RecipeFormStateCopyWithImpl(this._self, this._then);

  final RecipeFormState _self;
  final $Res Function(RecipeFormState) _then;

/// Create a copy of RecipeFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? ingredients = null,Object? items = null,Object? finalWeightGrams = freezed,}) {
  return _then(RecipeFormState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecipeFormStatus,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RecipeIngredient>,finalWeightGrams: freezed == finalWeightGrams ? _self.finalWeightGrams : finalWeightGrams // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeFormState].
extension RecipeFormStatePatterns on RecipeFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeFormState value)  $default,){
final _that = this;
switch (_that) {
case _RecipeFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeFormState value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecipeFormStatus status,  List<Ingredient> ingredients,  List<RecipeIngredient> items,  int? finalWeightGrams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeFormState() when $default != null:
return $default(_that.status,_that.ingredients,_that.items,_that.finalWeightGrams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecipeFormStatus status,  List<Ingredient> ingredients,  List<RecipeIngredient> items,  int? finalWeightGrams)  $default,) {final _that = this;
switch (_that) {
case _RecipeFormState():
return $default(_that.status,_that.ingredients,_that.items,_that.finalWeightGrams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecipeFormStatus status,  List<Ingredient> ingredients,  List<RecipeIngredient> items,  int? finalWeightGrams)?  $default,) {final _that = this;
switch (_that) {
case _RecipeFormState() when $default != null:
return $default(_that.status,_that.ingredients,_that.items,_that.finalWeightGrams);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeFormState extends RecipeFormState {
  const _RecipeFormState({this.status = RecipeFormStatus.loading,  List<Ingredient> ingredients = const <Ingredient>[],  List<RecipeIngredient> items = const <RecipeIngredient>[], this.finalWeightGrams}): _ingredients = ingredients,_items = items,super._();
  

@override@JsonKey() final  RecipeFormStatus status;
 final  List<Ingredient> _ingredients;
@override@JsonKey() List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<RecipeIngredient> _items;
@override@JsonKey() List<RecipeIngredient> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int? finalWeightGrams;

/// Create a copy of RecipeFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeFormStateCopyWith<_RecipeFormState> get copyWith => __$RecipeFormStateCopyWithImpl<_RecipeFormState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeFormState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.ingredients, _ingredients)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.finalWeightGrams, finalWeightGrams) || other.finalWeightGrams == finalWeightGrams));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_items),finalWeightGrams);
}

@override
String toString() {
    return 'RecipeFormState(status: $status, ingredients: $ingredients, items: $items, finalWeightGrams: $finalWeightGrams)';
}


}

/// @nodoc
abstract mixin class _$RecipeFormStateCopyWith<$Res> implements $RecipeFormStateCopyWith<$Res> {
  factory _$RecipeFormStateCopyWith(_RecipeFormState value, $Res Function(_RecipeFormState) _then) = __$RecipeFormStateCopyWithImpl;
@override @useResult
$Res call({
 RecipeFormStatus status, List<Ingredient> ingredients, List<RecipeIngredient> items, int? finalWeightGrams
});




}
/// @nodoc
class __$RecipeFormStateCopyWithImpl<$Res>
    implements _$RecipeFormStateCopyWith<$Res> {
  __$RecipeFormStateCopyWithImpl(this._self, this._then);

  final _RecipeFormState _self;
  final $Res Function(_RecipeFormState) _then;

/// Create a copy of RecipeFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? ingredients = null,Object? items = null,Object? finalWeightGrams = freezed,}) {
  return _then(_RecipeFormState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecipeFormStatus,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RecipeIngredient>,finalWeightGrams: freezed == finalWeightGrams ? _self.finalWeightGrams : finalWeightGrams // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
