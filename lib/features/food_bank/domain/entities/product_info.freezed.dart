// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductInfo {

 String get name; Nutrients get per100g;
/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductInfoCopyWith<ProductInfo> get copyWith => _$ProductInfoCopyWithImpl<ProductInfo>(this as ProductInfo, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProductInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductInfo&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.per100g, _this.per100g) || other.per100g == _this.per100g));
}


@override
int get hashCode {
  final _this = this as ProductInfo;
  return Object.hash(runtimeType,_this.name,_this.per100g);
}

@override
String toString() {
  final _this = this as ProductInfo;
  return 'ProductInfo(name: ${_this.name}, per100g: ${_this.per100g})';
}


}

/// @nodoc
abstract mixin class $ProductInfoCopyWith<$Res>  {
  factory $ProductInfoCopyWith(ProductInfo value, $Res Function(ProductInfo) _then) = _$ProductInfoCopyWithImpl;
@useResult
$Res call({
 String name, Nutrients per100g
});


$NutrientsCopyWith<$Res> get per100g;

}
/// @nodoc
class _$ProductInfoCopyWithImpl<$Res>
    implements $ProductInfoCopyWith<$Res> {
  _$ProductInfoCopyWithImpl(this._self, this._then);

  final ProductInfo _self;
  final $Res Function(ProductInfo) _then;

/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? per100g = null,}) {
  return _then(ProductInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as Nutrients,
  ));
}
/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get per100g {
  
  return $NutrientsCopyWith<$Res>(_self.per100g, (value) {
    return _then(_self.copyWith(per100g: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductInfo].
extension ProductInfoPatterns on ProductInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductInfo value)  $default,){
final _that = this;
switch (_that) {
case _ProductInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ProductInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  Nutrients per100g)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductInfo() when $default != null:
return $default(_that.name,_that.per100g);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  Nutrients per100g)  $default,) {final _that = this;
switch (_that) {
case _ProductInfo():
return $default(_that.name,_that.per100g);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  Nutrients per100g)?  $default,) {final _that = this;
switch (_that) {
case _ProductInfo() when $default != null:
return $default(_that.name,_that.per100g);case _:
  return null;

}
}

}

/// @nodoc


class _ProductInfo implements ProductInfo {
  const _ProductInfo({required this.name, required this.per100g});
  

@override final  String name;
@override final  Nutrients per100g;

/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductInfoCopyWith<_ProductInfo> get copyWith => __$ProductInfoCopyWithImpl<_ProductInfo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.per100g, per100g) || other.per100g == per100g));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,per100g);
}

@override
String toString() {
    return 'ProductInfo(name: $name, per100g: $per100g)';
}


}

/// @nodoc
abstract mixin class _$ProductInfoCopyWith<$Res> implements $ProductInfoCopyWith<$Res> {
  factory _$ProductInfoCopyWith(_ProductInfo value, $Res Function(_ProductInfo) _then) = __$ProductInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, Nutrients per100g
});


@override $NutrientsCopyWith<$Res> get per100g;

}
/// @nodoc
class __$ProductInfoCopyWithImpl<$Res>
    implements _$ProductInfoCopyWith<$Res> {
  __$ProductInfoCopyWithImpl(this._self, this._then);

  final _ProductInfo _self;
  final $Res Function(_ProductInfo) _then;

/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? per100g = null,}) {
  return _then(_ProductInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as Nutrients,
  ));
}

/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get per100g {
  
  return $NutrientsCopyWith<$Res>(_self.per100g, (value) {
    return _then(_self.copyWith(per100g: value));
  });
}
}

// dart format on
