import 'package:familiar_finance_app/app_widget.dart';
import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository_local.dart';
import 'package:familiar_finance_app/data/repositories/installments/installments_local_repository.dart';
import 'package:familiar_finance_app/data/repositories/installments/installments_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_local_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/ui/purchase/use_case/create_purchase_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
   runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<CreditCardRepository>(create: (context) => CreditcardLocalRepository()),
    RepositoryProvider<PurchaseRepository>(create: (context) => PurchaseLocalRepository()),
    RepositoryProvider<InstallmentsRepository>(create: (context) => InstallmentsLocalRepository()),
    RepositoryProvider<CreatePurchaseUsecase>(create: (context) => CreatePurchaseUsecase(context.read<PurchaseRepository>(), context.read<CreditCardRepository>()))
  ], child:  const AppWidget()));
}