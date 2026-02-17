import 'package:familiar_finance_app/app_widget.dart';
import 'package:familiar_finance_app/data/database/app_database.dart';
import 'package:familiar_finance_app/data/database/dao/creditcard_dao.dart';
import 'package:familiar_finance_app/data/database/dao/installment_dao.dart';
import 'package:familiar_finance_app/data/database/dao/purchase_dao.dart';
import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/data/repositories/installments/installments_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/data/services/purchase/purchase_service.dart';
import 'package:familiar_finance_app/ui/purchase/use_case/create_purchase_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppDatabase>(create: (context) => AppDatabase()),
        RepositoryProvider<CreditCardRepository>(
          create: (context) =>
              CreditCardRepository(CreditCardDao(context.read<AppDatabase>())),
        ),
        RepositoryProvider<PurchaseRepository>(
          create: (context) => PurchaseRepository(
            PurchaseServiceImpl(),
            PurchaseDao(context.read<AppDatabase>()),
          ),
        ),
        RepositoryProvider<InstallmentsRepository>(
          create: (context) => InstallmentsRepository(
            InstallmentDao(context.read<AppDatabase>()),
          ),
        ),
        RepositoryProvider<CreatePurchaseUsecase>(
          create: (context) => CreatePurchaseUsecase(
            context.read<PurchaseRepository>(),
            context.read<CreditCardRepository>(),
            context.read<InstallmentsRepository>(),
          ),
        ),
      ],
      child: const AppWidget(),
    ),
  );
}
