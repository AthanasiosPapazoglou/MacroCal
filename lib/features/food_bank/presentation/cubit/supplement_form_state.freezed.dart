// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplement_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplementFormState {

 SupplementFormStatus get status; String get name; SupplementUnit get unit; Map<Micronutrient, String> get microValues;
/// Create a copy of SupplementFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplementFormStateCopyWith<SupplementFormState> get copyWith => _$SupplementFormStateCopyWithImpl<SupplementFormState>(this as SupplementFormState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SupplementFormState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplementFormState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&const DeepCollectionEquality().equals(other.microValues, _this.microValues));
}


@override
int get hashCode {
  final _this = this as SupplementFormState;
  return Object.hash(runtimeType,_this.status,_this.name,_this.unit,const DeepCollectionEquality().hash(_this.microValues));
}

@override
String toString() {
  final _this = this as SupplementFormState;
  return 'SupplementFormState(status: ${_this.status}, name: ${_this.name}, unit: ${_this.unit}, microValues: ${_this.microValues})';
}


}

/// @nodoc
abstract mixin class $SupplementFormStateCopyWith<$Res>  {
  factory $SupplementFormStateCopyWith(SupplementFormState value, $Res Function(SupplementFormState) _then) = _$SupplementFormStateCopyWithImpl;
@useResult
$Res call({
 SupplementFormStatus status, String name, SupplementUnit unit, Map<Micronutrient, String> microValues
});




}
/// @nodoc
class _$SupplementFormStateCopyWithImpl<$Res>
    implements $SupplementFormStateCopyWith<$Res> {
  _$SupplementFormStateCopyWithImpl(this._self, this._then);

  final SupplementFormState _self;
  final $Res Function(SupplementFormState) _then;

/// Create a copy of SupplementFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? name = null,Object? unit = null,Object? microValues = null,}) {
  return _then(SupplementFormState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SupplementFormStatus,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as SupplementUnit,microValues: null == microValues ? _self.microValues : microValues // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplementFormState].
extension SupplementFormStatePatterns on SupplementFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplementFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplementFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplementFormState value)  $default,){
final _that = this;
switch (_that) {
case _SupplementFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplementFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplementFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SupplementFormStatus status,  String name,  SupplementUnit unit,  Map<Micronutrient, String> microValues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplementFormState() when $default != null:
return $default(_that.status,_that.name,_that.unit,_that.microValues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SupplementFormStatus status,  String name,  SupplementUnit unit,  Map<Micronutrient, String> microValues)  $default,) {final _that = this;
switch (_that) {
case _SupplementFormState():
return $default(_that.status,_that.name,_that.unit,_that.microValues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SupplementFormStatus status,  String name,  SupplementUnit unit,  Map<Micronutrient, String> microValues)?  $default,) {final _that = this;
switch (_that) {
case _SupplementFormState() when $default != null:
return $default(_that.status,_that.name,_that.unit,_that.microValues);case _:
  return null;

}
}

}

/// @nodoc


class _SupplementFormState implements SupplementFormState {
  const _SupplementFormState({this.status = SupplementFormStatus.loading, this.name = '', this.unit = SupplementUnit.tablet,  Map<Micronutrient, String> microValues = const <Micronutrient, String>{}}): _microValues = microValues;
  

@override@JsonKey() final  SupplementFormStatus status;
@override@JsonKey() final  String name;
@override@JsonKey() final  SupplementUnit unit;
 final  Map<Micronutrient, String> _microValues;
@override@JsonKey() Map<Micronutrient, String> get microValues {
  if (_microValues is EqualUnmodifiableMapView) return _microValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_microValues);
}


/// Create a copy of SupplementFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplementFormStateCopyWith<_SupplementFormState> get copyWith => __$SupplementFormStateCopyWithImpl<_SupplementFormState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplementFormState&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&const DeepCollectionEquality().equals(other.microValues, _microValues));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,name,unit,const DeepCollectionEquality().hash(_microValues));
}

@override
String toString() {
    return 'SupplementFormState(status: $status, name: $name, unit: $unit, microValues: $microValues)';
}


}

/// @nodoc
abstract mixin class _$SupplementFormStateCopyWith<$Res> implements $SupplementFormStateCopyWith<$Res> {
  factory _$SupplementFormStateCopyWith(_SupplementFormState value, $Res Function(_SupplementFormState) _then) = __$SupplementFormStateCopyWithImpl;
@override @useResult
$Res call({
 SupplementFormStatus status, String name, SupplementUnit unit, Map<Micronutrient, String> microValues
});




}
/// @nodoc
class __$SupplementFormStateCopyWithImpl<$Res>
    implements _$SupplementFormStateCopyWith<$Res> {
  __$SupplementFormStateCopyWithImpl(this._self, this._then);

  final _SupplementFormState _self;
  final $Res Function(_SupplementFormState) _then;

/// Create a copy of SupplementFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? name = null,Object? unit = null,Object? microValues = null,}) {
  return _then(_SupplementFormState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SupplementFormStatus,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as SupplementUnit,microValues: null == microValues ? _self._microValues : microValues // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, String>,
  ));
}


}

// dart format on
