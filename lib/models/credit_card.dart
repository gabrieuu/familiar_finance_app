class CreditCard {
  final String userId;
  final String nomeCartao;
  final String dataVencimento;
  final double limite;

  CreditCard({
    required this.userId,
    required this.nomeCartao,
    required this.dataVencimento,
    required this.limite,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'nomeCartao': nomeCartao,
      'dataVencimento': dataVencimento,
      'limite': limite,
    };
  }

  factory CreditCard.fromMap(Map<String, dynamic> map) {
    return CreditCard(
      userId: map['userId'],
      nomeCartao: map['nomeCartao'],
      dataVencimento: map['dataVencimento'],
      limite: map['limite'],
    );
  }
}