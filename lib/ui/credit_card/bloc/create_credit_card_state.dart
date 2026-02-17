enum CreateCreditCardStatus { initial, loading, success, failure }

class CreateCreditCardState {
  final CreateCreditCardStatus status;
  final String errorMessage;
  final String nomeCartao;
  final int diaVencimento;
  final int diaFechamento;
  final double? limite;

  const CreateCreditCardState({
    this.status = CreateCreditCardStatus.initial,
    this.errorMessage = '',
    this.nomeCartao = '',
    this.diaVencimento = 10,
    this.diaFechamento = 5,
    this.limite,
  });

  CreateCreditCardState copyWith({
    CreateCreditCardStatus? status,
    String? errorMessage,
    String? nomeCartao,
    int? diaVencimento,
    int? diaFechamento,
    double? limite,
  }) {
    return CreateCreditCardState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      nomeCartao: nomeCartao ?? this.nomeCartao,
      diaVencimento: diaVencimento ?? this.diaVencimento,
      diaFechamento: diaFechamento ?? this.diaFechamento,
      limite: limite ?? this.limite,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateCreditCardState &&
        other.status == status &&
        other.errorMessage == errorMessage &&
        other.nomeCartao == nomeCartao &&
        other.diaVencimento == diaVencimento &&
        other.diaFechamento == diaFechamento &&
        other.limite == limite;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        errorMessage.hashCode ^
        nomeCartao.hashCode ^
        diaVencimento.hashCode ^
        diaFechamento.hashCode ^
        limite.hashCode;
  }
}
