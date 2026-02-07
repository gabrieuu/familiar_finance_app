import 'dart:developer';
import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/ui/purchase/bloc/create_purchase_bloc.dart';
import 'package:familiar_finance_app/ui/purchase/bloc/purchase_state.dart';
import 'package:familiar_finance_app/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Small design system / palette for this view.
const Color _kPrimary = Color(0xFF0A84FF);
const Color _kBackground = Color(0xFFF6F9FC);
const Color _kSurface = Colors.white;

class CreatePurchase extends StatefulWidget {
  const CreatePurchase({super.key, this.purchase});
  final Purchase? purchase;

  @override
  State<CreatePurchase> createState() => _CreatePurchaseState();
}

class _CreatePurchaseState extends State<CreatePurchase> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _buyerNameController;
  late final TextEditingController _amountController;
  
  @override
  void initState() {
    super.initState();
    if(widget.purchase != null){
      final bloc = context.read<CreatePurchaseBloc>();
      bloc.loadForEdit(widget.purchase!);
    }
    _titleController = TextEditingController(text: widget.purchase?.title ?? '');
    _buyerNameController = TextEditingController(text: '');
    _amountController = TextEditingController(text: widget.purchase?.amount.toString() ?? '');
  
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
    final bloc = context.watch<CreatePurchaseBloc>();
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
                      BlocBuilder<CreatePurchaseBloc, PurchaseCreateState>(
                        bloc: bloc,
                        buildWhen: (previous, current) {
                          return previous.creditCards != current.creditCards;
                        },
                        builder: (context, state) {
                          if(state.creditCards.isEmpty){
                            return const Text('No credit cards available. Please add a credit card first.', style: TextStyle(color: Colors.redAccent),);
                          }
                          return DropdownButtonFormField<String>(
                            initialValue: state.cardSelectedId,
                            menuMaxHeight: 100,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Select a credit card';
                              }
                              return null;
                            },
                            decoration: _inputDecoration(label: 'Card', icon: Icons.credit_card),
                            items: (state.creditCards.isNotEmpty) ? state.creditCards.map((c) => DropdownMenuItem(value: c.id, child: Text(c.nomeCartao))).toList() : [],
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

                        final normalized = v
                            .replaceAll('.', '')   // remove milhar
                            .replaceAll(',', '.'); // corrige decimal

                        final a = double.tryParse(normalized);

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
                          BlocBuilder<CreatePurchaseBloc, PurchaseCreateState>(
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
                          BlocBuilder<CreatePurchaseBloc, PurchaseCreateState>(
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
                      BlocBuilder<CreatePurchaseBloc, PurchaseCreateState>(
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
                                child: BlocBuilder<CreatePurchaseBloc, PurchaseCreateState>(
                                  bloc: bloc,
                                  builder: (context, state) {
                                    return DropdownButtonFormField<int>(
                                      initialValue: state.installments,
                                      decoration: _inputDecoration(label: 'Installments', icon: Icons.filter_1),
                                      items: List.generate(100, (i) => i + 1).map((i) => DropdownMenuItem(value: i, child: Text('${i}x'))).toList(),
                                      onChanged: bloc.setInstallments,
                                    );
                                  }
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: BlocBuilder<CreatePurchaseBloc, PurchaseCreateState>(
                                          bloc: bloc,
                                          builder: (context, state) {
                                    DateTime selectedDate = state.purchaseDate ?? DateTime.now();
                                    return InkWell(
                                      onTap: (){
                                        showDatePicker(
                                          context: context, 
                                          initialDate: bloc.state.purchaseDate ?? DateTime.now(), 
                                          firstDate: DateTime(2000), 
                                          lastDate: DateTime(2100)
                                        ).then((selected){
                                          if(selected != null){
                                            bloc.setPurchaseDate(selected);
                                          }
                                        });
                                      },
                                      child: InputDecorator(
                                        decoration: _inputDecoration(label: 'Date', icon: Icons.date_range),
                                        child: Text(
                                              selectedDate.toLocal().toIso8601String().split('T').first,
                                              style: const TextStyle(fontSize: 16.0),
                                            

                                        ),
                                      ),
                                    );
                                  }
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
                                if(bloc.state.errorMessage != null){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(bloc.state.errorMessage!)));
                                  return;
                                } 
                                if(mounted){
                                  Navigator.of(context).pop();
                                }
                                
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