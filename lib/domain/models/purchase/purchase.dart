import 'package:familiar_finance_app/domain/models/installments/installments.dart';

class Purchase {
  final String? purchaseId;
  final String title;
  final String type; // "fixed" | "parcel" | "credit"
  final double amount;
  final String? buyerId;
  final String buyerName;
  final List<Installments> installments;
  final String? creditCardId;
  final DateTime? startDate;
  final bool isActive;

  Purchase({
    this.purchaseId,
    required this.title,
    required this.type,
    required this.amount,
    this.installments = const [],
    this.buyerId,
    required this.buyerName,
    this.creditCardId,
    this.startDate,
    this.isActive = true,
  });

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      purchaseId: map['purchaseId'],
      title: map['title'],
      type: map['type'],
      amount: map['amount'],
      buyerId: map['buyerId'],
      buyerName: map['buyerName'],
      creditCardId: map['creditCardId'],
      startDate: map['startDate'] != null ? DateTime.parse(map['startDate']) : null,
      installments: (map['installments'] as List<dynamic>).map((item) => Installments.fromMap(item)).toList(),
      isActive: map['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'purchaseId': purchaseId,
      'title': title,
      'type': type,
      'amount': amount,
      'buyerId': buyerId,
      'buyerName': buyerName,
      'creditCardId': creditCardId,
      'startDate': startDate?.toIso8601String(),
      'isActive': isActive,
    };
  }

  @override
  String toString() {
    return 'Purchase(purchaseId: $purchaseId, title: $title, type: $type, amount: $amount, buyerId: $buyerId, buyerName: $buyerName, creditCardId: $creditCardId, startDate: $startDate, installments: $installments, isActive: $isActive)';
  }

}
