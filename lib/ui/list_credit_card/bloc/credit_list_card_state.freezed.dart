// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_list_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreditListCardState {

 List<CreditCard> get creditCards; String? get errorMessage; bool get isLoading;
/// Create a copy of CreditListCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditListCardStateCopyWith<CreditListCardState> get copyWith => _$CreditListCardStateCopyWithImpl<CreditListCardState>(this as CreditListCardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditListCardState&&const DeepCollectionEquality().equals(other.creditCards, creditCards)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(creditCards),errorMessage,isLoading);

@override
String toString() {
  return 'CreditListCardState(creditCards: $creditCards, errorMessage: $errorMessage, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $CreditListCardStateCopyWith<$Res>  {
  factory $CreditListCardStateCopyWith(CreditListCardState value, $Res Function(CreditListCardState) _then) = _$CreditListCardStateCopyWithImpl;
@useResult
$Res call({
 List<CreditCard> creditCards, String? errorMessage, bool isLoading
});




}
/// @nodoc
class _$CreditListCardStateCopyWithImpl<$Res>
    implements $CreditListCardStateCopyWith<$Res> {
  _$CreditListCardStateCopyWithImpl(this._self, this._then);

  final CreditListCardState _self;
  final $Res Function(CreditListCardState) _then;

/// Create a copy of CreditListCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? creditCards = null,Object? errorMessage = freezed,Object? isLoading = null,}) {
  return _then(_self.copyWith(
creditCards: null == creditCards ? _self.creditCards : creditCards // ignore: cast_nullable_to_non_nullable
as List<CreditCard>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditListCardState].
extension CreditListCardStatePatterns on CreditListCardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditListCardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditListCardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditListCardState value)  $default,){
final _that = this;
switch (_that) {
case _CreditListCardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditListCardState value)?  $default,){
final _that = this;
switch (_that) {
case _CreditListCardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CreditCard> creditCards,  String? errorMessage,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditListCardState() when $default != null:
return $default(_that.creditCards,_that.errorMessage,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CreditCard> creditCards,  String? errorMessage,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _CreditListCardState():
return $default(_that.creditCards,_that.errorMessage,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CreditCard> creditCards,  String? errorMessage,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _CreditListCardState() when $default != null:
return $default(_that.creditCards,_that.errorMessage,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _CreditListCardState implements CreditListCardState {
  const _CreditListCardState({final  List<CreditCard> creditCards = const [], this.errorMessage, this.isLoading = false}): _creditCards = creditCards;
  

 final  List<CreditCard> _creditCards;
@override@JsonKey() List<CreditCard> get creditCards {
  if (_creditCards is EqualUnmodifiableListView) return _creditCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creditCards);
}

@override final  String? errorMessage;
@override@JsonKey() final  bool isLoading;

/// Create a copy of CreditListCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditListCardStateCopyWith<_CreditListCardState> get copyWith => __$CreditListCardStateCopyWithImpl<_CreditListCardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditListCardState&&const DeepCollectionEquality().equals(other._creditCards, _creditCards)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_creditCards),errorMessage,isLoading);

@override
String toString() {
  return 'CreditListCardState(creditCards: $creditCards, errorMessage: $errorMessage, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$CreditListCardStateCopyWith<$Res> implements $CreditListCardStateCopyWith<$Res> {
  factory _$CreditListCardStateCopyWith(_CreditListCardState value, $Res Function(_CreditListCardState) _then) = __$CreditListCardStateCopyWithImpl;
@override @useResult
$Res call({
 List<CreditCard> creditCards, String? errorMessage, bool isLoading
});




}
/// @nodoc
class __$CreditListCardStateCopyWithImpl<$Res>
    implements _$CreditListCardStateCopyWith<$Res> {
  __$CreditListCardStateCopyWithImpl(this._self, this._then);

  final _CreditListCardState _self;
  final $Res Function(_CreditListCardState) _then;

/// Create a copy of CreditListCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? creditCards = null,Object? errorMessage = freezed,Object? isLoading = null,}) {
  return _then(_CreditListCardState(
creditCards: null == creditCards ? _self._creditCards : creditCards // ignore: cast_nullable_to_non_nullable
as List<CreditCard>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
