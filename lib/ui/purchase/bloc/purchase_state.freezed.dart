// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseCreateState implements DiagnosticableTreeMixin {

 List<CreditCard> get creditCards; bool get cardsLoading; bool get isLoading; Purchase? get initialPurchase; String? get errorMessage; String? get cardSelectedId; String? get title; String? get buyerName; double? get amount; int get installments; DateTime? get purchaseDate; bool get isFixed; bool get isInstallment;
/// Create a copy of PurchaseCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseCreateStateCopyWith<PurchaseCreateState> get copyWith => _$PurchaseCreateStateCopyWithImpl<PurchaseCreateState>(this as PurchaseCreateState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PurchaseCreateState'))
    ..add(DiagnosticsProperty('creditCards', creditCards))..add(DiagnosticsProperty('cardsLoading', cardsLoading))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('initialPurchase', initialPurchase))..add(DiagnosticsProperty('errorMessage', errorMessage))..add(DiagnosticsProperty('cardSelectedId', cardSelectedId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('buyerName', buyerName))..add(DiagnosticsProperty('amount', amount))..add(DiagnosticsProperty('installments', installments))..add(DiagnosticsProperty('purchaseDate', purchaseDate))..add(DiagnosticsProperty('isFixed', isFixed))..add(DiagnosticsProperty('isInstallment', isInstallment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseCreateState&&const DeepCollectionEquality().equals(other.creditCards, creditCards)&&(identical(other.cardsLoading, cardsLoading) || other.cardsLoading == cardsLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.initialPurchase, initialPurchase) || other.initialPurchase == initialPurchase)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.cardSelectedId, cardSelectedId) || other.cardSelectedId == cardSelectedId)&&(identical(other.title, title) || other.title == title)&&(identical(other.buyerName, buyerName) || other.buyerName == buyerName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.installments, installments) || other.installments == installments)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.isFixed, isFixed) || other.isFixed == isFixed)&&(identical(other.isInstallment, isInstallment) || other.isInstallment == isInstallment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(creditCards),cardsLoading,isLoading,initialPurchase,errorMessage,cardSelectedId,title,buyerName,amount,installments,purchaseDate,isFixed,isInstallment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PurchaseCreateState(creditCards: $creditCards, cardsLoading: $cardsLoading, isLoading: $isLoading, initialPurchase: $initialPurchase, errorMessage: $errorMessage, cardSelectedId: $cardSelectedId, title: $title, buyerName: $buyerName, amount: $amount, installments: $installments, purchaseDate: $purchaseDate, isFixed: $isFixed, isInstallment: $isInstallment)';
}


}

