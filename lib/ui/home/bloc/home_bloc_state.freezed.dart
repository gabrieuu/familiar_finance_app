// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeBlocState {

 bool get isLoading; String? get errorMessage; User? get user; List<CreditCard> get creditCards; List<Purchase> get purchases;
/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeBlocStateCopyWith<HomeBlocState> get copyWith => _$HomeBlocStateCopyWithImpl<HomeBlocState>(this as HomeBlocState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeBlocState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.creditCards, creditCards)&&const DeepCollectionEquality().equals(other.purchases, purchases));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,user,const DeepCollectionEquality().hash(creditCards),const DeepCollectionEquality().hash(purchases));

@override
String toString() {
  return 'HomeBlocState(isLoading: $isLoading, errorMessage: $errorMessage, user: $user, creditCards: $creditCards, purchases: $purchases)';
}


}

/// @nodoc
abstract mixin class $HomeBlocStateCopyWith<$Res>  {
  factory $HomeBlocStateCopyWith(HomeBlocState value, $Res Function(HomeBlocState) _then) = _$HomeBlocStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? errorMessage, User? user, List<CreditCard> creditCards, List<Purchase> purchases
});




}
/// @nodoc
class _$HomeBlocStateCopyWithImpl<$Res>
    implements $HomeBlocStateCopyWith<$Res> {
  _$HomeBlocStateCopyWithImpl(this._self, this._then);

  final HomeBlocState _self;
  final $Res Function(HomeBlocState) _then;

/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? user = freezed,Object? creditCards = null,Object? purchases = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,creditCards: null == creditCards ? _self.creditCards : creditCards // ignore: cast_nullable_to_non_nullable
as List<CreditCard>,purchases: null == purchases ? _self.purchases : purchases // ignore: cast_nullable_to_non_nullable
as List<Purchase>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeBlocState].
extension HomeBlocStatePatterns on HomeBlocState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeBlocState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeBlocState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeBlocState value)  $default,){
final _that = this;
switch (_that) {
case _HomeBlocState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeBlocState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeBlocState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  User? user,  List<CreditCard> creditCards,  List<Purchase> purchases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeBlocState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.user,_that.creditCards,_that.purchases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  User? user,  List<CreditCard> creditCards,  List<Purchase> purchases)  $default,) {final _that = this;
switch (_that) {
case _HomeBlocState():
return $default(_that.isLoading,_that.errorMessage,_that.user,_that.creditCards,_that.purchases);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? errorMessage,  User? user,  List<CreditCard> creditCards,  List<Purchase> purchases)?  $default,) {final _that = this;
switch (_that) {
case _HomeBlocState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.user,_that.creditCards,_that.purchases);case _:
  return null;

}
}

}

/// @nodoc


class _HomeBlocState implements HomeBlocState {
  const _HomeBlocState({this.isLoading = false, this.errorMessage, this.user, final  List<CreditCard> creditCards = const [], final  List<Purchase> purchases = const []}): _creditCards = creditCards,_purchases = purchases;
  

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override final  User? user;
 final  List<CreditCard> _creditCards;
@override@JsonKey() List<CreditCard> get creditCards {
  if (_creditCards is EqualUnmodifiableListView) return _creditCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creditCards);
}

 final  List<Purchase> _purchases;
@override@JsonKey() List<Purchase> get purchases {
  if (_purchases is EqualUnmodifiableListView) return _purchases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_purchases);
}


/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeBlocStateCopyWith<_HomeBlocState> get copyWith => __$HomeBlocStateCopyWithImpl<_HomeBlocState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeBlocState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._creditCards, _creditCards)&&const DeepCollectionEquality().equals(other._purchases, _purchases));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,user,const DeepCollectionEquality().hash(_creditCards),const DeepCollectionEquality().hash(_purchases));

@override
String toString() {
  return 'HomeBlocState(isLoading: $isLoading, errorMessage: $errorMessage, user: $user, creditCards: $creditCards, purchases: $purchases)';
}


}

/// @nodoc
abstract mixin class _$HomeBlocStateCopyWith<$Res> implements $HomeBlocStateCopyWith<$Res> {
  factory _$HomeBlocStateCopyWith(_HomeBlocState value, $Res Function(_HomeBlocState) _then) = __$HomeBlocStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? errorMessage, User? user, List<CreditCard> creditCards, List<Purchase> purchases
});




}
/// @nodoc
class __$HomeBlocStateCopyWithImpl<$Res>
    implements _$HomeBlocStateCopyWith<$Res> {
  __$HomeBlocStateCopyWithImpl(this._self, this._then);

  final _HomeBlocState _self;
  final $Res Function(_HomeBlocState) _then;

/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? user = freezed,Object? creditCards = null,Object? purchases = null,}) {
  return _then(_HomeBlocState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,creditCards: null == creditCards ? _self._creditCards : creditCards // ignore: cast_nullable_to_non_nullable
as List<CreditCard>,purchases: null == purchases ? _self._purchases : purchases // ignore: cast_nullable_to_non_nullable
as List<Purchase>,
  ));
}


}

// dart format on
