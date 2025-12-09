class CreditCard {
  final String cardId; 
  final String userId;
  final String nomeCartao;
  final String diaVencimento;
  double? limite;

  CreditCard({
    required this.cardId,
    required this.userId,
    required this.nomeCartao,
    required this.diaVencimento,
    this.limite,
  });

  Map<String, dynamic> toMap() {
    return {
      'cardId': cardId,
      'userId': userId,
      'nomeCartao': nomeCartao,
      'diaVencimento': diaVencimento,
      'limite': limite,
    };
  }

  factory CreditCard.fromMap(Map<String, dynamic> map) {
    return CreditCard(
      cardId: map['cardId'],
      userId: map['userId'],
      nomeCartao: map['nomeCartao'],
      diaVencimento: map['diaVencimento'],
      limite: map['limite'],
    );
  }
}