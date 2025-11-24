class Installments {
  final String installmentId;   
  final String purchaseId;      
  final String month;           
  final double amount;          
  final String status;          

  Installments({
    required this.installmentId,
    required this.purchaseId,
    required this.month,
    required this.amount,
    required this.status,
  });

  factory Installments.fromJson(Map<String, dynamic> json) {
    return Installments(
      installmentId: json['installmentId'],
      purchaseId: json['purchaseId'],
      month: json['month'],
      amount: json['amount'].toDouble(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'installmentId': installmentId,
      'purchaseId': purchaseId,
      'month': month,
      'amount': amount,
      'status': status,
    };
  }
}