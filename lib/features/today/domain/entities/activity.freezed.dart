// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Activity {

 int get id; String get name; int get kcalPerUnit; String get unitLabel; String? get presetKey; bool get isDurationBased;
/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityCopyWith<Activity> get copyWith => _$ActivityCopyWithImpl<Activity>(this as Activity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Activity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Activity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.kcalPerUnit, _this.kcalPerUnit) || other.kcalPerUnit == _this.kcalPerUnit)&&(identical(other.unitLabel, _this.unitLabel) || other.unitLabel == _this.unitLabel)&&(identical(other.presetKey, _this.presetKey) || other.presetKey == _this.presetKey)&&(identical(other.isDurationBased, _this.isDurationBased) || other.isDurationBased == _this.isDurationBased));
}


@override
int get hashCode {
  final _this = this as Activity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.kcalPerUnit,_this.unitLabel,_this.presetKey,_this.isDurationBased);
}

@override
String toString() {
  final _this = this as Activity;
  return 'Activity(id: ${_this.id}, name: ${_this.name}, kcalPerUnit: ${_this.kcalPerUnit}, unitLabel: ${_this.unitLabel}, presetKey: ${_this.presetKey}, isDurationBased: ${_this.isDurationBased})';
}


}

/// @nodoc
abstract mixin class $ActivityCopyWith<$Res>  {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) _then) = _$ActivityCopyWithImpl;
@useResult
$Res call({
 int id, String name, int kcalPerUnit, String unitLabel, String? presetKey, bool isDurationBased
});




}
/// @nodoc
class _$ActivityCopyWithImpl<$Res>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._self, this._then);

  final Activity _self;
  final $Res Function(Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kcalPerUnit = null,Object? unitLabel = null,Object? presetKey = freezed,Object? isDurationBased = null,}) {
  return _then(Activity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kcalPerUnit: null == kcalPerUnit ? _self.kcalPerUnit : kcalPerUnit // ignore: cast_nullable_to_non_nullable
as int,unitLabel: null == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String,presetKey: freezed == presetKey ? _self.presetKey : presetKey // ignore: cast_nullable_to_non_nullable
as String?,isDurationBased: null == isDurationBased ? _self.isDurationBased : isDurationBased // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Activity].
extension ActivityPatterns on Activity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Activity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Activity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Activity value)  $default,){
final _that = this;
switch (_that) {
case _Activity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Activity value)?  $default,){
final _that = this;
switch (_that) {
case _Activity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int kcalPerUnit,  String unitLabel,  String? presetKey,  bool isDurationBased)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Activity() when $default != null:
return $default(_that.id,_that.name,_that.kcalPerUnit,_that.unitLabel,_that.presetKey,_that.isDurationBased);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int kcalPerUnit,  String unitLabel,  String? presetKey,  bool isDurationBased)  $default,) {final _that = this;
switch (_that) {
case _Activity():
return $default(_that.id,_that.name,_that.kcalPerUnit,_that.unitLabel,_that.presetKey,_that.isDurationBased);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int kcalPerUnit,  String unitLabel,  String? presetKey,  bool isDurationBased)?  $default,) {final _that = this;
switch (_that) {
case _Activity() when $default != null:
return $default(_that.id,_that.name,_that.kcalPerUnit,_that.unitLabel,_that.presetKey,_that.isDurationBased);case _:
  return null;

}
}

}

/// @nodoc


class _Activity implements Activity {
  const _Activity({required this.id, required this.name, required this.kcalPerUnit, required this.unitLabel, this.presetKey, this.isDurationBased = false});
  

@override final  int id;
@override final  String name;
@override final  int kcalPerUnit;
@override final  String unitLabel;
@override final  String? presetKey;
@override@JsonKey() final  bool isDurationBased;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityCopyWith<_Activity> get copyWith => __$ActivityCopyWithImpl<_Activity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Activity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kcalPerUnit, kcalPerUnit) || other.kcalPerUnit == kcalPerUnit)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.presetKey, presetKey) || other.presetKey == presetKey)&&(identical(other.isDurationBased, isDurationBased) || other.isDurationBased == isDurationBased));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,kcalPerUnit,unitLabel,presetKey,isDurationBased);
}

@override
String toString() {
    return 'Activity(id: $id, name: $name, kcalPerUnit: $kcalPerUnit, unitLabel: $unitLabel, presetKey: $presetKey, isDurationBased: $isDurationBased)';
}


}

/// @nodoc
abstract mixin class _$ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$ActivityCopyWith(_Activity value, $Res Function(_Activity) _then) = __$ActivityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int kcalPerUnit, String unitLabel, String? presetKey, bool isDurationBased
});




}
/// @nodoc
class __$ActivityCopyWithImpl<$Res>
    implements _$ActivityCopyWith<$Res> {
  __$ActivityCopyWithImpl(this._self, this._then);

  final _Activity _self;
  final $Res Function(_Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kcalPerUnit = null,Object? unitLabel = null,Object? presetKey = freezed,Object? isDurationBased = null,}) {
  return _then(_Activity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kcalPerUnit: null == kcalPerUnit ? _self.kcalPerUnit : kcalPerUnit // ignore: cast_nullable_to_non_nullable
as int,unitLabel: null == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String,presetKey: freezed == presetKey ? _self.presetKey : presetKey // ignore: cast_nullable_to_non_nullable
as String?,isDurationBased: null == isDurationBased ? _self.isDurationBased : isDurationBased // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
