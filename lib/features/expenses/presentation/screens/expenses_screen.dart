import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/search_bar.dart';
import 'add_expense_screen.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _expenses = const [
    {
      'title': 'Transport (Rice Delivery)',
      'category': 'Transport',
      'date': '07 Oct 2026',
      'amount': 'TZS 15,000',
    },
    {
      'title': 'Loading & Unloading Bags',
      'category': 'Loading & Unloading',
      'date': '06 Oct 2026',
      'amount': 'TZS 8,000',
    },
    {
      'title': 'Packaging Material',
      'category': 'Packaging',
      'date': '05 Oct 2026',
      'amount': 'TZS 12,000',
    },
    {
      'title': 'Store Rent Share',
      'category': 'Storage & Rent',
      'date': '01 Oct 2026',
      'amount': 'TZS 45,000',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _expenses.where((e) {
      final title = (e['title'] as String).toLowerCase();
      return title.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: DeniBookColors.black,
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DeniBookColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 12),
                  CustomSearchBar(
                    controller: _searchController,
                    hintText: 'Search expenses...',
                    onChanged: (q) => setState(() => _searchQuery = q),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: filtered.isEmpty
                        ? const Center(
                            child: Text(
                              'No expenses found',
                              style: TextStyle(color: DeniBookColors.textMuted),
                            ),
                          )
                        : ListView.separated(
                            itemCount: filtered.length,
                            separatorBuilder: (context, index) =>
                                const Divider(color: Colors.white10, height: 1),
                            itemBuilder: (context, index) {
                              final item = filtered[index];
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: DeniBookColors.surfaceCard,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.receipt_long_outlined,
                                    color: DeniBookColors.overdue,
                                  ),
                                ),
                                title: Text(
                                  item['title'] as String,
                                  style: const TextStyle(
                                    color: DeniBookColors.textWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                subtitle: Text(
                                  '${item['category']} • ${item['date']}',
                                  style: const TextStyle(
                                    color: DeniBookColors.textMuted,
                                    fontSize: 12,
                                  ),
                                ),
                                trailing: Text(
                                  item['amount'] as String,
                                  style: const TextStyle(
                                    color: DeniBookColors.overdue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  backgroundColor: DeniBookColors.yellow,
                  foregroundColor: Colors.black,
                  child: const Icon(Icons.add, size: 28),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
