import 'package:familiar_finance_app/domain/purchase/purchase.dart';
import 'package:familiar_finance_app/ui/list_credit_card/bloc/credit_list_card_state.dart';
import 'package:familiar_finance_app/ui/list_credit_card/bloc/list_credit_card_cubit.dart';
import 'package:familiar_finance_app/ui/list_purchase/bloc/purchase_list_cubit.dart';
import 'package:familiar_finance_app/ui/list_purchase/bloc/purchase_list_state.dart';
import 'package:familiar_finance_app/ui/purchase/page/add_purchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

// Design System - Paleta moderna
const Color _kPrimary = Color(0xFF0A84FF);
const Color _kBackground = Color(0xFFF6F9FC);
const Color _kSurface = Colors.white;
const Color _kAccent = Color(0xFF34C759);
const Color _kWarning = Color(0xFFFF9500);
const Color _kError = Color(0xFFFF3B30);
const Color _kTextPrimary = Color(0xFF1C1C1E);
const Color _kTextSecondary = Color(0xFF8E8E93);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PurchaseListCubit purchaseListCubit;
  late final ListCreditCardCubit creditCardCubit;
  final _currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  String? _selectedBuyerId;
  String? _selectedCardId;

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
  List<int> get anosList =>
      List.generate(5, (index) => DateTime.now().year - index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBackground,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // App Bar moderno
            _buildAppBar(),

            // Header com total do mês
            BlocBuilder<PurchaseListCubit, PurchaseListState>(
              builder: (context, state) {
                if (state.purchases.isEmpty && state.errorMessage == null) {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }
                return SliverToBoxAdapter(child: _buildMonthlyHeader(state));
              },
            ),
            // Seletor de Mês/Ano
            SliverToBoxAdapter(child: _buildMonthYearSelector()),

            // Filtros
            BlocBuilder<PurchaseListCubit, PurchaseListState>(
              builder: (context, state) {
                return SliverToBoxAdapter(child: _buildFilters(state));
              },
            ),

            // Lista de compras
            BlocBuilder<PurchaseListCubit, PurchaseListState>(
              builder: (context, state) {
                // Loading state
                if (state.isLoading) {
                  return SliverToBoxAdapter(child: _buildShimmerList());
                }

                // Error state
                if (state.errorMessage != null) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: _buildErrorState(state.errorMessage!),
                  );
                }

                // Empty state
                final filteredPurchases = _getFilteredPurchases(
                  state.purchases,
                );
                if (filteredPurchases.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: _buildEmptyState(),
                  );
                }

                // Success state
                return _buildPurchasesList(filteredPurchases);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => CreatePurchase()));
        },
        backgroundColor: _kAccent,
        elevation: 4,
        icon: const Icon(Icons.add_rounded, size: 24),
        label: const Text(
          'Nova Compra',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // APP BAR
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 100,
      floating: false,
      pinned: true,
      backgroundColor: _kPrimary,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Minhas Compras',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {},
          tooltip: 'Notificações',
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // CREDIT CARDS CAROUSEL
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildCreditCardsCarousel() {
    return SliverToBoxAdapter(
      child: BlocBuilder<ListCreditCardCubit, CreditListCardState>(
        builder: (context, state) {
          if (state.isLoading) {
            return _buildShimmerCards();
          }

          if (state.creditCards.isEmpty) {
            return const SizedBox.shrink();
          }

          return Container(
            height: 180,
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.creditCards.length,
              itemBuilder: (context, index) {
                final card = state.creditCards[index];
                final isSelected = _selectedCardId == card.id;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCardId = isSelected ? null : card.id;
                    });
                  },
                  child: Container(
                    width: 280,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isSelected
                            ? [_kPrimary, const Color(0xFF007AFF)]
                            : [
                                const Color(0xFF6B7280),
                                const Color(0xFF4B5563),
                              ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: (isSelected ? _kPrimary : Colors.grey)
                              .withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Card pattern decoration
                        Positioned(
                          right: -20,
                          top: -20,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        // Card content
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.credit_card_rounded,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  if (isSelected)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _kAccent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        'Selecionado',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card.nomeCartao,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      _buildCardInfo(
                                        'Vencimento',
                                        'Dia ${card.diaVencimento}',
                                      ),
                                      const SizedBox(width: 24),
                                      _buildCardInfo(
                                        'Fechamento',
                                        'Dia ${card.diaFechamento}',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildCardInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // MONTH/YEAR SELECTOR
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildMonthYearSelector() {
    return BlocBuilder<PurchaseListCubit, PurchaseListState>(
      bloc: purchaseListCubit,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildSelectorButton(
                  label: _getMonthName(
                    purchaseListCubit.state.selectedDate.month,
                  ),
                  icon: Icons.calendar_month_rounded,
                  onTap: () => _showMonthPicker(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSelectorButton(
                  label: purchaseListCubit.state.selectedDate.year.toString(),
                  icon: Icons.calendar_today_rounded,
                  onTap: () => _showYearPicker(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSelectorButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: _kSurface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: _kPrimary, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: _kTextPrimary,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.arrow_drop_down_rounded,
              color: _kTextSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // MONTHLY HEADER
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildMonthlyHeader(PurchaseListState state) {
    final filteredPurchases = _getFilteredPurchases(state.purchases);
    final total = filteredPurchases.fold(0.0, (sum, p) => sum + p.amount);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Info do total
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total do Mês',
                  style: TextStyle(
                    color: _kTextSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _currencyFormat.format(total),
                  style: const TextStyle(
                    color: _kTextPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          // Badge de quantidade
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: _kPrimary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  '${filteredPurchases.length}',
                  style: const TextStyle(
                    color: _kPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  filteredPurchases.length == 1 ? 'compra' : 'compras',
                  style: const TextStyle(
                    color: _kPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // FILTERS
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildFilters(PurchaseListState state) {
    final uniqueBuyers = state.purchases
        .map((p) => p.buyerId ?? '')
        .where((id) => id.isNotEmpty)
        .toSet()
        .toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.filter_list_rounded,
                size: 20,
                color: _kTextSecondary,
              ),
              const SizedBox(width: 8),
              const Text(
                'Filtros',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: _kTextSecondary,
                ),
              ),
              const Spacer(),
              if (_selectedBuyerId != null || _selectedCardId != null)
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _selectedBuyerId = null;
                      _selectedCardId = null;
                    });
                  },
                  icon: const Icon(Icons.clear_rounded, size: 16),
                  label: const Text('Limpar'),
                  style: TextButton.styleFrom(
                    foregroundColor: _kPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                if (uniqueBuyers.isNotEmpty)
                  _buildFilterChip(
                    label: _selectedBuyerId != null
                        ? 'ID: $_selectedBuyerId'
                        : 'Todos os responsáveis',
                    icon: Icons.person_rounded,
                    isSelected: _selectedBuyerId != null,
                    onTap: () => _showBuyerFilter(uniqueBuyers),
                  ),
                if (uniqueBuyers.isNotEmpty) const SizedBox(width: 8),
                BlocBuilder<ListCreditCardCubit, CreditListCardState>(
                  builder: (context, cardState) {
                    if (cardState.creditCards.isEmpty)
                      return const SizedBox.shrink();

                    return _buildFilterChip(
                      label: _selectedCardId != null
                          ? cardState.creditCards
                                .firstWhere((c) => c.id == _selectedCardId)
                                .nomeCartao
                          : 'Todos os cartões',
                      icon: Icons.credit_card_rounded,
                      isSelected: _selectedCardId != null,
                      onTap: () => _showCardFilter(
                        cardState.creditCards
                            .map((c) => {'id': c.id, 'name': c.nomeCartao})
                            .toList(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
          color: isSelected ? _kPrimary : _kSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? _kPrimary : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : _kTextSecondary,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : _kTextPrimary,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_drop_down_rounded,
              size: 20,
              color: isSelected ? Colors.white : _kTextSecondary,
            ),
          ],
        ),
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // PURCHASES LIST
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildPurchasesList(List<Purchase> purchases) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final purchase = purchases[index];
          return _buildPurchaseCard(purchase);
        }, childCount: purchases.length),
      ),
    );
  }

  Widget _buildPurchaseCard(Purchase purchase) {
    final buyerColor = _getBuyerColor(purchase.buyerId ?? 'default');
    final typeIcon = _getTypeIcon(purchase.type.name);
    final instalmentCurrent = _instalmentActual(purchase);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: _kSurface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Navegar para detalhes
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Ícone da categoria
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: buyerColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(typeIcon, color: buyerColor, size: 26),
                ),
                const SizedBox(width: 16),

                // Info da compra
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        purchase.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _kTextPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          // Tag do responsável
                          if (purchase.buyerId != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: buyerColor.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.person_rounded,
                                    size: 13,
                                    color: buyerColor,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'ID: ${purchase.buyerId}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: buyerColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(width: 8),
                          // Parcelas
                          if (purchase.numberOfInstallments > 1)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: _kWarning.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '$instalmentCurrent/${purchase.numberOfInstallments}x',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: _kWarning,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Valor
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _currencyFormat.format(purchase.amount),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _kPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getTypeLabel(purchase.type.name),
                      style: const TextStyle(
                        fontSize: 12,
                        color: _kTextSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // EMPTY STATE
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: _kPrimary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 70,
                color: _kPrimary.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Nenhuma compra encontrada',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _kTextPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _selectedBuyerId != null || _selectedCardId != null
                  ? 'Tente ajustar os filtros ou\nadicionar uma nova compra'
                  : 'Comece adicionando sua\nprimeira compra do mês!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: _kTextSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreatePurchase()),
                );
              },
              icon: const Icon(Icons.add_rounded, size: 22),
              label: const Text(
                'Adicionar Compra',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _kPrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // ERROR STATE
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: _kError.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 60,
                color: _kError.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Algo deu errado',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _kTextPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: _kTextSecondary),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                purchaseListCubit.getPurchasesByMonth();
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Tentar Novamente'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _kPrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // SHIMMER LOADING
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildShimmerCards() {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 280,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerList() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: List.generate(
            5,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 84,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // DIALOGS & PICKERS
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  void _showMonthPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: _kSurface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selecionar Mês',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _kTextPrimary,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.5,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  final month = index + 1;
                  final isSelected =
                      month == purchaseListCubit.state.selectedDate.month;

                  return GestureDetector(
                    onTap: () {
                      purchaseListCubit.setSelectedDate(
                        DateTime(
                          purchaseListCubit.state.selectedDate.year,
                          month,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? _kPrimary : _kSurface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? _kPrimary : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _getMonthName(month),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : _kTextPrimary,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showYearPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: _kSurface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selecionar Ano',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: _kTextPrimary,
                  ),
                ),
                const SizedBox(height: 20),
                ...anosList.map((ano) {
                  final isSelected =
                      ano == purchaseListCubit.state.selectedDate.year;
                  return GestureDetector(
                    onTap: () {
                      purchaseListCubit.setSelectedDate(
                        DateTime(
                          ano,
                          purchaseListCubit.state.selectedDate.month,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? _kPrimary : _kSurface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? _kPrimary : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            color: isSelected ? Colors.white : _kTextSecondary,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            ano.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.white : _kTextPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBuyerFilter(List<String> buyers) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: _kSurface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filtrar por Responsável',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _kTextPrimary,
                ),
              ),
              const SizedBox(height: 20),
              ...buyers.map((buyer) {
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedBuyerId = buyer);
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _kSurface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: _getBuyerColor(
                            buyer,
                          ).withOpacity(0.15),
                          radius: 22,
                          child: Text(
                            buyer[0].toUpperCase(),
                            style: TextStyle(
                              color: _getBuyerColor(buyer),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'ID: $buyer',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: _kTextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  void _showCardFilter(List<Map<String, String>> cards) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: _kSurface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filtrar por Cartão',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _kTextPrimary,
                ),
              ),
              const SizedBox(height: 20),
              ...cards.map((card) {
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedCardId = card['id']);
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _kSurface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: _kPrimary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.credit_card_rounded,
                            color: _kPrimary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          card['name']!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: _kTextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // HELPERS
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  List<Purchase> _getFilteredPurchases(List<Purchase> purchases) {
    var filtered = purchases;

    if (_selectedBuyerId != null) {
      filtered = filtered.where((p) => p.buyerId == _selectedBuyerId).toList();
    }

    if (_selectedCardId != null) {
      filtered = filtered
          .where((p) => p.creditCardId == _selectedCardId)
          .toList();
    }

    return filtered;
  }

  int _instalmentActual(Purchase purchase) {
    if (purchase.installments.isEmpty) return 1;
    final installments = purchase.installments
        .where(
          (i) =>
              i.dueDate.month <= purchaseListCubit.state.selectedDate.month &&
              i.dueDate.year <= purchaseListCubit.state.selectedDate.year,
        )
        .toList();
    return installments.length;
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Fev',
      'Mar',
      'Abr',
      'Mai',
      'Jun',
      'Jul',
      'Ago',
      'Set',
      'Out',
      'Nov',
      'Dez',
    ];
    return months[month - 1];
  }

  Color _getBuyerColor(String buyerId) {
    final colors = [
      const Color(0xFF0A84FF), // Azul
      const Color(0xFFFF3B30), // Vermelho
      const Color(0xFF34C759), // Verde
      const Color(0xFFFF9500), // Laranja
      const Color(0xFFAF52DE), // Roxo
      const Color(0xFFFF2D55), // Rosa
      const Color(0xFF5AC8FA), // Azul claro
      const Color(0xFFFFCC00), // Amarelo
    ];

    final hash = buyerId.hashCode.abs();
    return colors[hash % colors.length];
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'fixed':
        return Icons.repeat_rounded;
      case 'parcel':
        return Icons.credit_card_rounded;
      default:
        return Icons.shopping_bag_rounded;
    }
  }

  String _getTypeLabel(String type) {
    switch (type.toLowerCase()) {
      case 'fixed':
        return 'Fixa';
      case 'parcel':
        return 'Parcelada';
      case 'credit':
        return 'Crédito';
      default:
        return 'Outro';
    }
  }
}
