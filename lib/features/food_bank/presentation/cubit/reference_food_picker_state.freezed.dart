// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_food_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReferenceFoodPickerState {

 ReferenceFoodPickerStatus get status; String get query; List<ReferenceFood> get results;
/// Create a copy of ReferenceFoodPickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceFoodPickerStateCopyWith<ReferenceFoodPickerState> get copyWith => _$ReferenceFoodPickerStateCopyWithImpl<ReferenceFoodPickerState>(this as ReferenceFoodPickerState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReferenceFoodPickerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceFoodPickerState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.query, _this.query) || other.query == _this.query)&&const DeepCollectionEquality().equals(other.results, _this.results));
}


@override
int get hashCode {
  final _this = this as ReferenceFoodPickerState;
  return Object.hash(runtimeType,_this.status,_this.query,const DeepCollectionEquality().hash(_this.results));
}

@override
String toString() {
  final _this = this as ReferenceFoodPickerState;
  return 'ReferenceFoodPickerState(status: ${_this.status}, query: ${_this.query}, results: ${_this.results})';
}


}

/// @nodoc
abstract mixin class $ReferenceFoodPickerStateCopyWith<$Res>  {
  factory $ReferenceFoodPickerStateCopyWith(ReferenceFoodPickerState value, $Res Function(ReferenceFoodPickerState) _then) = _$ReferenceFoodPickerStateCopyWithImpl;
@useResult
$Res call({
 ReferenceFoodPickerStatus status, String query, List<ReferenceFood> results
});




}
/// @nodoc
class _$ReferenceFoodPickerStateCopyWithImpl<$Res>
    implements $ReferenceFoodPickerStateCopyWith<$Res> {
  _$ReferenceFoodPickerStateCopyWithImpl(this._self, this._then);

  final ReferenceFoodPickerState _self;
  final $Res Function(ReferenceFoodPickerState) _then;

/// Create a copy of ReferenceFoodPickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? query = null,Object? results = null,}) {
  return _then(ReferenceFoodPickerState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReferenceFoodPickerStatus,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ReferenceFood>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferenceFoodPickerState].
extension ReferenceFoodPickerStatePatterns on ReferenceFoodPickerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceFoodPickerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceFoodPickerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceFoodPickerState value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceFoodPickerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceFoodPickerState value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceFoodPickerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReferenceFoodPickerStatus status,  String query,  List<ReferenceFood> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceFoodPickerState() when $default != null:
return $default(_that.status,_that.query,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReferenceFoodPickerStatus status,  String query,  List<ReferenceFood> results)  $default,) {final _that = this;
switch (_that) {
case _ReferenceFoodPickerState():
return $default(_that.status,_that.query,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReferenceFoodPickerStatus status,  String query,  List<ReferenceFood> results)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceFoodPickerState() when $default != null:
return $default(_that.status,_that.query,_that.results);case _:
  return null;

}
}

}

/// @nodoc


class _ReferenceFoodPickerState implements ReferenceFoodPickerState {
  const _ReferenceFoodPickerState({this.status = ReferenceFoodPickerStatus.loading, this.query = '',  List<ReferenceFood> results = const <ReferenceFood>[]}): _results = results;
  

@override@JsonKey() final  ReferenceFoodPickerStatus status;
@override@JsonKey() final  String query;
 final  List<ReferenceFood> _results;
@override@JsonKey() List<ReferenceFood> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ReferenceFoodPickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceFoodPickerStateCopyWith<_ReferenceFoodPickerState> get copyWith => __$ReferenceFoodPickerStateCopyWithImpl<_ReferenceFoodPickerState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceFoodPickerState&&(identical(other.status, status) || other.status == status)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.results, _results));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,query,const DeepCollectionEquality().hash(_results));
}

@override
String toString() {
    return 'ReferenceFoodPickerState(status: $status, query: $query, results: $results)';
}


}

/// @nodoc
abstract mixin class _$ReferenceFoodPickerStateCopyWith<$Res> implements $ReferenceFoodPickerStateCopyWith<$Res> {
  factory _$ReferenceFoodPickerStateCopyWith(_ReferenceFoodPickerState value, $Res Function(_ReferenceFoodPickerState) _then) = __$ReferenceFoodPickerStateCopyWithImpl;
@override @useResult
$Res call({
 ReferenceFoodPickerStatus status, String query, List<ReferenceFood> results
});




}
/// @nodoc
class __$ReferenceFoodPickerStateCopyWithImpl<$Res>
    implements _$ReferenceFoodPickerStateCopyWith<$Res> {
  __$ReferenceFoodPickerStateCopyWithImpl(this._self, this._then);

  final _ReferenceFoodPickerState _self;
  final $Res Function(_ReferenceFoodPickerState) _then;

/// Create a copy of ReferenceFoodPickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? query = null,Object? results = null,}) {
  return _then(_ReferenceFoodPickerState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReferenceFoodPickerStatus,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ReferenceFood>,
  ));
}


}

// dart format on
