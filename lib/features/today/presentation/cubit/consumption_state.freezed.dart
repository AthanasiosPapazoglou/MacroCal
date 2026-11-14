// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumption_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsumptionState {

 ConsumptionStatus get status; FoodKind get kind; List<Ingredient> get ingredients; List<Recipe> get recipes; Map<int, int> get grams; Map<int, int> get recipeGrams; List<int> get consumedIds; List<int> get consumedRecipeIds; String get query;
/// Create a copy of ConsumptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsumptionStateCopyWith<ConsumptionState> get copyWith => _$ConsumptionStateCopyWithImpl<ConsumptionState>(this as ConsumptionState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConsumptionState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsumptionState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients)&&const DeepCollectionEquality().equals(other.recipes, _this.recipes)&&const DeepCollectionEquality().equals(other.grams, _this.grams)&&const DeepCollectionEquality().equals(other.recipeGrams, _this.recipeGrams)&&const DeepCollectionEquality().equals(other.consumedIds, _this.consumedIds)&&const DeepCollectionEquality().equals(other.consumedRecipeIds, _this.consumedRecipeIds)&&(identical(other.query, _this.query) || other.query == _this.query));
}


@override
int get hashCode {
  final _this = this as ConsumptionState;
  return Object.hash(runtimeType,_this.status,_this.kind,const DeepCollectionEquality().hash(_this.ingredients),const DeepCollectionEquality().hash(_this.recipes),const DeepCollectionEquality().hash(_this.grams),const DeepCollectionEquality().hash(_this.recipeGrams),const DeepCollectionEquality().hash(_this.consumedIds),const DeepCollectionEquality().hash(_this.consumedRecipeIds),_this.query);
}

@override
String toString() {
  final _this = this as ConsumptionState;
  return 'ConsumptionState(status: ${_this.status}, kind: ${_this.kind}, ingredients: ${_this.ingredients}, recipes: ${_this.recipes}, grams: ${_this.grams}, recipeGrams: ${_this.recipeGrams}, consumedIds: ${_this.consumedIds}, consumedRecipeIds: ${_this.consumedRecipeIds}, query: ${_this.query})';
}


}

