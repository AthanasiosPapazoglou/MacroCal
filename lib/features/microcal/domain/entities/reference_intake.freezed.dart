// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_intake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReferenceIntake {

 double get target; ReferenceSource get source; bool get isAdequateIntake; UpperLimit? get upperLimit;
/// Create a copy of ReferenceIntake
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceIntakeCopyWith<ReferenceIntake> get copyWith => _$ReferenceIntakeCopyWithImpl<ReferenceIntake>(this as ReferenceIntake, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReferenceIntake;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceIntake&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.isAdequateIntake, _this.isAdequateIntake) || other.isAdequateIntake == _this.isAdequateIntake)&&(identical(other.upperLimit, _this.upperLimit) || other.upperLimit == _this.upperLimit));
}


@override
int get hashCode {
  final _this = this as ReferenceIntake;
  return Object.hash(runtimeType,_this.target,_this.source,_this.isAdequateIntake,_this.upperLimit);
}

@override
String toString() {
  final _this = this as ReferenceIntake;
  return 'ReferenceIntake(target: ${_this.target}, source: ${_this.source}, isAdequateIntake: ${_this.isAdequateIntake}, upperLimit: ${_this.upperLimit})';
}


}

/// @nodoc
abstract mixin class $ReferenceIntakeCopyWith<$Res>  {
  factory $ReferenceIntakeCopyWith(ReferenceIntake value, $Res Function(ReferenceIntake) _then) = _$ReferenceIntakeCopyWithImpl;
@useResult
$Res call({
 double target, ReferenceSource source, bool isAdequateIntake, UpperLimit? upperLimit
});


$UpperLimitCopyWith<$Res>? get upperLimit;

}
/// @nodoc
class _$ReferenceIntakeCopyWithImpl<$Res>
    implements $ReferenceIntakeCopyWith<$Res> {
  _$ReferenceIntakeCopyWithImpl(this._self, this._then);

  final ReferenceIntake _self;
  final $Res Function(ReferenceIntake) _then;

/// Create a copy of ReferenceIntake
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? target = null,Object? source = null,Object? isAdequateIntake = null,Object? upperLimit = freezed,}) {
  return _then(ReferenceIntake(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as double,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ReferenceSource,isAdequateIntake: null == isAdequateIntake ? _self.isAdequateIntake : isAdequateIntake // ignore: cast_nullable_to_non_nullable
as bool,upperLimit: freezed == upperLimit ? _self.upperLimit : upperLimit // ignore: cast_nullable_to_non_nullable
as UpperLimit?,
  ));
}
/// Create a copy of ReferenceIntake
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpperLimitCopyWith<$Res>? get upperLimit {
    if (_self.upperLimit == null) {
    return null;
  }

  return $UpperLimitCopyWith<$Res>(_self.upperLimit!, (value) {
    return _then(_self.copyWith(upperLimit: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReferenceIntake].
extension ReferenceIntakePatterns on ReferenceIntake {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceIntake value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceIntake() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceIntake value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceIntake():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceIntake value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceIntake() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double target,  ReferenceSource source,  bool isAdequateIntake,  UpperLimit? upperLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceIntake() when $default != null:
return $default(_that.target,_that.source,_that.isAdequateIntake,_that.upperLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double target,  ReferenceSource source,  bool isAdequateIntake,  UpperLimit? upperLimit)  $default,) {final _that = this;
switch (_that) {
case _ReferenceIntake():
return $default(_that.target,_that.source,_that.isAdequateIntake,_that.upperLimit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double target,  ReferenceSource source,  bool isAdequateIntake,  UpperLimit? upperLimit)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceIntake() when $default != null:
return $default(_that.target,_that.source,_that.isAdequateIntake,_that.upperLimit);case _:
  return null;

}
}

}

/// @nodoc


class _ReferenceIntake implements ReferenceIntake {
  const _ReferenceIntake({required this.target, required this.source, this.isAdequateIntake = false, this.upperLimit});
  

@override final  double target;
@override final  ReferenceSource source;
@override@JsonKey() final  bool isAdequateIntake;
@override final  UpperLimit? upperLimit;

/// Create a copy of ReferenceIntake
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceIntakeCopyWith<_ReferenceIntake> get copyWith => __$ReferenceIntakeCopyWithImpl<_ReferenceIntake>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceIntake&&(identical(other.target, target) || other.target == target)&&(identical(other.source, source) || other.source == source)&&(identical(other.isAdequateIntake, isAdequateIntake) || other.isAdequateIntake == isAdequateIntake)&&(identical(other.upperLimit, upperLimit) || other.upperLimit == upperLimit));
}


@override
int get hashCode {
    return Object.hash(runtimeType,target,source,isAdequateIntake,upperLimit);
}

@override
String toString() {
    return 'ReferenceIntake(target: $target, source: $source, isAdequateIntake: $isAdequateIntake, upperLimit: $upperLimit)';
}


}

/// @nodoc
abstract mixin class _$ReferenceIntakeCopyWith<$Res> implements $ReferenceIntakeCopyWith<$Res> {
  factory _$ReferenceIntakeCopyWith(_ReferenceIntake value, $Res Function(_ReferenceIntake) _then) = __$ReferenceIntakeCopyWithImpl;
@override @useResult
$Res call({
 double target, ReferenceSource source, bool isAdequateIntake, UpperLimit? upperLimit
});


@override $UpperLimitCopyWith<$Res>? get upperLimit;

}
/// @nodoc
class __$ReferenceIntakeCopyWithImpl<$Res>
    implements _$ReferenceIntakeCopyWith<$Res> {
  __$ReferenceIntakeCopyWithImpl(this._self, this._then);

  final _ReferenceIntake _self;
  final $Res Function(_ReferenceIntake) _then;

/// Create a copy of ReferenceIntake
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? target = null,Object? source = null,Object? isAdequateIntake = null,Object? upperLimit = freezed,}) {
  return _then(_ReferenceIntake(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as double,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ReferenceSource,isAdequateIntake: null == isAdequateIntake ? _self.isAdequateIntake : isAdequateIntake // ignore: cast_nullable_to_non_nullable
as bool,upperLimit: freezed == upperLimit ? _self.upperLimit : upperLimit // ignore: cast_nullable_to_non_nullable
as UpperLimit?,
  ));
}

