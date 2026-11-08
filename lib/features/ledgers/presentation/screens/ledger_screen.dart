import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/search_bar.dart';

class LedgersScreen extends StatefulWidget {
  const LedgersScreen({super.key});

  @override
  State<LedgersScreen> createState() => _LedgersScreenState();
}

class _LedgersScreenState extends State<LedgersScreen> {
  int _selectedChip = 0; // 0: All, 1: Credit, 2: Payment
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedPeriod = 'This Month';

  final List<Map<String, dynamic>> _transactions = const [
    {
      'name': 'John Mwangi',
      'type': 'Credit',
      'date': '07 Sep 2025',
      'amount': '+50,000',
      'isCredit': true,
    },
    {
      'name': 'Mary Joseph',
      'type': 'Payment',
      'date': '07 Sep 2025',
      'amount': '-20,000',
      'isCredit': false,
    },
    {
      'name': 'Peter Hassan',
      'type': 'Credit',
      'date': '06 Sep 2025',
      'amount': '+35,000',
      'isCredit': true,
    },
    {
      'name': 'Amina Salum',
      'type': 'Payment',
      'date': '05 Sep 2025',
      'amount': '-15,000',
      'isCredit': false,
    },
    {
      'name': 'David Kimani',
      'type': 'Credit',
      'date': '04 Sep 2025',
      'amount': '+40,000',
      'isCredit': true,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _transactions.where((tx) {
      final matchesType = _selectedChip == 0 ||
          (_selectedChip == 1 && tx['isCredit'] == true) ||
          (_selectedChip == 2 && tx['isCredit'] == false);

      final name = (tx['name'] as String).toLowerCase();
      final matchesSearch = name.contains(_searchQuery.toLowerCase());

      return matchesType && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: DeniBookColors.black,
      appBar: AppBar(
        title: const Text('Transactions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DeniBookColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            CustomSearchBar(
              controller: _searchController,
              hintText: 'Search by customer name...',
              onChanged: (q) => setState(() => _searchQuery = q),
            ),
            const SizedBox(height: 12),
            // Filter Chips & Date Filter
            Row(
              children: [
                _chip('All', 0),
                const SizedBox(width: 8),
                _chip('Credit', 1),
                const SizedBox(width: 8),
                _chip('Payment', 2),
                const Spacer(),
                PopupMenuButton<String>(
                  color: DeniBookColors.surfaceCard,
                  initialValue: _selectedPeriod,
                  onSelected: (val) => setState(() => _selectedPeriod = val),
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'This Month', child: Text('This Month')),
                    PopupMenuItem(value: 'Today', child: Text('Today')),
                    PopupMenuItem(value: 'All Time', child: Text('All Time')),
                  ],
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: DeniBookColors.surfaceCard,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month, color: DeniBookColors.textMuted, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          _selectedPeriod,
                          style: const TextStyle(color: DeniBookColors.textWhite, fontSize: 12),
                        ),
                        const Icon(Icons.arrow_drop_down, color: DeniBookColors.textMuted, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Transactions List
            Expanded(
              child: filtered.isEmpty
                  ? const Center(
                      child: Text(
                        'No transactions found',
                        style: TextStyle(color: DeniBookColors.textMuted),
                      ),
                    )
                  : ListView.separated(
                      itemCount: filtered.length,
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.white10, height: 1),
                      itemBuilder: (context, index) {
                        final tx = filtered[index];
                        final isCredit = tx['isCredit'] as bool;

                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          leading: CircleAvatar(
                            backgroundColor: isCredit
                                ? DeniBookColors.paid.withOpacity(0.2)
                                : DeniBookColors.overdue.withOpacity(0.2),
                            child: Icon(
                              isCredit ? Icons.arrow_upward : Icons.arrow_downward,
                              color: isCredit ? DeniBookColors.paid : DeniBookColors.overdue,
                            ),
                          ),
                          title: Text(
                            tx['name'] as String,
                            style: const TextStyle(
                              color: DeniBookColors.textWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            '${tx['type']} • ${tx['date']}',
                            style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 13),
                          ),
                          trailing: Text(
                            tx['amount'] as String,
                            style: TextStyle(
                              color: isCredit ? DeniBookColors.paid : DeniBookColors.overdue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label, int index) {
    final isSelected = _selectedChip == index;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : DeniBookColors.textWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
      selected: isSelected,
      selectedColor: DeniBookColors.yellow,
      backgroundColor: DeniBookColors.surfaceCard,
      onSelected: (val) {
        if (val) setState(() => _selectedChip = index);
      },
    );
  }
}
