import 'package:uuid/uuid.dart';

class CreditCard {
  final String id;
  final String nomeCartao;
  final int diaVencimento;
  final int diaFechamento;
  double? limite;

  CreditCard({
    String? id,
    required this.nomeCartao,
    required this.diaVencimento,
    required this.diaFechamento,
    this.limite,
  }) : id = id ?? Uuid().v4();
}