/// Create a copy of ReferenceIntake
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpperLimitCopyWith<$Res>? get upperLimit {
    if (_self.upperLimit == null) {
    return null;
  }

  return $UpperLimitCopyWith<$Res>(_self.upperLimit!, (value) {
    return _then(_self.copyWith(upperLimit: value));
  });
}
}

/// @nodoc
mixin _$UpperLimit {

 double get amount; ReferenceSource get source; UpperLimitScope get scope;
/// Create a copy of UpperLimit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpperLimitCopyWith<UpperLimit> get copyWith => _$UpperLimitCopyWithImpl<UpperLimit>(this as UpperLimit, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UpperLimit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpperLimit&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.scope, _this.scope) || other.scope == _this.scope));
}


@override
int get hashCode {
  final _this = this as UpperLimit;
  return Object.hash(runtimeType,_this.amount,_this.source,_this.scope);
}

@override
String toString() {
  final _this = this as UpperLimit;
  return 'UpperLimit(amount: ${_this.amount}, source: ${_this.source}, scope: ${_this.scope})';
}


}

/// @nodoc
abstract mixin class $UpperLimitCopyWith<$Res>  {
  factory $UpperLimitCopyWith(UpperLimit value, $Res Function(UpperLimit) _then) = _$UpperLimitCopyWithImpl;
@useResult
$Res call({
 double amount, ReferenceSource source, UpperLimitScope scope
});




}
/// @nodoc
class _$UpperLimitCopyWithImpl<$Res>
    implements $UpperLimitCopyWith<$Res> {
  _$UpperLimitCopyWithImpl(this._self, this._then);

  final UpperLimit _self;
  final $Res Function(UpperLimit) _then;

/// Create a copy of UpperLimit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? source = null,Object? scope = null,}) {
  return _then(UpperLimit(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ReferenceSource,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as UpperLimitScope,
  ));
}

}


/// Adds pattern-matching-related methods to [UpperLimit].
extension UpperLimitPatterns on UpperLimit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpperLimit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpperLimit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpperLimit value)  $default,){
final _that = this;
switch (_that) {
case _UpperLimit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpperLimit value)?  $default,){
final _that = this;
switch (_that) {
case _UpperLimit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  ReferenceSource source,  UpperLimitScope scope)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpperLimit() when $default != null:
return $default(_that.amount,_that.source,_that.scope);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  ReferenceSource source,  UpperLimitScope scope)  $default,) {final _that = this;
switch (_that) {
case _UpperLimit():
return $default(_that.amount,_that.source,_that.scope);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  ReferenceSource source,  UpperLimitScope scope)?  $default,) {final _that = this;
switch (_that) {
case _UpperLimit() when $default != null:
return $default(_that.amount,_that.source,_that.scope);case _:
  return null;

}
}

}

/// @nodoc


class _UpperLimit implements UpperLimit {
  const _UpperLimit({required this.amount, required this.source, this.scope = UpperLimitScope.allIntake});
  

@override final  double amount;
@override final  ReferenceSource source;
@override@JsonKey() final  UpperLimitScope scope;

/// Create a copy of UpperLimit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpperLimitCopyWith<_UpperLimit> get copyWith => __$UpperLimitCopyWithImpl<_UpperLimit>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpperLimit&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.source, source) || other.source == source)&&(identical(other.scope, scope) || other.scope == scope));
}


@override
int get hashCode {
    return Object.hash(runtimeType,amount,source,scope);
}

@override
String toString() {
    return 'UpperLimit(amount: $amount, source: $source, scope: $scope)';
}


}

/// @nodoc
abstract mixin class _$UpperLimitCopyWith<$Res> implements $UpperLimitCopyWith<$Res> {
  factory _$UpperLimitCopyWith(_UpperLimit value, $Res Function(_UpperLimit) _then) = __$UpperLimitCopyWithImpl;
@override @useResult
$Res call({
 double amount, ReferenceSource source, UpperLimitScope scope
});




}
/// @nodoc
class __$UpperLimitCopyWithImpl<$Res>
    implements _$UpperLimitCopyWith<$Res> {
  __$UpperLimitCopyWithImpl(this._self, this._then);

  final _UpperLimit _self;
  final $Res Function(_UpperLimit) _then;

/// Create a copy of UpperLimit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? source = null,Object? scope = null,}) {
  return _then(_UpperLimit(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ReferenceSource,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as UpperLimitScope,
  ));
}


}

// dart format on