/// @nodoc
abstract mixin class $PurchaseCreateStateCopyWith<$Res>  {
  factory $PurchaseCreateStateCopyWith(PurchaseCreateState value, $Res Function(PurchaseCreateState) _then) = _$PurchaseCreateStateCopyWithImpl;
@useResult
$Res call({
 List<CreditCard> creditCards, bool cardsLoading, bool isLoading, Purchase? initialPurchase, String? errorMessage, String? cardSelectedId, String? title, String? buyerName, double? amount, int installments, DateTime? purchaseDate, bool isFixed, bool isInstallment
});




}
/// @nodoc
class _$PurchaseCreateStateCopyWithImpl<$Res>
    implements $PurchaseCreateStateCopyWith<$Res> {
  _$PurchaseCreateStateCopyWithImpl(this._self, this._then);

  final PurchaseCreateState _self;
  final $Res Function(PurchaseCreateState) _then;

/// Create a copy of PurchaseCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? creditCards = null,Object? cardsLoading = null,Object? isLoading = null,Object? initialPurchase = freezed,Object? errorMessage = freezed,Object? cardSelectedId = freezed,Object? title = freezed,Object? buyerName = freezed,Object? amount = freezed,Object? installments = null,Object? purchaseDate = freezed,Object? isFixed = null,Object? isInstallment = null,}) {
  return _then(_self.copyWith(
creditCards: null == creditCards ? _self.creditCards : creditCards // ignore: cast_nullable_to_non_nullable
as List<CreditCard>,cardsLoading: null == cardsLoading ? _self.cardsLoading : cardsLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,initialPurchase: freezed == initialPurchase ? _self.initialPurchase : initialPurchase // ignore: cast_nullable_to_non_nullable
as Purchase?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,cardSelectedId: freezed == cardSelectedId ? _self.cardSelectedId : cardSelectedId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,buyerName: freezed == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,installments: null == installments ? _self.installments : installments // ignore: cast_nullable_to_non_nullable
as int,purchaseDate: freezed == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isFixed: null == isFixed ? _self.isFixed : isFixed // ignore: cast_nullable_to_non_nullable
as bool,isInstallment: null == isInstallment ? _self.isInstallment : isInstallment // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseCreateState].
extension PurchaseCreateStatePatterns on PurchaseCreateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseCreateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseCreateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseCreateState value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseCreateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseCreateState value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseCreateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CreditCard> creditCards,  bool cardsLoading,  bool isLoading,  Purchase? initialPurchase,  String? errorMessage,  String? cardSelectedId,  String? title,  String? buyerName,  double? amount,  int installments,  DateTime? purchaseDate,  bool isFixed,  bool isInstallment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseCreateState() when $default != null:
return $default(_that.creditCards,_that.cardsLoading,_that.isLoading,_that.initialPurchase,_that.errorMessage,_that.cardSelectedId,_that.title,_that.buyerName,_that.amount,_that.installments,_that.purchaseDate,_that.isFixed,_that.isInstallment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CreditCard> creditCards,  bool cardsLoading,  bool isLoading,  Purchase? initialPurchase,  String? errorMessage,  String? cardSelectedId,  String? title,  String? buyerName,  double? amount,  int installments,  DateTime? purchaseDate,  bool isFixed,  bool isInstallment)  $default,) {final _that = this;
switch (_that) {
case _PurchaseCreateState():
return $default(_that.creditCards,_that.cardsLoading,_that.isLoading,_that.initialPurchase,_that.errorMessage,_that.cardSelectedId,_that.title,_that.buyerName,_that.amount,_that.installments,_that.purchaseDate,_that.isFixed,_that.isInstallment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CreditCard> creditCards,  bool cardsLoading,  bool isLoading,  Purchase? initialPurchase,  String? errorMessage,  String? cardSelectedId,  String? title,  String? buyerName,  double? amount,  int installments,  DateTime? purchaseDate,  bool isFixed,  bool isInstallment)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseCreateState() when $default != null:
return $default(_that.creditCards,_that.cardsLoading,_that.isLoading,_that.initialPurchase,_that.errorMessage,_that.cardSelectedId,_that.title,_that.buyerName,_that.amount,_that.installments,_that.purchaseDate,_that.isFixed,_that.isInstallment);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseCreateState with DiagnosticableTreeMixin implements PurchaseCreateState {
  const _PurchaseCreateState({final  List<CreditCard> creditCards = const [], this.cardsLoading = false, this.isLoading = false, this.initialPurchase, this.errorMessage, this.cardSelectedId, this.title, this.buyerName, this.amount, this.installments = 1, this.purchaseDate, this.isFixed = false, this.isInstallment = false}): _creditCards = creditCards;
  

 final  List<CreditCard> _creditCards;
@override@JsonKey() List<CreditCard> get creditCards {
  if (_creditCards is EqualUnmodifiableListView) return _creditCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creditCards);
}

@override@JsonKey() final  bool cardsLoading;
@override@JsonKey() final  bool isLoading;
@override final  Purchase? initialPurchase;
@override final  String? errorMessage;
@override final  String? cardSelectedId;
@override final  String? title;
@override final  String? buyerName;
@override final  double? amount;
@override@JsonKey() final  int installments;
@override final  DateTime? purchaseDate;
@override@JsonKey() final  bool isFixed;
@override@JsonKey() final  bool isInstallment;

/// Create a copy of PurchaseCreateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseCreateStateCopyWith<_PurchaseCreateState> get copyWith => __$PurchaseCreateStateCopyWithImpl<_PurchaseCreateState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PurchaseCreateState'))
    ..add(DiagnosticsProperty('creditCards', creditCards))..add(DiagnosticsProperty('cardsLoading', cardsLoading))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('initialPurchase', initialPurchase))..add(DiagnosticsProperty('errorMessage', errorMessage))..add(DiagnosticsProperty('cardSelectedId', cardSelectedId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('buyerName', buyerName))..add(DiagnosticsProperty('amount', amount))..add(DiagnosticsProperty('installments', installments))..add(DiagnosticsProperty('purchaseDate', purchaseDate))..add(DiagnosticsProperty('isFixed', isFixed))..add(DiagnosticsProperty('isInstallment', isInstallment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseCreateState&&const DeepCollectionEquality().equals(other._creditCards, _creditCards)&&(identical(other.cardsLoading, cardsLoading) || other.cardsLoading == cardsLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.initialPurchase, initialPurchase) || other.initialPurchase == initialPurchase)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.cardSelectedId, cardSelectedId) || other.cardSelectedId == cardSelectedId)&&(identical(other.title, title) || other.title == title)&&(identical(other.buyerName, buyerName) || other.buyerName == buyerName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.installments, installments) || other.installments == installments)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.isFixed, isFixed) || other.isFixed == isFixed)&&(identical(other.isInstallment, isInstallment) || other.isInstallment == isInstallment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_creditCards),cardsLoading,isLoading,initialPurchase,errorMessage,cardSelectedId,title,buyerName,amount,installments,purchaseDate,isFixed,isInstallment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PurchaseCreateState(creditCards: $creditCards, cardsLoading: $cardsLoading, isLoading: $isLoading, initialPurchase: $initialPurchase, errorMessage: $errorMessage, cardSelectedId: $cardSelectedId, title: $title, buyerName: $buyerName, amount: $amount, installments: $installments, purchaseDate: $purchaseDate, isFixed: $isFixed, isInstallment: $isInstallment)';
}


}

