import 'package:familiar_finance_app/data/repositories/creditcard/creditcard_repository.dart';
import 'package:familiar_finance_app/ui/credit_card/bloc/create_credit_card_cubit.dart';
import 'package:familiar_finance_app/ui/credit_card/bloc/create_credit_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Design System - Paleta moderna (Consistent with HomePage)
const Color _kPrimary = Color(0xFF0A84FF);
const Color _kBackground = Color(0xFFF6F9FC);
const Color _kSurface = Colors.white;
const Color _kAccent = Color(0xFF34C759);
const Color _kTextPrimary = Color(0xFF1C1C1E);
const Color _kTextSecondary = Color(0xFF8E8E93);

class AddCreditCardPage extends StatelessWidget {
  const AddCreditCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreateCreditCardCubit(context.read<CreditCardRepository>()),
      child: const AddCreditCardView(),
    );
  }
}

class AddCreditCardView extends StatefulWidget {
  const AddCreditCardView({super.key});

  @override
  State<AddCreditCardView> createState() => _AddCreditCardViewState();
}

class _AddCreditCardViewState extends State<AddCreditCardView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _limitController = TextEditingController();

  // Days 1-31
  final List<int> _days = List.generate(31, (index) => index + 1);

  @override
  void dispose() {
    _nameController.dispose();
    _limitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBackground,
      appBar: AppBar(
        backgroundColor: _kPrimary,
        elevation: 0,
        title: const Text(
          'Novo Cartão',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<CreateCreditCardCubit, CreateCreditCardState>(
        listener: (context, state) {
          if (state.status == CreateCreditCardStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cartão adicionado com sucesso!'),
                backgroundColor: _kAccent,
              ),
            );
            Navigator.pop(context, true); // Return true to refresh
          } else if (state.status == CreateCreditCardStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Informações do Cartão'),
                  const SizedBox(height: 16),

                  // Card Name
                  _buildTextField(
                    label: 'Apelido do Cartão',
                    hint: 'Ex: Nubank, Visa Platinum',
                    icon: Icons.credit_card_rounded,
                    controller: _nameController,
                    onChanged: (value) => context
                        .read<CreateCreditCardCubit>()
                        .setNomeCartao(value),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Campo obrigatório'
                        : null,
                  ),
                  const SizedBox(height: 24),

                  // Dates Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdownField(
                          label: 'Dia Vencimento',
                          value: state.diaVencimento,
                          items: _days,
                          onChanged: (val) => context
                              .read<CreateCreditCardCubit>()
                              .setDiaVencimento(val!),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildDropdownField(
                          label: 'Dia Fechamento',
                          value: state.diaFechamento,
                          items: _days,
                          onChanged: (val) => context
                              .read<CreateCreditCardCubit>()
                              .setDiaFechamento(val!),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Limit
                  _buildTextField(
                    label: 'Limite do Cartão (Opcional)',
                    hint: '0.00',
                    icon: Icons.attach_money_rounded,
                    controller: _limitController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: (value) {
                      // Parse currency or double simple
                      final clean = value.replaceAll(',', '.');
                      final limit = double.tryParse(clean);
                      if (limit != null) {
                        context.read<CreateCreditCardCubit>().setLimite(limit);
                      }
                    },
                  ),

                  const SizedBox(height: 40),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: state.status == CreateCreditCardStatus.loading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                context.read<CreateCreditCardCubit>().submit();
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _kPrimary,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: state.status == CreateCreditCardStatus.loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Salvar Cartão',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: _kTextPrimary,
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required TextEditingController controller,
    required Function(String) onChanged,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _kTextSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: _kSurface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            validator: validator,
            style: const TextStyle(
              fontSize: 16,
              color: _kTextPrimary,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              prefixIcon: Icon(icon, color: _kPrimary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required int value,
    required List<int> items,
    required Function(int?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _kTextSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: _kSurface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: value,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down_rounded, color: _kPrimary),
              style: const TextStyle(
                fontSize: 16,
                color: _kTextPrimary,
                fontWeight: FontWeight.w500,
              ),
              items: items.map((day) {
                return DropdownMenuItem<int>(
                  value: day,
                  child: Text('Dia $day'),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
