class Installments {
  final String installmentId;   
  final String purchaseId;      
  final String month;          
  final int installmentNumber; 
  final double amount;          
  final String status;          

  Installments({
    required this.installmentId,
    required this.purchaseId,
    required this.month,
    required this.installmentNumber,
    required this.amount,
    required this.status,
  });

  factory Installments.fromMap(Map<String, dynamic> json) {
    return Installments(
      installmentId: json['installmentId'],
      purchaseId: json['purchaseId'],
      installmentNumber: json['installmentNumber'],
      month: json['month'],
      amount: json['amount'].toDouble(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'installmentId': installmentId,
      'purchaseId': purchaseId,
      'installmentNumber': installmentNumber,
      'month': month,
      'amount': amount,
      'status': status,
    };
  }
}