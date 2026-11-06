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

 ConsumptionStatus get status; List<Ingredient> get ingredients; Map<int, int> get grams; List<int> get consumedIds; String get query;
/// Create a copy of ConsumptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsumptionStateCopyWith<ConsumptionState> get copyWith => _$ConsumptionStateCopyWithImpl<ConsumptionState>(this as ConsumptionState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConsumptionState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsumptionState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients)&&const DeepCollectionEquality().equals(other.grams, _this.grams)&&const DeepCollectionEquality().equals(other.consumedIds, _this.consumedIds)&&(identical(other.query, _this.query) || other.query == _this.query));
}


@override
int get hashCode {
  final _this = this as ConsumptionState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.ingredients),const DeepCollectionEquality().hash(_this.grams),const DeepCollectionEquality().hash(_this.consumedIds),_this.query);
}

@override
String toString() {
  final _this = this as ConsumptionState;
  return 'ConsumptionState(status: ${_this.status}, ingredients: ${_this.ingredients}, grams: ${_this.grams}, consumedIds: ${_this.consumedIds}, query: ${_this.query})';
}


}

/// @nodoc
abstract mixin class $ConsumptionStateCopyWith<$Res>  {
  factory $ConsumptionStateCopyWith(ConsumptionState value, $Res Function(ConsumptionState) _then) = _$ConsumptionStateCopyWithImpl;
@useResult
$Res call({
 ConsumptionStatus status, List<Ingredient> ingredients, Map<int, int> grams, List<int> consumedIds, String query
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? ingredients = null,Object? grams = null,Object? consumedIds = null,Object? query = null,}) {
  return _then(ConsumptionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConsumptionStatus,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,grams: null == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as Map<int, int>,consumedIds: null == consumedIds ? _self.consumedIds : consumedIds // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConsumptionStatus status,  List<Ingredient> ingredients,  Map<int, int> grams,  List<int> consumedIds,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsumptionState() when $default != null:
return $default(_that.status,_that.ingredients,_that.grams,_that.consumedIds,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConsumptionStatus status,  List<Ingredient> ingredients,  Map<int, int> grams,  List<int> consumedIds,  String query)  $default,) {final _that = this;
switch (_that) {
case _ConsumptionState():
return $default(_that.status,_that.ingredients,_that.grams,_that.consumedIds,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConsumptionStatus status,  List<Ingredient> ingredients,  Map<int, int> grams,  List<int> consumedIds,  String query)?  $default,) {final _that = this;
switch (_that) {
case _ConsumptionState() when $default != null:
return $default(_that.status,_that.ingredients,_that.grams,_that.consumedIds,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _ConsumptionState extends ConsumptionState {
  const _ConsumptionState({this.status = ConsumptionStatus.loading,  List<Ingredient> ingredients = const <Ingredient>[],  Map<int, int> grams = const <int, int>{},  List<int> consumedIds = const <int>[], this.query = ''}): _ingredients = ingredients,_grams = grams,_consumedIds = consumedIds,super._();
  

@override@JsonKey() final  ConsumptionStatus status;
 final  List<Ingredient> _ingredients;
@override@JsonKey() List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  Map<int, int> _grams;
@override@JsonKey() Map<int, int> get grams {
  if (_grams is EqualUnmodifiableMapView) return _grams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_grams);
}

 final  List<int> _consumedIds;
@override@JsonKey() List<int> get consumedIds {
  if (_consumedIds is EqualUnmodifiableListView) return _consumedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_consumedIds);
}

@override@JsonKey() final  String query;

/// Create a copy of ConsumptionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsumptionStateCopyWith<_ConsumptionState> get copyWith => __$ConsumptionStateCopyWithImpl<_ConsumptionState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsumptionState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.ingredients, _ingredients)&&const DeepCollectionEquality().equals(other.grams, _grams)&&const DeepCollectionEquality().equals(other.consumedIds, _consumedIds)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_grams),const DeepCollectionEquality().hash(_consumedIds),query);
}

@override
String toString() {
    return 'ConsumptionState(status: $status, ingredients: $ingredients, grams: $grams, consumedIds: $consumedIds, query: $query)';
}


}

/// @nodoc
abstract mixin class _$ConsumptionStateCopyWith<$Res> implements $ConsumptionStateCopyWith<$Res> {
  factory _$ConsumptionStateCopyWith(_ConsumptionState value, $Res Function(_ConsumptionState) _then) = __$ConsumptionStateCopyWithImpl;
@override @useResult
$Res call({
 ConsumptionStatus status, List<Ingredient> ingredients, Map<int, int> grams, List<int> consumedIds, String query
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? ingredients = null,Object? grams = null,Object? consumedIds = null,Object? query = null,}) {
  return _then(_ConsumptionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConsumptionStatus,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,grams: null == grams ? _self._grams : grams // ignore: cast_nullable_to_non_nullable
as Map<int, int>,consumedIds: null == consumedIds ? _self._consumedIds : consumedIds // ignore: cast_nullable_to_non_nullable
as List<int>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
