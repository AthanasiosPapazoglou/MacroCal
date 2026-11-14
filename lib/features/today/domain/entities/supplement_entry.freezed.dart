// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplement_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplementEntry {

 Supplement get supplement; double get units;
/// Create a copy of SupplementEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplementEntryCopyWith<SupplementEntry> get copyWith => _$SupplementEntryCopyWithImpl<SupplementEntry>(this as SupplementEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SupplementEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplementEntry&&(identical(other.supplement, _this.supplement) || other.supplement == _this.supplement)&&(identical(other.units, _this.units) || other.units == _this.units));
}


@override
int get hashCode {
  final _this = this as SupplementEntry;
  return Object.hash(runtimeType,_this.supplement,_this.units);
}

@override
String toString() {
  final _this = this as SupplementEntry;
  return 'SupplementEntry(supplement: ${_this.supplement}, units: ${_this.units})';
}


}

/// @nodoc
abstract mixin class $SupplementEntryCopyWith<$Res>  {
  factory $SupplementEntryCopyWith(SupplementEntry value, $Res Function(SupplementEntry) _then) = _$SupplementEntryCopyWithImpl;
@useResult
$Res call({
 Supplement supplement, double units
});


$SupplementCopyWith<$Res> get supplement;

}
/// @nodoc
class _$SupplementEntryCopyWithImpl<$Res>
    implements $SupplementEntryCopyWith<$Res> {
  _$SupplementEntryCopyWithImpl(this._self, this._then);

  final SupplementEntry _self;
  final $Res Function(SupplementEntry) _then;

/// Create a copy of SupplementEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? supplement = null,Object? units = null,}) {
  return _then(SupplementEntry(
supplement: null == supplement ? _self.supplement : supplement // ignore: cast_nullable_to_non_nullable
as Supplement,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of SupplementEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplementCopyWith<$Res> get supplement {
  
  return $SupplementCopyWith<$Res>(_self.supplement, (value) {
    return _then(_self.copyWith(supplement: value));
  });
}
}


/// Adds pattern-matching-related methods to [SupplementEntry].
extension SupplementEntryPatterns on SupplementEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplementEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplementEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplementEntry value)  $default,){
final _that = this;
switch (_that) {
case _SupplementEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplementEntry value)?  $default,){
final _that = this;
switch (_that) {
case _SupplementEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Supplement supplement,  double units)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplementEntry() when $default != null:
return $default(_that.supplement,_that.units);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Supplement supplement,  double units)  $default,) {final _that = this;
switch (_that) {
case _SupplementEntry():
return $default(_that.supplement,_that.units);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Supplement supplement,  double units)?  $default,) {final _that = this;
switch (_that) {
case _SupplementEntry() when $default != null:
return $default(_that.supplement,_that.units);case _:
  return null;

}
}

}

/// @nodoc


class _SupplementEntry extends SupplementEntry {
  const _SupplementEntry({required this.supplement, required this.units}): super._();
  

@override final  Supplement supplement;
@override final  double units;

/// Create a copy of SupplementEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplementEntryCopyWith<_SupplementEntry> get copyWith => __$SupplementEntryCopyWithImpl<_SupplementEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplementEntry&&(identical(other.supplement, supplement) || other.supplement == supplement)&&(identical(other.units, units) || other.units == units));
}


@override
int get hashCode {
    return Object.hash(runtimeType,supplement,units);
}

@override
String toString() {
    return 'SupplementEntry(supplement: $supplement, units: $units)';
}


}

/// @nodoc
abstract mixin class _$SupplementEntryCopyWith<$Res> implements $SupplementEntryCopyWith<$Res> {
  factory _$SupplementEntryCopyWith(_SupplementEntry value, $Res Function(_SupplementEntry) _then) = __$SupplementEntryCopyWithImpl;
@override @useResult
$Res call({
 Supplement supplement, double units
});


@override $SupplementCopyWith<$Res> get supplement;

}
/// @nodoc
class __$SupplementEntryCopyWithImpl<$Res>
    implements _$SupplementEntryCopyWith<$Res> {
  __$SupplementEntryCopyWithImpl(this._self, this._then);

  final _SupplementEntry _self;
  final $Res Function(_SupplementEntry) _then;

/// Create a copy of SupplementEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? supplement = null,Object? units = null,}) {
  return _then(_SupplementEntry(
supplement: null == supplement ? _self.supplement : supplement // ignore: cast_nullable_to_non_nullable
as Supplement,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of SupplementEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplementCopyWith<$Res> get supplement {
  
  return $SupplementCopyWith<$Res>(_self.supplement, (value) {
    return _then(_self.copyWith(supplement: value));
  });
}
}

// dart format on
