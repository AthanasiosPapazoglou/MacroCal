// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseState {

 ExerciseStatus get status; List<ActivityEntry> get entries;
/// Create a copy of ExerciseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseStateCopyWith<ExerciseState> get copyWith => _$ExerciseStateCopyWithImpl<ExerciseState>(this as ExerciseState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ExerciseState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}


@override
int get hashCode {
  final _this = this as ExerciseState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as ExerciseState;
  return 'ExerciseState(status: ${_this.status}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $ExerciseStateCopyWith<$Res>  {
  factory $ExerciseStateCopyWith(ExerciseState value, $Res Function(ExerciseState) _then) = _$ExerciseStateCopyWithImpl;
@useResult
$Res call({
 ExerciseStatus status, List<ActivityEntry> entries
});




}
/// @nodoc
class _$ExerciseStateCopyWithImpl<$Res>
    implements $ExerciseStateCopyWith<$Res> {
  _$ExerciseStateCopyWithImpl(this._self, this._then);

  final ExerciseState _self;
  final $Res Function(ExerciseState) _then;

/// Create a copy of ExerciseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? entries = null,}) {
  return _then(ExerciseState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExerciseStatus,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<ActivityEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseState].
extension ExerciseStatePatterns on ExerciseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseState value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseState value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ExerciseStatus status,  List<ActivityEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseState() when $default != null:
return $default(_that.status,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ExerciseStatus status,  List<ActivityEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _ExerciseState():
return $default(_that.status,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ExerciseStatus status,  List<ActivityEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseState() when $default != null:
return $default(_that.status,_that.entries);case _:
  return null;

}
}

}

/// @nodoc


class _ExerciseState implements ExerciseState {
  const _ExerciseState({this.status = ExerciseStatus.loading,  List<ActivityEntry> entries = const <ActivityEntry>[]}): _entries = entries;
  

@override@JsonKey() final  ExerciseStatus status;
 final  List<ActivityEntry> _entries;
@override@JsonKey() List<ActivityEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of ExerciseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseStateCopyWith<_ExerciseState> get copyWith => __$ExerciseStateCopyWithImpl<_ExerciseState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.entries, _entries));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'ExerciseState(status: $status, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$ExerciseStateCopyWith<$Res> implements $ExerciseStateCopyWith<$Res> {
  factory _$ExerciseStateCopyWith(_ExerciseState value, $Res Function(_ExerciseState) _then) = __$ExerciseStateCopyWithImpl;
@override @useResult
$Res call({
 ExerciseStatus status, List<ActivityEntry> entries
});




}
/// @nodoc
class __$ExerciseStateCopyWithImpl<$Res>
    implements _$ExerciseStateCopyWith<$Res> {
  __$ExerciseStateCopyWithImpl(this._self, this._then);

  final _ExerciseState _self;
  final $Res Function(_ExerciseState) _then;

/// Create a copy of ExerciseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? entries = null,}) {
  return _then(_ExerciseState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExerciseStatus,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ActivityEntry>,
  ));
}


}

// dart format on
