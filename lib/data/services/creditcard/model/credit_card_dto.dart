class CreditCardDTO {
  String? id;
  int userId;
  String nomeCartao;
  String diaVencimento;
  double? limiteCredito;

  CreditCardDTO({
    this.id,
    required this.userId,
    required this.nomeCartao,
    required this.diaVencimento,
    this.limiteCredito,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'nomeCartao': nomeCartao,
      'diaVencimento': diaVencimento,
      'limiteCredito': limiteCredito,
    };
  }

  factory CreditCardDTO.fromJson(Map<String, dynamic> json) {
    return CreditCardDTO(
      id: json['id'],
      userId: json['userId'],
      nomeCartao: json['nomeCartao'],
      diaVencimento: json['diaVencimento'],
      limiteCredito: json['limiteCredito'],
    );
  }
}