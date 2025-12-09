import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/ui/purchase/bloc/purchase_bloc.dart';
import 'package:familiar_finance_app/ui/purchase/page/add_purchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PurchaseBloc(
          context.read<CreditCardRepository>(),
          context.read<PurchaseRepository>(),
        )),
      ],
      child: MaterialApp(
          home: CreatePurchase(),
      )
    );
  }
}