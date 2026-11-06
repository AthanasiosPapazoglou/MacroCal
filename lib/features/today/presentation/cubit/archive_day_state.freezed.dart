// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive_day_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArchiveDayState {

 DateTime get selectedDate; bool get isDateTaken; ArchiveDayStatus get status;
/// Create a copy of ArchiveDayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchiveDayStateCopyWith<ArchiveDayState> get copyWith => _$ArchiveDayStateCopyWithImpl<ArchiveDayState>(this as ArchiveDayState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ArchiveDayState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveDayState&&(identical(other.selectedDate, _this.selectedDate) || other.selectedDate == _this.selectedDate)&&(identical(other.isDateTaken, _this.isDateTaken) || other.isDateTaken == _this.isDateTaken)&&(identical(other.status, _this.status) || other.status == _this.status));
}


@override
int get hashCode {
  final _this = this as ArchiveDayState;
  return Object.hash(runtimeType,_this.selectedDate,_this.isDateTaken,_this.status);
}

@override
String toString() {
  final _this = this as ArchiveDayState;
  return 'ArchiveDayState(selectedDate: ${_this.selectedDate}, isDateTaken: ${_this.isDateTaken}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $ArchiveDayStateCopyWith<$Res>  {
  factory $ArchiveDayStateCopyWith(ArchiveDayState value, $Res Function(ArchiveDayState) _then) = _$ArchiveDayStateCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDate, bool isDateTaken, ArchiveDayStatus status
});




}
/// @nodoc
class _$ArchiveDayStateCopyWithImpl<$Res>
    implements $ArchiveDayStateCopyWith<$Res> {
  _$ArchiveDayStateCopyWithImpl(this._self, this._then);

  final ArchiveDayState _self;
  final $Res Function(ArchiveDayState) _then;

/// Create a copy of ArchiveDayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDate = null,Object? isDateTaken = null,Object? status = null,}) {
  return _then(ArchiveDayState(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,isDateTaken: null == isDateTaken ? _self.isDateTaken : isDateTaken // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ArchiveDayStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [ArchiveDayState].
extension ArchiveDayStatePatterns on ArchiveDayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArchiveDayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArchiveDayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArchiveDayState value)  $default,){
final _that = this;
switch (_that) {
case _ArchiveDayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArchiveDayState value)?  $default,){
final _that = this;
switch (_that) {
case _ArchiveDayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime selectedDate,  bool isDateTaken,  ArchiveDayStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArchiveDayState() when $default != null:
return $default(_that.selectedDate,_that.isDateTaken,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime selectedDate,  bool isDateTaken,  ArchiveDayStatus status)  $default,) {final _that = this;
switch (_that) {
case _ArchiveDayState():
return $default(_that.selectedDate,_that.isDateTaken,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime selectedDate,  bool isDateTaken,  ArchiveDayStatus status)?  $default,) {final _that = this;
switch (_that) {
case _ArchiveDayState() when $default != null:
return $default(_that.selectedDate,_that.isDateTaken,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _ArchiveDayState implements ArchiveDayState {
  const _ArchiveDayState({required this.selectedDate, this.isDateTaken = false, this.status = ArchiveDayStatus.checking});
  

@override final  DateTime selectedDate;
@override@JsonKey() final  bool isDateTaken;
@override@JsonKey() final  ArchiveDayStatus status;

/// Create a copy of ArchiveDayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArchiveDayStateCopyWith<_ArchiveDayState> get copyWith => __$ArchiveDayStateCopyWithImpl<_ArchiveDayState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchiveDayState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.isDateTaken, isDateTaken) || other.isDateTaken == isDateTaken)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode {
    return Object.hash(runtimeType,selectedDate,isDateTaken,status);
}

@override
String toString() {
    return 'ArchiveDayState(selectedDate: $selectedDate, isDateTaken: $isDateTaken, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ArchiveDayStateCopyWith<$Res> implements $ArchiveDayStateCopyWith<$Res> {
  factory _$ArchiveDayStateCopyWith(_ArchiveDayState value, $Res Function(_ArchiveDayState) _then) = __$ArchiveDayStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime selectedDate, bool isDateTaken, ArchiveDayStatus status
});




}
/// @nodoc
class __$ArchiveDayStateCopyWithImpl<$Res>
    implements _$ArchiveDayStateCopyWith<$Res> {
  __$ArchiveDayStateCopyWithImpl(this._self, this._then);

  final _ArchiveDayState _self;
  final $Res Function(_ArchiveDayState) _then;

/// Create a copy of ArchiveDayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDate = null,Object? isDateTaken = null,Object? status = null,}) {
  return _then(_ArchiveDayState(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,isDateTaken: null == isDateTaken ? _self.isDateTaken : isDateTaken // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ArchiveDayStatus,
  ));
}


}

// dart format on
