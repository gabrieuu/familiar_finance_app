import 'dart:async';

import 'package:familiar_finance_app/data/repositories/auth/auth_repository.dart';
import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/data/repositories/installments/installments_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/domain/credit_card/credit_card.dart';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/domain/user/user.dart';
import 'package:familiar_finance_app/ui/home/bloc/home_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeBlocState>{
  HomeBloc(
    this.authRepository,
    this.purchaseRepository, 
    this.installmentsRepository, 
    this.creditCardRepository) : super(HomeBlocState.initial());

  final CreditCardRepository creditCardRepository;
  final PurchaseRepository purchaseRepository;
  final InstallmentsRepository installmentsRepository;
  final AuthRepository authRepository;

}