/// @nodoc
abstract mixin class $ConsumptionStateCopyWith<$Res>  {
  factory $ConsumptionStateCopyWith(ConsumptionState value, $Res Function(ConsumptionState) _then) = _$ConsumptionStateCopyWithImpl;
@useResult
$Res call({
 ConsumptionStatus status, FoodKind kind, List<Ingredient> ingredients, List<Recipe> recipes, Map<int, int> grams, Map<int, int> recipeGrams, List<int> consumedIds, List<int> consumedRecipeIds, String query
});




}
/// @nodoc
class _$ConsumptionStateCopyWithImpl<$Res>
    implements $ConsumptionStateCopyWith<$Res> {
  _$ConsumptionStateCopyWithImpl(this._self, this._then);

  final ConsumptionState _self;
  final $Res Function(ConsumptionState) _then;

/// Create a copy of ConsumptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? kind = null,Object? ingredients = null,Object? recipes = null,Object? grams = null,Object? recipeGrams = null,Object? consumedIds = null,Object? consumedRecipeIds = null,Object? query = null,}) {
  return _then(ConsumptionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConsumptionStatus,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as FoodKind,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,grams: null == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as Map<int, int>,recipeGrams: null == recipeGrams ? _self.recipeGrams : recipeGrams // ignore: cast_nullable_to_non_nullable
as Map<int, int>,consumedIds: null == consumedIds ? _self.consumedIds : consumedIds // ignore: cast_nullable_to_non_nullable
as List<int>,consumedRecipeIds: null == consumedRecipeIds ? _self.consumedRecipeIds : consumedRecipeIds // ignore: cast_nullable_to_non_nullable
as List<int>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsumptionState].
extension ConsumptionStatePatterns on ConsumptionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsumptionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsumptionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsumptionState value)  $default,){
final _that = this;
switch (_that) {
case _ConsumptionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsumptionState value)?  $default,){
final _that = this;
switch (_that) {
case _ConsumptionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConsumptionStatus status,  FoodKind kind,  List<Ingredient> ingredients,  List<Recipe> recipes,  Map<int, int> grams,  Map<int, int> recipeGrams,  List<int> consumedIds,  List<int> consumedRecipeIds,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsumptionState() when $default != null:
return $default(_that.status,_that.kind,_that.ingredients,_that.recipes,_that.grams,_that.recipeGrams,_that.consumedIds,_that.consumedRecipeIds,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConsumptionStatus status,  FoodKind kind,  List<Ingredient> ingredients,  List<Recipe> recipes,  Map<int, int> grams,  Map<int, int> recipeGrams,  List<int> consumedIds,  List<int> consumedRecipeIds,  String query)  $default,) {final _that = this;
switch (_that) {
case _ConsumptionState():
return $default(_that.status,_that.kind,_that.ingredients,_that.recipes,_that.grams,_that.recipeGrams,_that.consumedIds,_that.consumedRecipeIds,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConsumptionStatus status,  FoodKind kind,  List<Ingredient> ingredients,  List<Recipe> recipes,  Map<int, int> grams,  Map<int, int> recipeGrams,  List<int> consumedIds,  List<int> consumedRecipeIds,  String query)?  $default,) {final _that = this;
switch (_that) {
case _ConsumptionState() when $default != null:
return $default(_that.status,_that.kind,_that.ingredients,_that.recipes,_that.grams,_that.recipeGrams,_that.consumedIds,_that.consumedRecipeIds,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _ConsumptionState extends ConsumptionState {
  const _ConsumptionState({this.status = ConsumptionStatus.loading, this.kind = FoodKind.ingredient,  List<Ingredient> ingredients = const <Ingredient>[],  List<Recipe> recipes = const <Recipe>[],  Map<int, int> grams = const <int, int>{},  Map<int, int> recipeGrams = const <int, int>{},  List<int> consumedIds = const <int>[],  List<int> consumedRecipeIds = const <int>[], this.query = ''}): _ingredients = ingredients,_recipes = recipes,_grams = grams,_recipeGrams = recipeGrams,_consumedIds = consumedIds,_consumedRecipeIds = consumedRecipeIds,super._();
  

@override@JsonKey() final  ConsumptionStatus status;
@override@JsonKey() final  FoodKind kind;
 final  List<Ingredient> _ingredients;
@override@JsonKey() List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<Recipe> _recipes;
@override@JsonKey() List<Recipe> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}

 final  Map<int, int> _grams;
@override@JsonKey() Map<int, int> get grams {
  if (_grams is EqualUnmodifiableMapView) return _grams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_grams);
}

 final  Map<int, int> _recipeGrams;
@override@JsonKey() Map<int, int> get recipeGrams {
  if (_recipeGrams is EqualUnmodifiableMapView) return _recipeGrams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_recipeGrams);
}

 final  List<int> _consumedIds;
@override@JsonKey() List<int> get consumedIds {
  if (_consumedIds is EqualUnmodifiableListView) return _consumedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_consumedIds);
}

 final  List<int> _consumedRecipeIds;
@override@JsonKey() List<int> get consumedRecipeIds {
  if (_consumedRecipeIds is EqualUnmodifiableListView) return _consumedRecipeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_consumedRecipeIds);
}

@override@JsonKey() final  String query;

/// Create a copy of ConsumptionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsumptionStateCopyWith<_ConsumptionState> get copyWith => __$ConsumptionStateCopyWithImpl<_ConsumptionState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsumptionState&&(identical(other.status, status) || other.status == status)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.ingredients, _ingredients)&&const DeepCollectionEquality().equals(other.recipes, _recipes)&&const DeepCollectionEquality().equals(other.grams, _grams)&&const DeepCollectionEquality().equals(other.recipeGrams, _recipeGrams)&&const DeepCollectionEquality().equals(other.consumedIds, _consumedIds)&&const DeepCollectionEquality().equals(other.consumedRecipeIds, _consumedRecipeIds)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,kind,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_recipes),const DeepCollectionEquality().hash(_grams),const DeepCollectionEquality().hash(_recipeGrams),const DeepCollectionEquality().hash(_consumedIds),const DeepCollectionEquality().hash(_consumedRecipeIds),query);
}

@override
String toString() {
    return 'ConsumptionState(status: $status, kind: $kind, ingredients: $ingredients, recipes: $recipes, grams: $grams, recipeGrams: $recipeGrams, consumedIds: $consumedIds, consumedRecipeIds: $consumedRecipeIds, query: $query)';
}


}

/// @nodoc
abstract mixin class _$ConsumptionStateCopyWith<$Res> implements $ConsumptionStateCopyWith<$Res> {
  factory _$ConsumptionStateCopyWith(_ConsumptionState value, $Res Function(_ConsumptionState) _then) = __$ConsumptionStateCopyWithImpl;
@override @useResult
$Res call({
 ConsumptionStatus status, FoodKind kind, List<Ingredient> ingredients, List<Recipe> recipes, Map<int, int> grams, Map<int, int> recipeGrams, List<int> consumedIds, List<int> consumedRecipeIds, String query
});




}
/// @nodoc
class __$ConsumptionStateCopyWithImpl<$Res>
    implements _$ConsumptionStateCopyWith<$Res> {
  __$ConsumptionStateCopyWithImpl(this._self, this._then);

  final _ConsumptionState _self;
  final $Res Function(_ConsumptionState) _then;

/// Create a copy of ConsumptionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? kind = null,Object? ingredients = null,Object? recipes = null,Object? grams = null,Object? recipeGrams = null,Object? consumedIds = null,Object? consumedRecipeIds = null,Object? query = null,}) {
  return _then(_ConsumptionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConsumptionStatus,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as FoodKind,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,grams: null == grams ? _self._grams : grams // ignore: cast_nullable_to_non_nullable
as Map<int, int>,recipeGrams: null == recipeGrams ? _self._recipeGrams : recipeGrams // ignore: cast_nullable_to_non_nullable
as Map<int, int>,consumedIds: null == consumedIds ? _self._consumedIds : consumedIds // ignore: cast_nullable_to_non_nullable
as List<int>,consumedRecipeIds: null == consumedRecipeIds ? _self._consumedRecipeIds : consumedRecipeIds // ignore: cast_nullable_to_non_nullable
as List<int>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
