// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IngredientFormState {

 IngredientFormStatus get status; Map<IngredientField, String> get values; Map<IngredientField, String> get scannedValues; Map<Micronutrient, String> get microValues; Map<Micronutrient, String> get scannedMicroValues; bool get showMicros; LookupOutcome? get lookupOutcome;
/// Create a copy of IngredientFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientFormStateCopyWith<IngredientFormState> get copyWith => _$IngredientFormStateCopyWithImpl<IngredientFormState>(this as IngredientFormState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as IngredientFormState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientFormState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.values, _this.values)&&const DeepCollectionEquality().equals(other.scannedValues, _this.scannedValues)&&const DeepCollectionEquality().equals(other.microValues, _this.microValues)&&const DeepCollectionEquality().equals(other.scannedMicroValues, _this.scannedMicroValues)&&(identical(other.showMicros, _this.showMicros) || other.showMicros == _this.showMicros)&&(identical(other.lookupOutcome, _this.lookupOutcome) || other.lookupOutcome == _this.lookupOutcome));
}


@override
int get hashCode {
  final _this = this as IngredientFormState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.values),const DeepCollectionEquality().hash(_this.scannedValues),const DeepCollectionEquality().hash(_this.microValues),const DeepCollectionEquality().hash(_this.scannedMicroValues),_this.showMicros,_this.lookupOutcome);
}

@override
String toString() {
  final _this = this as IngredientFormState;
  return 'IngredientFormState(status: ${_this.status}, values: ${_this.values}, scannedValues: ${_this.scannedValues}, microValues: ${_this.microValues}, scannedMicroValues: ${_this.scannedMicroValues}, showMicros: ${_this.showMicros}, lookupOutcome: ${_this.lookupOutcome})';
}


}

/// @nodoc
abstract mixin class $IngredientFormStateCopyWith<$Res>  {
  factory $IngredientFormStateCopyWith(IngredientFormState value, $Res Function(IngredientFormState) _then) = _$IngredientFormStateCopyWithImpl;
@useResult
$Res call({
 IngredientFormStatus status, Map<IngredientField, String> values, Map<IngredientField, String> scannedValues, Map<Micronutrient, String> microValues, Map<Micronutrient, String> scannedMicroValues, bool showMicros, LookupOutcome? lookupOutcome
});




}
/// @nodoc
class _$IngredientFormStateCopyWithImpl<$Res>
    implements $IngredientFormStateCopyWith<$Res> {
  _$IngredientFormStateCopyWithImpl(this._self, this._then);

  final IngredientFormState _self;
  final $Res Function(IngredientFormState) _then;

/// Create a copy of IngredientFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? values = null,Object? scannedValues = null,Object? microValues = null,Object? scannedMicroValues = null,Object? showMicros = null,Object? lookupOutcome = freezed,}) {
  return _then(IngredientFormState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IngredientFormStatus,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as Map<IngredientField, String>,scannedValues: null == scannedValues ? _self.scannedValues : scannedValues // ignore: cast_nullable_to_non_nullable
as Map<IngredientField, String>,microValues: null == microValues ? _self.microValues : microValues // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, String>,scannedMicroValues: null == scannedMicroValues ? _self.scannedMicroValues : scannedMicroValues // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, String>,showMicros: null == showMicros ? _self.showMicros : showMicros // ignore: cast_nullable_to_non_nullable
as bool,lookupOutcome: freezed == lookupOutcome ? _self.lookupOutcome : lookupOutcome // ignore: cast_nullable_to_non_nullable
as LookupOutcome?,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientFormState].
extension IngredientFormStatePatterns on IngredientFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientFormState value)  $default,){
final _that = this;
switch (_that) {
case _IngredientFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientFormState value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IngredientFormStatus status,  Map<IngredientField, String> values,  Map<IngredientField, String> scannedValues,  Map<Micronutrient, String> microValues,  Map<Micronutrient, String> scannedMicroValues,  bool showMicros,  LookupOutcome? lookupOutcome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientFormState() when $default != null:
return $default(_that.status,_that.values,_that.scannedValues,_that.microValues,_that.scannedMicroValues,_that.showMicros,_that.lookupOutcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IngredientFormStatus status,  Map<IngredientField, String> values,  Map<IngredientField, String> scannedValues,  Map<Micronutrient, String> microValues,  Map<Micronutrient, String> scannedMicroValues,  bool showMicros,  LookupOutcome? lookupOutcome)  $default,) {final _that = this;
switch (_that) {
case _IngredientFormState():
return $default(_that.status,_that.values,_that.scannedValues,_that.microValues,_that.scannedMicroValues,_that.showMicros,_that.lookupOutcome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IngredientFormStatus status,  Map<IngredientField, String> values,  Map<IngredientField, String> scannedValues,  Map<Micronutrient, String> microValues,  Map<Micronutrient, String> scannedMicroValues,  bool showMicros,  LookupOutcome? lookupOutcome)?  $default,) {final _that = this;
switch (_that) {
case _IngredientFormState() when $default != null:
return $default(_that.status,_that.values,_that.scannedValues,_that.microValues,_that.scannedMicroValues,_that.showMicros,_that.lookupOutcome);case _:
  return null;

}
}

}

/// @nodoc


class _IngredientFormState implements IngredientFormState {
  const _IngredientFormState({this.status = IngredientFormStatus.loading,  Map<IngredientField, String> values = const <IngredientField, String>{},  Map<IngredientField, String> scannedValues = const <IngredientField, String>{},  Map<Micronutrient, String> microValues = const <Micronutrient, String>{},  Map<Micronutrient, String> scannedMicroValues = const <Micronutrient, String>{}, this.showMicros = false, this.lookupOutcome}): _values = values,_scannedValues = scannedValues,_microValues = microValues,_scannedMicroValues = scannedMicroValues;
  

@override@JsonKey() final  IngredientFormStatus status;
 final  Map<IngredientField, String> _values;
@override@JsonKey() Map<IngredientField, String> get values {
  if (_values is EqualUnmodifiableMapView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_values);
}

