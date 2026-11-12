// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_period.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DatePeriod {

 DatePeriodKind get kind; DateTime get from; DateTime get to;
/// Create a copy of DatePeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatePeriodCopyWith<DatePeriod> get copyWith => _$DatePeriodCopyWithImpl<DatePeriod>(this as DatePeriod, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DatePeriod;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatePeriod&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.to, _this.to) || other.to == _this.to));
}


@override
int get hashCode {
  final _this = this as DatePeriod;
  return Object.hash(runtimeType,_this.kind,_this.from,_this.to);
}

@override
String toString() {
  final _this = this as DatePeriod;
  return 'DatePeriod(kind: ${_this.kind}, from: ${_this.from}, to: ${_this.to})';
}


}

/// @nodoc
abstract mixin class $DatePeriodCopyWith<$Res>  {
  factory $DatePeriodCopyWith(DatePeriod value, $Res Function(DatePeriod) _then) = _$DatePeriodCopyWithImpl;
@useResult
$Res call({
 DatePeriodKind kind, DateTime from, DateTime to
});




}
/// @nodoc
class _$DatePeriodCopyWithImpl<$Res>
    implements $DatePeriodCopyWith<$Res> {
  _$DatePeriodCopyWithImpl(this._self, this._then);

  final DatePeriod _self;
  final $Res Function(DatePeriod) _then;

/// Create a copy of DatePeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? from = null,Object? to = null,}) {
  return _then(DatePeriod(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DatePeriodKind,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DatePeriod].
extension DatePeriodPatterns on DatePeriod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DatePeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DatePeriod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DatePeriod value)  $default,){
final _that = this;
switch (_that) {
case _DatePeriod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DatePeriod value)?  $default,){
final _that = this;
switch (_that) {
case _DatePeriod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DatePeriodKind kind,  DateTime from,  DateTime to)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DatePeriod() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DatePeriodKind kind,  DateTime from,  DateTime to)  $default,) {final _that = this;
switch (_that) {
case _DatePeriod():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DatePeriodKind kind,  DateTime from,  DateTime to)?  $default,) {final _that = this;
switch (_that) {
case _DatePeriod() when $default != null:
return $default(_that.kind,_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc


class _DatePeriod extends DatePeriod {
  const _DatePeriod({required this.kind, required this.from, required this.to}): super._();
  

@override final  DatePeriodKind kind;
@override final  DateTime from;
@override final  DateTime to;

/// Create a copy of DatePeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatePeriodCopyWith<_DatePeriod> get copyWith => __$DatePeriodCopyWithImpl<_DatePeriod>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DatePeriod&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,from,to);
}

@override
String toString() {
    return 'DatePeriod(kind: $kind, from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class _$DatePeriodCopyWith<$Res> implements $DatePeriodCopyWith<$Res> {
  factory _$DatePeriodCopyWith(_DatePeriod value, $Res Function(_DatePeriod) _then) = __$DatePeriodCopyWithImpl;
@override @useResult
$Res call({
 DatePeriodKind kind, DateTime from, DateTime to
});




}
/// @nodoc
class __$DatePeriodCopyWithImpl<$Res>
    implements _$DatePeriodCopyWith<$Res> {
  __$DatePeriodCopyWithImpl(this._self, this._then);

  final _DatePeriod _self;
  final $Res Function(_DatePeriod) _then;

/// Create a copy of DatePeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? from = null,Object? to = null,}) {
  return _then(_DatePeriod(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DatePeriodKind,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
