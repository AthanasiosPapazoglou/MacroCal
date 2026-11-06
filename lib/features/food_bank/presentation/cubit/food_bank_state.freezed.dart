// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_bank_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoodBankState {

 FoodBankStatus get status; List<Ingredient> get ingredients; String get query;
/// Create a copy of FoodBankState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodBankStateCopyWith<FoodBankState> get copyWith => _$FoodBankStateCopyWithImpl<FoodBankState>(this as FoodBankState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FoodBankState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodBankState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients)&&(identical(other.query, _this.query) || other.query == _this.query));
}


@override
int get hashCode {
  final _this = this as FoodBankState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.ingredients),_this.query);
}

@override
String toString() {
  final _this = this as FoodBankState;
  return 'FoodBankState(status: ${_this.status}, ingredients: ${_this.ingredients}, query: ${_this.query})';
}


}

/// @nodoc
abstract mixin class $FoodBankStateCopyWith<$Res>  {
  factory $FoodBankStateCopyWith(FoodBankState value, $Res Function(FoodBankState) _then) = _$FoodBankStateCopyWithImpl;
@useResult
$Res call({
 FoodBankStatus status, List<Ingredient> ingredients, String query
});




}
/// @nodoc
class _$FoodBankStateCopyWithImpl<$Res>
    implements $FoodBankStateCopyWith<$Res> {
  _$FoodBankStateCopyWithImpl(this._self, this._then);

  final FoodBankState _self;
  final $Res Function(FoodBankState) _then;

/// Create a copy of FoodBankState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? ingredients = null,Object? query = null,}) {
  return _then(FoodBankState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FoodBankStatus,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodBankState].
extension FoodBankStatePatterns on FoodBankState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodBankState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodBankState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodBankState value)  $default,){
final _that = this;
switch (_that) {
case _FoodBankState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodBankState value)?  $default,){
final _that = this;
switch (_that) {
case _FoodBankState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FoodBankStatus status,  List<Ingredient> ingredients,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodBankState() when $default != null:
return $default(_that.status,_that.ingredients,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FoodBankStatus status,  List<Ingredient> ingredients,  String query)  $default,) {final _that = this;
switch (_that) {
case _FoodBankState():
return $default(_that.status,_that.ingredients,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FoodBankStatus status,  List<Ingredient> ingredients,  String query)?  $default,) {final _that = this;
switch (_that) {
case _FoodBankState() when $default != null:
return $default(_that.status,_that.ingredients,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _FoodBankState extends FoodBankState {
  const _FoodBankState({this.status = FoodBankStatus.loading,  List<Ingredient> ingredients = const <Ingredient>[], this.query = ''}): _ingredients = ingredients,super._();
  

@override@JsonKey() final  FoodBankStatus status;
 final  List<Ingredient> _ingredients;
@override@JsonKey() List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

@override@JsonKey() final  String query;

/// Create a copy of FoodBankState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodBankStateCopyWith<_FoodBankState> get copyWith => __$FoodBankStateCopyWithImpl<_FoodBankState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodBankState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.ingredients, _ingredients)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_ingredients),query);
}

@override
String toString() {
    return 'FoodBankState(status: $status, ingredients: $ingredients, query: $query)';
}


}

/// @nodoc
abstract mixin class _$FoodBankStateCopyWith<$Res> implements $FoodBankStateCopyWith<$Res> {
  factory _$FoodBankStateCopyWith(_FoodBankState value, $Res Function(_FoodBankState) _then) = __$FoodBankStateCopyWithImpl;
@override @useResult
$Res call({
 FoodBankStatus status, List<Ingredient> ingredients, String query
});




}
/// @nodoc
class __$FoodBankStateCopyWithImpl<$Res>
    implements _$FoodBankStateCopyWith<$Res> {
  __$FoodBankStateCopyWithImpl(this._self, this._then);

  final _FoodBankState _self;
  final $Res Function(_FoodBankState) _then;

/// Create a copy of FoodBankState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? ingredients = null,Object? query = null,}) {
  return _then(_FoodBankState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FoodBankStatus,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
