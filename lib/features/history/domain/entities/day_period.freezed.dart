// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_period.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayPeriod {

 DayPeriodKind get kind; DateTime get from; DateTime get to;
/// Create a copy of DayPeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayPeriodCopyWith<DayPeriod> get copyWith => _$DayPeriodCopyWithImpl<DayPeriod>(this as DayPeriod, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DayPeriod;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayPeriod&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.to, _this.to) || other.to == _this.to));
}


@override
int get hashCode {
  final _this = this as DayPeriod;
  return Object.hash(runtimeType,_this.kind,_this.from,_this.to);
}

@override
String toString() {
  final _this = this as DayPeriod;
  return 'DayPeriod(kind: ${_this.kind}, from: ${_this.from}, to: ${_this.to})';
}


}

/// @nodoc
abstract mixin class $DayPeriodCopyWith<$Res>  {
  factory $DayPeriodCopyWith(DayPeriod value, $Res Function(DayPeriod) _then) = _$DayPeriodCopyWithImpl;
@useResult
$Res call({
 DayPeriodKind kind, DateTime from, DateTime to
});




}
/// @nodoc
class _$DayPeriodCopyWithImpl<$Res>
    implements $DayPeriodCopyWith<$Res> {
  _$DayPeriodCopyWithImpl(this._self, this._then);

  final DayPeriod _self;
  final $Res Function(DayPeriod) _then;

/// Create a copy of DayPeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? from = null,Object? to = null,}) {
  return _then(DayPeriod(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DayPeriodKind,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DayPeriod].
extension DayPeriodPatterns on DayPeriod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayPeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayPeriod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayPeriod value)  $default,){
final _that = this;
switch (_that) {
case _DayPeriod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayPeriod value)?  $default,){
final _that = this;
switch (_that) {
case _DayPeriod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DayPeriodKind kind,  DateTime from,  DateTime to)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayPeriod() when $default != null:
return $default(_that.kind,_that.from,_that.to);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DayPeriodKind kind,  DateTime from,  DateTime to)  $default,) {final _that = this;
switch (_that) {
case _DayPeriod():
return $default(_that.kind,_that.from,_that.to);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DayPeriodKind kind,  DateTime from,  DateTime to)?  $default,) {final _that = this;
switch (_that) {
case _DayPeriod() when $default != null:
return $default(_that.kind,_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc


class _DayPeriod extends DayPeriod {
  const _DayPeriod({required this.kind, required this.from, required this.to}): super._();
  

@override final  DayPeriodKind kind;
@override final  DateTime from;
@override final  DateTime to;

/// Create a copy of DayPeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayPeriodCopyWith<_DayPeriod> get copyWith => __$DayPeriodCopyWithImpl<_DayPeriod>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayPeriod&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,from,to);
}

@override
String toString() {
    return 'DayPeriod(kind: $kind, from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class _$DayPeriodCopyWith<$Res> implements $DayPeriodCopyWith<$Res> {
  factory _$DayPeriodCopyWith(_DayPeriod value, $Res Function(_DayPeriod) _then) = __$DayPeriodCopyWithImpl;
@override @useResult
$Res call({
 DayPeriodKind kind, DateTime from, DateTime to
});




}
/// @nodoc
class __$DayPeriodCopyWithImpl<$Res>
    implements _$DayPeriodCopyWith<$Res> {
  __$DayPeriodCopyWithImpl(this._self, this._then);

  final _DayPeriod _self;
  final $Res Function(_DayPeriod) _then;

/// Create a copy of DayPeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? from = null,Object? to = null,}) {
  return _then(_DayPeriod(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DayPeriodKind,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
