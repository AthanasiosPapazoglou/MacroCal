// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayLog {

 DateTime get date; DailySummary get summary; MicroIntake? get micros; Sex? get sex; int? get age;
/// Create a copy of DayLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayLogCopyWith<DayLog> get copyWith => _$DayLogCopyWithImpl<DayLog>(this as DayLog, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DayLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayLog&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.micros, _this.micros) || other.micros == _this.micros)&&(identical(other.sex, _this.sex) || other.sex == _this.sex)&&(identical(other.age, _this.age) || other.age == _this.age));
}


@override
int get hashCode {
  final _this = this as DayLog;
  return Object.hash(runtimeType,_this.date,_this.summary,_this.micros,_this.sex,_this.age);
}

@override
String toString() {
  final _this = this as DayLog;
  return 'DayLog(date: ${_this.date}, summary: ${_this.summary}, micros: ${_this.micros}, sex: ${_this.sex}, age: ${_this.age})';
}


}

/// @nodoc
abstract mixin class $DayLogCopyWith<$Res>  {
  factory $DayLogCopyWith(DayLog value, $Res Function(DayLog) _then) = _$DayLogCopyWithImpl;
@useResult
$Res call({
 DateTime date, DailySummary summary, MicroIntake? micros, Sex? sex, int? age
});


$DailySummaryCopyWith<$Res> get summary;$MicroIntakeCopyWith<$Res>? get micros;

}
/// @nodoc
class _$DayLogCopyWithImpl<$Res>
    implements $DayLogCopyWith<$Res> {
  _$DayLogCopyWithImpl(this._self, this._then);

  final DayLog _self;
  final $Res Function(DayLog) _then;

/// Create a copy of DayLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? summary = null,Object? micros = freezed,Object? sex = freezed,Object? age = freezed,}) {
  return _then(DayLog(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as DailySummary,micros: freezed == micros ? _self.micros : micros // ignore: cast_nullable_to_non_nullable
as MicroIntake?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of DayLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailySummaryCopyWith<$Res> get summary {
  
  return $DailySummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of DayLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicroIntakeCopyWith<$Res>? get micros {
    if (_self.micros == null) {
    return null;
  }

  return $MicroIntakeCopyWith<$Res>(_self.micros!, (value) {
    return _then(_self.copyWith(micros: value));
  });
}
}


/// Adds pattern-matching-related methods to [DayLog].
extension DayLogPatterns on DayLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayLog value)  $default,){
final _that = this;
switch (_that) {
case _DayLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayLog value)?  $default,){
final _that = this;
switch (_that) {
case _DayLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  DailySummary summary,  MicroIntake? micros,  Sex? sex,  int? age)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayLog() when $default != null:
return $default(_that.date,_that.summary,_that.micros,_that.sex,_that.age);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  DailySummary summary,  MicroIntake? micros,  Sex? sex,  int? age)  $default,) {final _that = this;
switch (_that) {
case _DayLog():
return $default(_that.date,_that.summary,_that.micros,_that.sex,_that.age);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  DailySummary summary,  MicroIntake? micros,  Sex? sex,  int? age)?  $default,) {final _that = this;
switch (_that) {
case _DayLog() when $default != null:
return $default(_that.date,_that.summary,_that.micros,_that.sex,_that.age);case _:
  return null;

}
}

}

/// @nodoc


class _DayLog implements DayLog {
  const _DayLog({required this.date, required this.summary, this.micros, this.sex, this.age});
  

@override final  DateTime date;
@override final  DailySummary summary;
@override final  MicroIntake? micros;
@override final  Sex? sex;
@override final  int? age;

/// Create a copy of DayLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayLogCopyWith<_DayLog> get copyWith => __$DayLogCopyWithImpl<_DayLog>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayLog&&(identical(other.date, date) || other.date == date)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.micros, micros) || other.micros == micros)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.age, age) || other.age == age));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,summary,micros,sex,age);
}

@override
String toString() {
    return 'DayLog(date: $date, summary: $summary, micros: $micros, sex: $sex, age: $age)';
}


}

/// @nodoc
abstract mixin class _$DayLogCopyWith<$Res> implements $DayLogCopyWith<$Res> {
  factory _$DayLogCopyWith(_DayLog value, $Res Function(_DayLog) _then) = __$DayLogCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, DailySummary summary, MicroIntake? micros, Sex? sex, int? age
});


@override $DailySummaryCopyWith<$Res> get summary;@override $MicroIntakeCopyWith<$Res>? get micros;

}
/// @nodoc
class __$DayLogCopyWithImpl<$Res>
    implements _$DayLogCopyWith<$Res> {
  __$DayLogCopyWithImpl(this._self, this._then);

  final _DayLog _self;
  final $Res Function(_DayLog) _then;

/// Create a copy of DayLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? summary = null,Object? micros = freezed,Object? sex = freezed,Object? age = freezed,}) {
  return _then(_DayLog(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as DailySummary,micros: freezed == micros ? _self.micros : micros // ignore: cast_nullable_to_non_nullable
as MicroIntake?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of DayLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailySummaryCopyWith<$Res> get summary {
  
  return $DailySummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of DayLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MicroIntakeCopyWith<$Res>? get micros {
    if (_self.micros == null) {
    return null;
  }

  return $MicroIntakeCopyWith<$Res>(_self.micros!, (value) {
    return _then(_self.copyWith(micros: value));
  });
}
}

// dart format on
