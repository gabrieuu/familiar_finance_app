import 'dart:developer';
import 'package:familiar_finance_app/ui/purchase/bloc/purchase_bloc.dart';
import 'package:familiar_finance_app/ui/purchase/bloc/purchase_state.dart';
import 'package:familiar_finance_app/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Small design system / palette for this view.
const Color _kPrimary = Color(0xFF0A84FF);
const Color _kBackground = Color(0xFFF6F9FC);
const Color _kSurface = Colors.white;

class CreatePurchase extends StatefulWidget {
  const CreatePurchase({super.key});
  
  @override
  State<CreatePurchase> createState() => _CreatePurchaseState();
}

class _CreatePurchaseState extends State<CreatePurchase> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _buyerNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _buyerNameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({required String label, IconData? icon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon, color: _kPrimary) : null,
      filled: true,
      fillColor: _kSurface,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PurchaseBloc>();
    return Scaffold(
      backgroundColor: _kBackground,
      appBar: AppBar(
        title: const Text('Create Purchase'),
        backgroundColor: _kPrimary,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: _kSurface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Card selector
                      BlocBuilder<PurchaseBloc, PurchaseCreateState>(
                        bloc: bloc,
                        buildWhen: (previous, current) {
                          return previous.creditCards != current.creditCards;
                        },
                        builder: (context, state) {
                          if(state.creditCards.isEmpty){
                            return const Text('No credit cards available. Please add a credit card first.', style: TextStyle(color: Colors.redAccent),);
                          }
                          return DropdownButtonFormField<String>(
                            initialValue: state.cardSelectedId ?? state.creditCards.first.cardId,
                            menuMaxHeight: 100,
                            decoration: _inputDecoration(label: 'Card', icon: Icons.credit_card),
                            items: (state.creditCards.isNotEmpty) ? state.creditCards.map((c) => DropdownMenuItem(value: c.cardId, child: Text(c.nomeCartao))).toList() : [],
                            onChanged: (val){
                              if(val == null) return;
                              log(val);
                              bloc.setSelectedCardId(val);
                            },
                          );
                        }
                      ),
                      const SizedBox(height: 12.0),

                      // Title
                      TextFormField(
                        controller: _titleController,
                        decoration: _inputDecoration(label: 'Title', icon: Icons.notes),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter a title' : null,
                        onChanged: bloc.setTitle,
                      ),
                      const SizedBox(height: 12.0),
                      // Buyer name
                      TextFormField(
                        controller: _buyerNameController,
                        decoration: _inputDecoration(label: 'Buyer name (optional)', icon: Icons.person),
                        onChanged: bloc.setBuyerName,
                      ),
                      const SizedBox(height: 12.0),

                      // Amount
                      TextFormField(
                        controller: _amountController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: _inputDecoration(label: 'Amount', icon: Icons.attach_money),
                        inputFormatters: [
                          CurrencyInputFormatter(),
                        ],
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) return 'Enter an amount';
                          final a = double.tryParse(v.replaceAll(',', '.'));
                          if (a == null || a <= 0) return 'Enter a valid amount';
                          return null;
                        },
                        onChanged: (value){
                          final amount = double.tryParse(value.replaceAll('.', '').replaceAll(',', '.'));
                          bloc.setAmount(amount ?? 0);
                        },
                      ),
                      // Fixed / Installment toggles
                      Column(
                        children: [
                          BlocBuilder<PurchaseBloc, PurchaseCreateState>(
                            bloc: bloc,
                            builder: (context, state) {
                              return SwitchListTile(
                                title: const Text('Fixed'),
                                value: state.isFixed,
                                activeThumbColor: _kPrimary,
                                inactiveThumbColor: _kPrimary,
                                inactiveTrackColor: _kSurface,
                                onChanged: (val) {  
                                  if(bloc.state.isInstallment && val){
                                    bloc.setIsInstallment();
                                  }
                                  bloc.setIsFixed();
                                },
                              );
                            }
                          ),
                          BlocBuilder<PurchaseBloc, PurchaseCreateState>(
                            bloc: bloc,
                            builder: (context, state) {
                              if(state.isFixed){
                                return const SizedBox.shrink();
                              }
                              return SwitchListTile(
                                title: const Text('Installment'),
                                value: state.isInstallment,
                                activeThumbColor: _kPrimary,
                                inactiveThumbColor: _kPrimary,
                                inactiveTrackColor: _kSurface,
                                onChanged: (val) {  
                                   if(bloc.state.isFixed && val){
                                    bloc.setIsFixed();
                                  }
                                  bloc.setIsInstallment();
                                },
                              );
                            }
                          ),
                        ],                      ),
                      const SizedBox(height: 12.0),
                      // Installments and Date row
                      BlocBuilder<PurchaseBloc, PurchaseCreateState>(
                        bloc: bloc,
                        buildWhen: (previous, current) {
                          return previous.isInstallment != current.isInstallment;
                        },
                        builder: (context, state) {
                          if(state.isInstallment == false){
                            return const SizedBox.shrink();
                          }
                          return Row(
                            children: [
                              Expanded(
                                child: BlocBuilder<PurchaseBloc, PurchaseCreateState>(
                                  bloc: bloc,
                                  builder: (context, state) {
                                    return DropdownButtonFormField<int>(
                                      initialValue: state.installments ?? 1,
                                      decoration: _inputDecoration(label: 'Installments', icon: Icons.filter_1),
                                      items: List.generate(100, (i) => i + 1).map((i) => DropdownMenuItem(value: i, child: Text('${i}x'))).toList(),
                                      onChanged: (v) => bloc.setInstallments,
                                    );
                                  }
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: InkWell(
                                  onTap: (){},
                                  child: InputDecorator(
                                    decoration: _inputDecoration(label: 'Date', icon: Icons.date_range),
                                    child: BlocBuilder<PurchaseBloc, PurchaseCreateState>(
                                      bloc: bloc,
                                      builder: (context, state) {
                                         DateTime selectedDate = state.purchaseDate ?? DateTime.now();
                                        return Text(
                                          selectedDate.toLocal().toIso8601String().split('T').first,
                                          style: const TextStyle(fontSize: 16.0),
                                        );
                                      }
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      ),
                      const SizedBox(height: 16.0),

                      // Action buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                               
                              },
                              child: const Text('Reset'),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: (){
                                if(_formKey.currentState?.validate() != true){
                                  return;
                                }
                                bloc.addPurchase();
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: _kPrimary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14.0)),
                              child: const Text('Save Purchase', style: TextStyle(fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            // Small hint / design note
            Text(
              'Tip: choose the card used and set installments. Dates help group purchases.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}