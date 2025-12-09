class PurchaseDTO {
  final String purchaseId;
  final String title;
  final String type; // "fixed" | "parcel" | "credit"
  final double amount;
  final String? buyerId;
  final String buyerName;
  final String? creditCardId;
  final DateTime startDate;

  PurchaseDTO({
    required this.purchaseId,
    required this.title,
    required this.type,
    required this.amount,
    this.buyerId,
    required this.buyerName,
    this.creditCardId,
    required this.startDate,
  });


  factory PurchaseDTO.fromMap(Map<String, dynamic> map) {
    return PurchaseDTO(
      purchaseId: map['purchaseId'],
      title: map['title'],
      type: map['type'],
      amount: map['amount'],
      buyerId: map['buyerId'],
      buyerName: map['buyerName'],
      creditCardId: map['creditCardId'],
      startDate: DateTime.parse(map['startDate']),
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
      'startDate': startDate.toIso8601String(),
    };
  }
}