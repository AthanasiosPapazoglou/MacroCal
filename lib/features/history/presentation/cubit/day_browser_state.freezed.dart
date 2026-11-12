// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_browser_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayBrowserState {

 DatePeriod get period; DayBrowserStatus get status; List<DayLog> get periodDays; DayFilter? get filter; DaySort get sort; DayBrowserLayout get view;
/// Create a copy of DayBrowserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayBrowserStateCopyWith<DayBrowserState> get copyWith => _$DayBrowserStateCopyWithImpl<DayBrowserState>(this as DayBrowserState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DayBrowserState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayBrowserState&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.periodDays, _this.periodDays)&&(identical(other.filter, _this.filter) || other.filter == _this.filter)&&(identical(other.sort, _this.sort) || other.sort == _this.sort)&&(identical(other.view, _this.view) || other.view == _this.view));
}


@override
int get hashCode {
  final _this = this as DayBrowserState;
  return Object.hash(runtimeType,_this.period,_this.status,const DeepCollectionEquality().hash(_this.periodDays),_this.filter,_this.sort,_this.view);
}

@override
String toString() {
  final _this = this as DayBrowserState;
  return 'DayBrowserState(period: ${_this.period}, status: ${_this.status}, periodDays: ${_this.periodDays}, filter: ${_this.filter}, sort: ${_this.sort}, view: ${_this.view})';
}


}

/// @nodoc
abstract mixin class $DayBrowserStateCopyWith<$Res>  {
  factory $DayBrowserStateCopyWith(DayBrowserState value, $Res Function(DayBrowserState) _then) = _$DayBrowserStateCopyWithImpl;
@useResult
$Res call({
 DatePeriod period, DayBrowserStatus status, List<DayLog> periodDays, DayFilter? filter, DaySort sort, DayBrowserLayout view
});


$DatePeriodCopyWith<$Res> get period;$DayFilterCopyWith<$Res>? get filter;

}
/// @nodoc
class _$DayBrowserStateCopyWithImpl<$Res>
    implements $DayBrowserStateCopyWith<$Res> {
  _$DayBrowserStateCopyWithImpl(this._self, this._then);

  final DayBrowserState _self;
  final $Res Function(DayBrowserState) _then;

/// Create a copy of DayBrowserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? status = null,Object? periodDays = null,Object? filter = freezed,Object? sort = null,Object? view = null,}) {
  return _then(DayBrowserState(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DatePeriod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DayBrowserStatus,periodDays: null == periodDays ? _self.periodDays : periodDays // ignore: cast_nullable_to_non_nullable
as List<DayLog>,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as DayFilter?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as DaySort,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as DayBrowserLayout,
  ));
}
/// Create a copy of DayBrowserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatePeriodCopyWith<$Res> get period {
  
  return $DatePeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of DayBrowserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DayFilterCopyWith<$Res>? get filter {
    if (_self.filter == null) {
    return null;
  }

  return $DayFilterCopyWith<$Res>(_self.filter!, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [DayBrowserState].
extension DayBrowserStatePatterns on DayBrowserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayBrowserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayBrowserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayBrowserState value)  $default,){
final _that = this;
switch (_that) {
case _DayBrowserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayBrowserState value)?  $default,){
final _that = this;
switch (_that) {
case _DayBrowserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DatePeriod period,  DayBrowserStatus status,  List<DayLog> periodDays,  DayFilter? filter,  DaySort sort,  DayBrowserLayout view)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayBrowserState() when $default != null:
return $default(_that.period,_that.status,_that.periodDays,_that.filter,_that.sort,_that.view);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DatePeriod period,  DayBrowserStatus status,  List<DayLog> periodDays,  DayFilter? filter,  DaySort sort,  DayBrowserLayout view)  $default,) {final _that = this;
switch (_that) {
case _DayBrowserState():
return $default(_that.period,_that.status,_that.periodDays,_that.filter,_that.sort,_that.view);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DatePeriod period,  DayBrowserStatus status,  List<DayLog> periodDays,  DayFilter? filter,  DaySort sort,  DayBrowserLayout view)?  $default,) {final _that = this;
switch (_that) {
case _DayBrowserState() when $default != null:
return $default(_that.period,_that.status,_that.periodDays,_that.filter,_that.sort,_that.view);case _:
  return null;

}
}

}

/// @nodoc


class _DayBrowserState extends DayBrowserState {
  const _DayBrowserState({required this.period, this.status = DayBrowserStatus.loading,  List<DayLog> periodDays = const <DayLog>[], this.filter, this.sort = DaySort.newestFirst, this.view = DayBrowserLayout.list}): _periodDays = periodDays,super._();
  

@override final  DatePeriod period;
@override@JsonKey() final  DayBrowserStatus status;
 final  List<DayLog> _periodDays;
@override@JsonKey() List<DayLog> get periodDays {
  if (_periodDays is EqualUnmodifiableListView) return _periodDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_periodDays);
}

@override final  DayFilter? filter;
@override@JsonKey() final  DaySort sort;
@override@JsonKey() final  DayBrowserLayout view;

/// Create a copy of DayBrowserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayBrowserStateCopyWith<_DayBrowserState> get copyWith => __$DayBrowserStateCopyWithImpl<_DayBrowserState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayBrowserState&&(identical(other.period, period) || other.period == period)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.periodDays, _periodDays)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.view, view) || other.view == view));
}


@override
int get hashCode {
    return Object.hash(runtimeType,period,status,const DeepCollectionEquality().hash(_periodDays),filter,sort,view);
}

@override
String toString() {
    return 'DayBrowserState(period: $period, status: $status, periodDays: $periodDays, filter: $filter, sort: $sort, view: $view)';
}


}

/// @nodoc
abstract mixin class _$DayBrowserStateCopyWith<$Res> implements $DayBrowserStateCopyWith<$Res> {
  factory _$DayBrowserStateCopyWith(_DayBrowserState value, $Res Function(_DayBrowserState) _then) = __$DayBrowserStateCopyWithImpl;
@override @useResult
$Res call({
 DatePeriod period, DayBrowserStatus status, List<DayLog> periodDays, DayFilter? filter, DaySort sort, DayBrowserLayout view
});


@override $DatePeriodCopyWith<$Res> get period;@override $DayFilterCopyWith<$Res>? get filter;

}
/// @nodoc
class __$DayBrowserStateCopyWithImpl<$Res>
    implements _$DayBrowserStateCopyWith<$Res> {
  __$DayBrowserStateCopyWithImpl(this._self, this._then);

  final _DayBrowserState _self;
  final $Res Function(_DayBrowserState) _then;

/// Create a copy of DayBrowserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? status = null,Object? periodDays = null,Object? filter = freezed,Object? sort = null,Object? view = null,}) {
  return _then(_DayBrowserState(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DatePeriod,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DayBrowserStatus,periodDays: null == periodDays ? _self._periodDays : periodDays // ignore: cast_nullable_to_non_nullable
as List<DayLog>,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as DayFilter?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as DaySort,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as DayBrowserLayout,
  ));
}

/// Create a copy of DayBrowserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatePeriodCopyWith<$Res> get period {
  
  return $DatePeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of DayBrowserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DayFilterCopyWith<$Res>? get filter {
    if (_self.filter == null) {
    return null;
  }

  return $DayFilterCopyWith<$Res>(_self.filter!, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

// dart format on