/// @nodoc
abstract mixin class _$PurchaseCreateStateCopyWith<$Res> implements $PurchaseCreateStateCopyWith<$Res> {
  factory _$PurchaseCreateStateCopyWith(_PurchaseCreateState value, $Res Function(_PurchaseCreateState) _then) = __$PurchaseCreateStateCopyWithImpl;
@override @useResult
$Res call({
 List<CreditCard> creditCards, bool cardsLoading, bool isLoading, Purchase? initialPurchase, String? errorMessage, String? cardSelectedId, String? title, String? buyerName, double? amount, int installments, DateTime? purchaseDate, bool isFixed, bool isInstallment
});




}
/// @nodoc
class __$PurchaseCreateStateCopyWithImpl<$Res>
    implements _$PurchaseCreateStateCopyWith<$Res> {
  __$PurchaseCreateStateCopyWithImpl(this._self, this._then);

  final _PurchaseCreateState _self;
  final $Res Function(_PurchaseCreateState) _then;

/// Create a copy of PurchaseCreateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? creditCards = null,Object? cardsLoading = null,Object? isLoading = null,Object? initialPurchase = freezed,Object? errorMessage = freezed,Object? cardSelectedId = freezed,Object? title = freezed,Object? buyerName = freezed,Object? amount = freezed,Object? installments = null,Object? purchaseDate = freezed,Object? isFixed = null,Object? isInstallment = null,}) {
  return _then(_PurchaseCreateState(
creditCards: null == creditCards ? _self._creditCards : creditCards // ignore: cast_nullable_to_non_nullable
as List<CreditCard>,cardsLoading: null == cardsLoading ? _self.cardsLoading : cardsLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,initialPurchase: freezed == initialPurchase ? _self.initialPurchase : initialPurchase // ignore: cast_nullable_to_non_nullable
as Purchase?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,cardSelectedId: freezed == cardSelectedId ? _self.cardSelectedId : cardSelectedId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,buyerName: freezed == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,installments: null == installments ? _self.installments : installments // ignore: cast_nullable_to_non_nullable
as int,purchaseDate: freezed == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isFixed: null == isFixed ? _self.isFixed : isFixed // ignore: cast_nullable_to_non_nullable
as bool,isInstallment: null == isInstallment ? _self.isInstallment : isInstallment // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
