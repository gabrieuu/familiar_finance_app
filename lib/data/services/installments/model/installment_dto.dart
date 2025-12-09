class InstallmentDTO {
  final String installmentId;
  final String purchaseId;
  final int installmentNumber;
  final String month;
  final double amount;
  final bool isPaid;

  InstallmentDTO({
    required this.installmentId,
    required this.purchaseId,
    required this.installmentNumber,
    required this.month,
    required this.amount,
    required this.isPaid,
  });

  factory InstallmentDTO.fromMap(Map<String, dynamic> map) {
    return InstallmentDTO(
      installmentId: map['installmentId'],
      purchaseId: map['purchaseId'],
      installmentNumber: map['installmentNumber'],
      month: map['month'],
      amount: map['amount'],
      isPaid: map['isPaid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'installmentId': installmentId,
      'purchaseId': purchaseId,
      'installmentNumber': installmentNumber,
      'month': month,
      'amount': amount,
      'isPaid': isPaid,
    };
}
}