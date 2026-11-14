// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IngredientDetailsState {

 IngredientDetailsStatus get status; Ingredient? get ingredient; List<String> get recipeNames; bool get microcalEnabled;
/// Create a copy of IngredientDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientDetailsStateCopyWith<IngredientDetailsState> get copyWith => _$IngredientDetailsStateCopyWithImpl<IngredientDetailsState>(this as IngredientDetailsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as IngredientDetailsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientDetailsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.ingredient, _this.ingredient) || other.ingredient == _this.ingredient)&&const DeepCollectionEquality().equals(other.recipeNames, _this.recipeNames)&&(identical(other.microcalEnabled, _this.microcalEnabled) || other.microcalEnabled == _this.microcalEnabled));
}


@override
int get hashCode {
  final _this = this as IngredientDetailsState;
  return Object.hash(runtimeType,_this.status,_this.ingredient,const DeepCollectionEquality().hash(_this.recipeNames),_this.microcalEnabled);
}

@override
String toString() {
  final _this = this as IngredientDetailsState;
  return 'IngredientDetailsState(status: ${_this.status}, ingredient: ${_this.ingredient}, recipeNames: ${_this.recipeNames}, microcalEnabled: ${_this.microcalEnabled})';
}


}

/// @nodoc
abstract mixin class $IngredientDetailsStateCopyWith<$Res>  {
  factory $IngredientDetailsStateCopyWith(IngredientDetailsState value, $Res Function(IngredientDetailsState) _then) = _$IngredientDetailsStateCopyWithImpl;
@useResult
$Res call({
 IngredientDetailsStatus status, Ingredient? ingredient, List<String> recipeNames, bool microcalEnabled
});


$IngredientCopyWith<$Res>? get ingredient;

}
/// @nodoc
class _$IngredientDetailsStateCopyWithImpl<$Res>
    implements $IngredientDetailsStateCopyWith<$Res> {
  _$IngredientDetailsStateCopyWithImpl(this._self, this._then);

  final IngredientDetailsState _self;
  final $Res Function(IngredientDetailsState) _then;

/// Create a copy of IngredientDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? ingredient = freezed,Object? recipeNames = null,Object? microcalEnabled = null,}) {
  return _then(IngredientDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IngredientDetailsStatus,ingredient: freezed == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient?,recipeNames: null == recipeNames ? _self.recipeNames : recipeNames // ignore: cast_nullable_to_non_nullable
as List<String>,microcalEnabled: null == microcalEnabled ? _self.microcalEnabled : microcalEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of IngredientDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res>? get ingredient {
    if (_self.ingredient == null) {
    return null;
  }

  return $IngredientCopyWith<$Res>(_self.ingredient!, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}


/// Adds pattern-matching-related methods to [IngredientDetailsState].
extension IngredientDetailsStatePatterns on IngredientDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _IngredientDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IngredientDetailsStatus status,  Ingredient? ingredient,  List<String> recipeNames,  bool microcalEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientDetailsState() when $default != null:
return $default(_that.status,_that.ingredient,_that.recipeNames,_that.microcalEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IngredientDetailsStatus status,  Ingredient? ingredient,  List<String> recipeNames,  bool microcalEnabled)  $default,) {final _that = this;
switch (_that) {
case _IngredientDetailsState():
return $default(_that.status,_that.ingredient,_that.recipeNames,_that.microcalEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IngredientDetailsStatus status,  Ingredient? ingredient,  List<String> recipeNames,  bool microcalEnabled)?  $default,) {final _that = this;
switch (_that) {
case _IngredientDetailsState() when $default != null:
return $default(_that.status,_that.ingredient,_that.recipeNames,_that.microcalEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _IngredientDetailsState implements IngredientDetailsState {
  const _IngredientDetailsState({this.status = IngredientDetailsStatus.loading, this.ingredient,  List<String> recipeNames = const <String>[], this.microcalEnabled = false}): _recipeNames = recipeNames;
  

@override@JsonKey() final  IngredientDetailsStatus status;
@override final  Ingredient? ingredient;
 final  List<String> _recipeNames;
@override@JsonKey() List<String> get recipeNames {
  if (_recipeNames is EqualUnmodifiableListView) return _recipeNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipeNames);
}

@override@JsonKey() final  bool microcalEnabled;

/// Create a copy of IngredientDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientDetailsStateCopyWith<_IngredientDetailsState> get copyWith => __$IngredientDetailsStateCopyWithImpl<_IngredientDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&const DeepCollectionEquality().equals(other.recipeNames, _recipeNames)&&(identical(other.microcalEnabled, microcalEnabled) || other.microcalEnabled == microcalEnabled));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,ingredient,const DeepCollectionEquality().hash(_recipeNames),microcalEnabled);
}

@override
String toString() {
    return 'IngredientDetailsState(status: $status, ingredient: $ingredient, recipeNames: $recipeNames, microcalEnabled: $microcalEnabled)';
}


}

/// @nodoc
abstract mixin class _$IngredientDetailsStateCopyWith<$Res> implements $IngredientDetailsStateCopyWith<$Res> {
  factory _$IngredientDetailsStateCopyWith(_IngredientDetailsState value, $Res Function(_IngredientDetailsState) _then) = __$IngredientDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 IngredientDetailsStatus status, Ingredient? ingredient, List<String> recipeNames, bool microcalEnabled
});


@override $IngredientCopyWith<$Res>? get ingredient;

}
/// @nodoc
class __$IngredientDetailsStateCopyWithImpl<$Res>
    implements _$IngredientDetailsStateCopyWith<$Res> {
  __$IngredientDetailsStateCopyWithImpl(this._self, this._then);

  final _IngredientDetailsState _self;
  final $Res Function(_IngredientDetailsState) _then;

/// Create a copy of IngredientDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? ingredient = freezed,Object? recipeNames = null,Object? microcalEnabled = null,}) {
  return _then(_IngredientDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IngredientDetailsStatus,ingredient: freezed == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient?,recipeNames: null == recipeNames ? _self._recipeNames : recipeNames // ignore: cast_nullable_to_non_nullable
as List<String>,microcalEnabled: null == microcalEnabled ? _self.microcalEnabled : microcalEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of IngredientDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res>? get ingredient {
    if (_self.ingredient == null) {
    return null;
  }

  return $IngredientCopyWith<$Res>(_self.ingredient!, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}

// dart format on
