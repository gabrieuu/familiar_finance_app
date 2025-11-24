class Purchase {
  final String purchaseId;
  final String title;
  final String type; // "fixed" | "parcel" | "credit"
  final double amount;
  final int totalInstallments;
  final String? buyerId;
  final String buyerName;
  final String? creditCardId;
  final DateTime startDate;

  Purchase({
    required this.purchaseId,
    required this.title,
    required this.type,
    required this.amount,
    required this.totalInstallments,
    this.buyerId,
    required this.buyerName,
    this.creditCardId,
    required this.startDate,
  });

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      purchaseId: map['purchaseId'],
      title: map['title'],
      type: map['type'],
      amount: map['amount'],
      totalInstallments: map['totalInstallments'],
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
      'totalInstallments': totalInstallments,
      'buyerId': buyerId,
      'buyerName': buyerName,
      'creditCardId': creditCardId,
      'startDate': startDate.toIso8601String(),
    };
  }

}
