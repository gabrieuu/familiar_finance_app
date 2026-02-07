import 'package:familiar_finance_app/domain/installments/installments.dart';
import 'package:uuid/uuid.dart';

class Purchase {
  final String id;
  final String? buyerId;
  final String? creditCardId;
  final String title;
  final TypePurchase type;
  final int numberOfInstallments;
  final List<Installments> installments;
  final double amount;
  final DateTime createdAt;
  final DateTime? finalizedAt;

  Purchase({
    String? id,
    this.buyerId,
    required this.title,
    required this.type,
    this.numberOfInstallments = 1,
    this.installments = const [],
    required this.amount,
    required this.creditCardId,
    required this.createdAt,
    this.finalizedAt,
  }): id = id ?? Uuid().v4();

  @override
  String toString() {
    return 'Purchase(id: $id, title: $title, type: $type, amount: $amount, creditCard: $creditCardId, createdAt: $createdAt)';
  }

  Purchase copyWith({
    String? id,
    String? buyerId,
    String? title,
    TypePurchase? type,
    int? numberOfInstallments,
    List<Installments>? installments,
    double? amount,
    String? creditCardId,
    DateTime? createdAt,
    DateTime? finalizedAt,
  }) {
    return Purchase(
      id: id ?? this.id,
      buyerId: buyerId ?? this.buyerId,
      title: title ?? this.title,
      type: type ?? this.type,
      numberOfInstallments: numberOfInstallments ?? this.numberOfInstallments,
      installments: installments ?? this.installments,
      amount: amount ?? this.amount,
      creditCardId: creditCardId ?? this.creditCardId,
      createdAt: createdAt ?? this.createdAt,
      finalizedAt: finalizedAt ?? this.finalizedAt,
    );
  }


}

enum TypePurchase {
  fixed,
  parcel,
  single;

  static TypePurchase fromString(String value) {
    switch (value) {
      case 'fixed':
        return TypePurchase.fixed;
      case 'parcel':
        return TypePurchase.parcel;
      case 'single':
        return TypePurchase.single;
      default:
        throw Exception('Invalid type purchase: $value');
    }
  }
}