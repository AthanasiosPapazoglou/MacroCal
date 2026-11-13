// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeDetailsState {

 RecipeDetailsStatus get status; Recipe? get recipe;
/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDetailsStateCopyWith<RecipeDetailsState> get copyWith => _$RecipeDetailsStateCopyWithImpl<RecipeDetailsState>(this as RecipeDetailsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RecipeDetailsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDetailsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.recipe, _this.recipe) || other.recipe == _this.recipe));
}


@override
int get hashCode {
  final _this = this as RecipeDetailsState;
  return Object.hash(runtimeType,_this.status,_this.recipe);
}

@override
String toString() {
  final _this = this as RecipeDetailsState;
  return 'RecipeDetailsState(status: ${_this.status}, recipe: ${_this.recipe})';
}


}

/// @nodoc
abstract mixin class $RecipeDetailsStateCopyWith<$Res>  {
  factory $RecipeDetailsStateCopyWith(RecipeDetailsState value, $Res Function(RecipeDetailsState) _then) = _$RecipeDetailsStateCopyWithImpl;
@useResult
$Res call({
 RecipeDetailsStatus status, Recipe? recipe
});


$RecipeCopyWith<$Res>? get recipe;

}
/// @nodoc
class _$RecipeDetailsStateCopyWithImpl<$Res>
    implements $RecipeDetailsStateCopyWith<$Res> {
  _$RecipeDetailsStateCopyWithImpl(this._self, this._then);

  final RecipeDetailsState _self;
  final $Res Function(RecipeDetailsState) _then;

/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? recipe = freezed,}) {
  return _then(RecipeDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecipeDetailsStatus,recipe: freezed == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe?,
  ));
}
/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res>? get recipe {
    if (_self.recipe == null) {
    return null;
  }

  return $RecipeCopyWith<$Res>(_self.recipe!, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecipeDetailsState].
extension RecipeDetailsStatePatterns on RecipeDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _RecipeDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecipeDetailsStatus status,  Recipe? recipe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeDetailsState() when $default != null:
return $default(_that.status,_that.recipe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecipeDetailsStatus status,  Recipe? recipe)  $default,) {final _that = this;
switch (_that) {
case _RecipeDetailsState():
return $default(_that.status,_that.recipe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecipeDetailsStatus status,  Recipe? recipe)?  $default,) {final _that = this;
switch (_that) {
case _RecipeDetailsState() when $default != null:
return $default(_that.status,_that.recipe);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeDetailsState implements RecipeDetailsState {
  const _RecipeDetailsState({this.status = RecipeDetailsStatus.loading, this.recipe});
  

@override@JsonKey() final  RecipeDetailsStatus status;
@override final  Recipe? recipe;

/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDetailsStateCopyWith<_RecipeDetailsState> get copyWith => __$RecipeDetailsStateCopyWithImpl<_RecipeDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.recipe, recipe) || other.recipe == recipe));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,recipe);
}

@override
String toString() {
    return 'RecipeDetailsState(status: $status, recipe: $recipe)';
}


}

/// @nodoc
abstract mixin class _$RecipeDetailsStateCopyWith<$Res> implements $RecipeDetailsStateCopyWith<$Res> {
  factory _$RecipeDetailsStateCopyWith(_RecipeDetailsState value, $Res Function(_RecipeDetailsState) _then) = __$RecipeDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 RecipeDetailsStatus status, Recipe? recipe
});


@override $RecipeCopyWith<$Res>? get recipe;

}
/// @nodoc
class __$RecipeDetailsStateCopyWithImpl<$Res>
    implements _$RecipeDetailsStateCopyWith<$Res> {
  __$RecipeDetailsStateCopyWithImpl(this._self, this._then);

  final _RecipeDetailsState _self;
  final $Res Function(_RecipeDetailsState) _then;

/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? recipe = freezed,}) {
  return _then(_RecipeDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecipeDetailsStatus,recipe: freezed == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe?,
  ));
}

/// Create a copy of RecipeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res>? get recipe {
    if (_self.recipe == null) {
    return null;
  }

  return $RecipeCopyWith<$Res>(_self.recipe!, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