 final  Map<IngredientField, String> _scannedValues;
@override@JsonKey() Map<IngredientField, String> get scannedValues {
  if (_scannedValues is EqualUnmodifiableMapView) return _scannedValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_scannedValues);
}

 final  Map<Micronutrient, String> _microValues;
@override@JsonKey() Map<Micronutrient, String> get microValues {
  if (_microValues is EqualUnmodifiableMapView) return _microValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_microValues);
}

 final  Map<Micronutrient, String> _scannedMicroValues;
@override@JsonKey() Map<Micronutrient, String> get scannedMicroValues {
  if (_scannedMicroValues is EqualUnmodifiableMapView) return _scannedMicroValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_scannedMicroValues);
}

@override@JsonKey() final  bool showMicros;
@override final  LookupOutcome? lookupOutcome;

/// Create a copy of IngredientFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientFormStateCopyWith<_IngredientFormState> get copyWith => __$IngredientFormStateCopyWithImpl<_IngredientFormState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientFormState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.values, _values)&&const DeepCollectionEquality().equals(other.scannedValues, _scannedValues)&&const DeepCollectionEquality().equals(other.microValues, _microValues)&&const DeepCollectionEquality().equals(other.scannedMicroValues, _scannedMicroValues)&&(identical(other.showMicros, showMicros) || other.showMicros == showMicros)&&(identical(other.lookupOutcome, lookupOutcome) || other.lookupOutcome == lookupOutcome));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_values),const DeepCollectionEquality().hash(_scannedValues),const DeepCollectionEquality().hash(_microValues),const DeepCollectionEquality().hash(_scannedMicroValues),showMicros,lookupOutcome);
}

@override
String toString() {
    return 'IngredientFormState(status: $status, values: $values, scannedValues: $scannedValues, microValues: $microValues, scannedMicroValues: $scannedMicroValues, showMicros: $showMicros, lookupOutcome: $lookupOutcome)';
}


}

/// @nodoc
abstract mixin class _$IngredientFormStateCopyWith<$Res> implements $IngredientFormStateCopyWith<$Res> {
  factory _$IngredientFormStateCopyWith(_IngredientFormState value, $Res Function(_IngredientFormState) _then) = __$IngredientFormStateCopyWithImpl;
@override @useResult
$Res call({
 IngredientFormStatus status, Map<IngredientField, String> values, Map<IngredientField, String> scannedValues, Map<Micronutrient, String> microValues, Map<Micronutrient, String> scannedMicroValues, bool showMicros, LookupOutcome? lookupOutcome
});




}
/// @nodoc
class __$IngredientFormStateCopyWithImpl<$Res>
    implements _$IngredientFormStateCopyWith<$Res> {
  __$IngredientFormStateCopyWithImpl(this._self, this._then);

  final _IngredientFormState _self;
  final $Res Function(_IngredientFormState) _then;

/// Create a copy of IngredientFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? values = null,Object? scannedValues = null,Object? microValues = null,Object? scannedMicroValues = null,Object? showMicros = null,Object? lookupOutcome = freezed,}) {
  return _then(_IngredientFormState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IngredientFormStatus,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as Map<IngredientField, String>,scannedValues: null == scannedValues ? _self._scannedValues : scannedValues // ignore: cast_nullable_to_non_nullable
as Map<IngredientField, String>,microValues: null == microValues ? _self._microValues : microValues // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, String>,scannedMicroValues: null == scannedMicroValues ? _self._scannedMicroValues : scannedMicroValues // ignore: cast_nullable_to_non_nullable
as Map<Micronutrient, String>,showMicros: null == showMicros ? _self.showMicros : showMicros // ignore: cast_nullable_to_non_nullable
as bool,lookupOutcome: freezed == lookupOutcome ? _self.lookupOutcome : lookupOutcome // ignore: cast_nullable_to_non_nullable
as LookupOutcome?,
  ));
}


}

// dart format on
