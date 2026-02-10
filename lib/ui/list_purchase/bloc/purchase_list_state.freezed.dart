// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseListState {

 List<Purchase> get purchases; bool get isLoading; String? get errorMessage; DateTime get selectedDate;
/// Create a copy of PurchaseListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseListStateCopyWith<PurchaseListState> get copyWith => _$PurchaseListStateCopyWithImpl<PurchaseListState>(this as PurchaseListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseListState&&const DeepCollectionEquality().equals(other.purchases, purchases)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(purchases),isLoading,errorMessage,selectedDate);

@override
String toString() {
  return 'PurchaseListState(purchases: $purchases, isLoading: $isLoading, errorMessage: $errorMessage, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class $PurchaseListStateCopyWith<$Res>  {
  factory $PurchaseListStateCopyWith(PurchaseListState value, $Res Function(PurchaseListState) _then) = _$PurchaseListStateCopyWithImpl;
@useResult
$Res call({
 List<Purchase> purchases, bool isLoading, String? errorMessage, DateTime selectedDate
});




}
/// @nodoc
class _$PurchaseListStateCopyWithImpl<$Res>
    implements $PurchaseListStateCopyWith<$Res> {
  _$PurchaseListStateCopyWithImpl(this._self, this._then);

  final PurchaseListState _self;
  final $Res Function(PurchaseListState) _then;

/// Create a copy of PurchaseListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? purchases = null,Object? isLoading = null,Object? errorMessage = freezed,Object? selectedDate = null,}) {
  return _then(_self.copyWith(
purchases: null == purchases ? _self.purchases : purchases // ignore: cast_nullable_to_non_nullable
as List<Purchase>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseListState].
extension PurchaseListStatePatterns on PurchaseListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseListState value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseListState value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Purchase> purchases,  bool isLoading,  String? errorMessage,  DateTime selectedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseListState() when $default != null:
return $default(_that.purchases,_that.isLoading,_that.errorMessage,_that.selectedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Purchase> purchases,  bool isLoading,  String? errorMessage,  DateTime selectedDate)  $default,) {final _that = this;
switch (_that) {
case _PurchaseListState():
return $default(_that.purchases,_that.isLoading,_that.errorMessage,_that.selectedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Purchase> purchases,  bool isLoading,  String? errorMessage,  DateTime selectedDate)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseListState() when $default != null:
return $default(_that.purchases,_that.isLoading,_that.errorMessage,_that.selectedDate);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseListState implements PurchaseListState {
  const _PurchaseListState({final  List<Purchase> purchases = const [], this.isLoading = false, this.errorMessage, required this.selectedDate}): _purchases = purchases;
  

 final  List<Purchase> _purchases;
@override@JsonKey() List<Purchase> get purchases {
  if (_purchases is EqualUnmodifiableListView) return _purchases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_purchases);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override final  DateTime selectedDate;

/// Create a copy of PurchaseListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseListStateCopyWith<_PurchaseListState> get copyWith => __$PurchaseListStateCopyWithImpl<_PurchaseListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseListState&&const DeepCollectionEquality().equals(other._purchases, _purchases)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_purchases),isLoading,errorMessage,selectedDate);

@override
String toString() {
  return 'PurchaseListState(purchases: $purchases, isLoading: $isLoading, errorMessage: $errorMessage, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class _$PurchaseListStateCopyWith<$Res> implements $PurchaseListStateCopyWith<$Res> {
  factory _$PurchaseListStateCopyWith(_PurchaseListState value, $Res Function(_PurchaseListState) _then) = __$PurchaseListStateCopyWithImpl;
@override @useResult
$Res call({
 List<Purchase> purchases, bool isLoading, String? errorMessage, DateTime selectedDate
});




}
/// @nodoc
class __$PurchaseListStateCopyWithImpl<$Res>
    implements _$PurchaseListStateCopyWith<$Res> {
  __$PurchaseListStateCopyWithImpl(this._self, this._then);

  final _PurchaseListState _self;
  final $Res Function(_PurchaseListState) _then;

/// Create a copy of PurchaseListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purchases = null,Object? isLoading = null,Object? errorMessage = freezed,Object? selectedDate = null,}) {
  return _then(_PurchaseListState(
purchases: null == purchases ? _self._purchases : purchases // ignore: cast_nullable_to_non_nullable
as List<Purchase>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
