import 'package:uuid/uuid.dart';

class Installments {
  final String id;    
  final DateTime dueDate;
  final double amount;                

  Installments({
    String? id,
    required this.dueDate,
    required this.amount,
  }) : id = id ?? Uuid().v4();
}