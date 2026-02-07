import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/ui/list_credit_card/bloc/credit_list_card_state.dart';
import 'package:familiar_finance_app/ui/list_credit_card/bloc/list_credit_card_cubit.dart';
import 'package:familiar_finance_app/ui/list_purchase/bloc/purchase_list_cubit.dart';
import 'package:familiar_finance_app/ui/list_purchase/bloc/purchase_list_state.dart';
import 'package:familiar_finance_app/ui/purchase/page/add_purchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final PurchaseListCubit purchaseListCubit;
  late final ListCreditCardCubit creditCardCubit;

  @override
  void initState() {
    super.initState();
    purchaseListCubit = context.read<PurchaseListCubit>();
    creditCardCubit = context.read<ListCreditCardCubit>();
    creditCardCubit.loadCreditCards();
    purchaseListCubit.start();
    purchaseListCubit.getPurchasesByMonth();
  }

  List<int> get mesesList => List.generate(12, (index) => index + 1);

  List<int> get anosList => List.generate(5, (index) => DateTime.now().year - index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add Purchase'),
        icon: const Icon(Icons.add),
        onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePurchase()));
        
      }),
      body: Column(
        children: [
          BlocBuilder<ListCreditCardCubit, CreditListCardState>(
            builder: (context, state) {
              return Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.creditCards.length,
                  itemBuilder: (context, index) {
                    final card = state.creditCards[index];
                    return Container(
                      width: 200,
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(card.nomeCartao, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Row(
            spacing: 2,
            children: [
              GestureDetector(
                onTap: () {
                  showMenu(context: context, items: mesesList.map((mes){
                    return PopupMenuItem(
                      child: Text(meses[mes]!),
                      onTap: () => purchaseListCubit.setSelectedDate(DateTime(purchaseListCubit.state.selectedDate.year, mes)),
                    );
                  }).toList(),
                  position: RelativeRect.fromLTRB(0, 80, 0, 0));
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                  ),
                  child: Text('Selecione o mes', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showMenu(context: context, items: anosList.map((ano){
                    return PopupMenuItem(
                      child: Text(ano.toString()),
                      onTap: () => purchaseListCubit.setSelectedDate(DateTime(ano, purchaseListCubit.state.selectedDate.month)),
                    );
                  }).toList(),
                  position: RelativeRect.fromLTRB(0, 80, 0, 0));
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                  ),
                  child: Text('Selecione o ano', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
          BlocBuilder<PurchaseListCubit, PurchaseListState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.purchases.length,
                  itemBuilder: (context, index) {
                    final purchase = state.purchases[index];
                    return ListTile(
                      title: Text(purchase.title),
                      subtitle: Text('Amount: ${purchase.amount}'),
                      trailing: Text('${_instalmentActual(purchase)}/${purchase.numberOfInstallments}')
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  int _instalmentActual(Purchase purchase) {
    if(purchase.installments.isEmpty) return 1;
    final installments = purchase.installments.where((i) => i.dueDate.month <= purchaseListCubit.state.selectedDate.month && i.dueDate.year <= purchaseListCubit.state.selectedDate.year).toList();
    return installments.length;
  }
}

Map<int, String> meses = {
  1: 'Janeiro',
  2: 'Fevereiro',
  3: 'Março',
  4: 'Abril',
  5: 'Maio',
  6: 'Junho',
  7: 'Julho',
  8: 'Agosto',
  9: 'Setembro',
  10: 'Outubro',
  11: 'Novembro',
  12: 'Dezembro'
};