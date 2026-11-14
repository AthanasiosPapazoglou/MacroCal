// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplement_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplementDetailsState {

 SupplementDetailsStatus get status; Supplement? get supplement;
/// Create a copy of SupplementDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplementDetailsStateCopyWith<SupplementDetailsState> get copyWith => _$SupplementDetailsStateCopyWithImpl<SupplementDetailsState>(this as SupplementDetailsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SupplementDetailsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplementDetailsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.supplement, _this.supplement) || other.supplement == _this.supplement));
}


@override
int get hashCode {
  final _this = this as SupplementDetailsState;
  return Object.hash(runtimeType,_this.status,_this.supplement);
}

@override
String toString() {
  final _this = this as SupplementDetailsState;
  return 'SupplementDetailsState(status: ${_this.status}, supplement: ${_this.supplement})';
}


}

/// @nodoc
abstract mixin class $SupplementDetailsStateCopyWith<$Res>  {
  factory $SupplementDetailsStateCopyWith(SupplementDetailsState value, $Res Function(SupplementDetailsState) _then) = _$SupplementDetailsStateCopyWithImpl;
@useResult
$Res call({
 SupplementDetailsStatus status, Supplement? supplement
});


$SupplementCopyWith<$Res>? get supplement;

}
/// @nodoc
class _$SupplementDetailsStateCopyWithImpl<$Res>
    implements $SupplementDetailsStateCopyWith<$Res> {
  _$SupplementDetailsStateCopyWithImpl(this._self, this._then);

  final SupplementDetailsState _self;
  final $Res Function(SupplementDetailsState) _then;

/// Create a copy of SupplementDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? supplement = freezed,}) {
  return _then(SupplementDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SupplementDetailsStatus,supplement: freezed == supplement ? _self.supplement : supplement // ignore: cast_nullable_to_non_nullable
as Supplement?,
  ));
}
/// Create a copy of SupplementDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplementCopyWith<$Res>? get supplement {
    if (_self.supplement == null) {
    return null;
  }

  return $SupplementCopyWith<$Res>(_self.supplement!, (value) {
    return _then(_self.copyWith(supplement: value));
  });
}
}


/// Adds pattern-matching-related methods to [SupplementDetailsState].
extension SupplementDetailsStatePatterns on SupplementDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplementDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplementDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplementDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _SupplementDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplementDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplementDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SupplementDetailsStatus status,  Supplement? supplement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplementDetailsState() when $default != null:
return $default(_that.status,_that.supplement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SupplementDetailsStatus status,  Supplement? supplement)  $default,) {final _that = this;
switch (_that) {
case _SupplementDetailsState():
return $default(_that.status,_that.supplement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SupplementDetailsStatus status,  Supplement? supplement)?  $default,) {final _that = this;
switch (_that) {
case _SupplementDetailsState() when $default != null:
return $default(_that.status,_that.supplement);case _:
  return null;

}
}

}

/// @nodoc


class _SupplementDetailsState implements SupplementDetailsState {
  const _SupplementDetailsState({this.status = SupplementDetailsStatus.loading, this.supplement});
  

@override@JsonKey() final  SupplementDetailsStatus status;
@override final  Supplement? supplement;

/// Create a copy of SupplementDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplementDetailsStateCopyWith<_SupplementDetailsState> get copyWith => __$SupplementDetailsStateCopyWithImpl<_SupplementDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplementDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.supplement, supplement) || other.supplement == supplement));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,supplement);
}

@override
String toString() {
    return 'SupplementDetailsState(status: $status, supplement: $supplement)';
}


}

/// @nodoc
abstract mixin class _$SupplementDetailsStateCopyWith<$Res> implements $SupplementDetailsStateCopyWith<$Res> {
  factory _$SupplementDetailsStateCopyWith(_SupplementDetailsState value, $Res Function(_SupplementDetailsState) _then) = __$SupplementDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 SupplementDetailsStatus status, Supplement? supplement
});


@override $SupplementCopyWith<$Res>? get supplement;

}
/// @nodoc
class __$SupplementDetailsStateCopyWithImpl<$Res>
    implements _$SupplementDetailsStateCopyWith<$Res> {
  __$SupplementDetailsStateCopyWithImpl(this._self, this._then);

  final _SupplementDetailsState _self;
  final $Res Function(_SupplementDetailsState) _then;

/// Create a copy of SupplementDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? supplement = freezed,}) {
  return _then(_SupplementDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SupplementDetailsStatus,supplement: freezed == supplement ? _self.supplement : supplement // ignore: cast_nullable_to_non_nullable
as Supplement?,
  ));
}

/// Create a copy of SupplementDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplementCopyWith<$Res>? get supplement {
    if (_self.supplement == null) {
    return null;
  }

  return $SupplementCopyWith<$Res>(_self.supplement!, (value) {
    return _then(_self.copyWith(supplement: value));
  });
}
}

// dart format on
