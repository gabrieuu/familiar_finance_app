import 'package:familiar_finance_app/data/repositories/auth/auth_repository.dart';
import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/data/repositories/installments/installments_repository.dart';
import 'package:familiar_finance_app/data/repositories/purchase/purchase_repository.dart';
import 'package:familiar_finance_app/ui/home/bloc/home_bloc.dart';
import 'package:familiar_finance_app/ui/home/page/home_page.dart';
import 'package:familiar_finance_app/ui/list_credit_card/bloc/list_credit_card_cubit.dart';
import 'package:familiar_finance_app/ui/list_purchase/bloc/purchase_list_cubit.dart';
import 'package:familiar_finance_app/ui/purchase/bloc/create_purchase_bloc.dart';
import 'package:familiar_finance_app/ui/purchase/use_case/create_purchase_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const Color _kPrimary = Color(0xFF0A84FF);
    const Color _kBackground = Color(0xFFF6F9FC);
    const Color _kSurface = Colors.white;
    const Color _kAccent = Color(0xFF34C759);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreatePurchaseBloc(
            context.read<CreditCardRepository>(),
            context.read<CreatePurchaseUsecase>(),
          ),
        ),
        BlocProvider(
          create: (context) => HomeBloc(
            context.read<AuthRepository>(),
            context.read<PurchaseRepository>(),
            context.read<InstallmentsRepository>(),
            context.read<CreditCardRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              PurchaseListCubit(context.read<PurchaseRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              ListCreditCardCubit(context.read<CreditCardRepository>()),
        ),
      ],
      // a cor predominante do app será a azul
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: _kPrimary,
            primary: _kPrimary,
            secondary: _kAccent,
            background: _kBackground,
            surface: _kSurface,
          ),
          primaryColor: _kPrimary,
          scaffoldBackgroundColor: _kBackground,
          appBarTheme: const AppBarTheme(
            backgroundColor: _kPrimary,
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: false,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: _kAccent,
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: _kPrimary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: _kSurface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          cardTheme: CardThemeData(
            color: _kSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
          ),
          textTheme: ThemeData.light().textTheme.apply(
            bodyColor: Colors.black87,
            displayColor: Colors.black87,
          ),
        ),
      ),
    );
  }
}
