import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/status_badge.dart';
import '../../../../core/widgets/search_bar.dart';
import 'add_customer_screen.dart';
import 'customer_details_screen.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _customers = const [
    {
      'name': 'John Mwangi',
      'phone': '0712345678',
      'balance': 'TZS 80,000',
      'status': CustomerStatus.owing,
    },
    {
      'name': 'Mary Joseph',
      'phone': '0756789123',
      'balance': 'TZS 0',
      'status': CustomerStatus.paid,
    },
    {
      'name': 'Peter Hassan',
      'phone': '0765432109',
      'balance': 'TZS 150,000',
      'status': CustomerStatus.owing,
    },
    {
      'name': 'Amina Salum',
      'phone': '0789123456',
      'balance': 'TZS 25,000',
      'status': CustomerStatus.owing,
    },
    {
      'name': 'David Kimani',
      'phone': '0722334455',
      'balance': 'TZS 0',
      'status': CustomerStatus.paid,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _customers.where((c) {
      final name = (c['name'] as String).toLowerCase();
      return name.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: DeniBookColors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchBar(
                        controller: _searchController,
                        hintText: 'Search customers...',
                        onChanged: (q) => setState(() => _searchQuery = q),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: DeniBookColors.surfaceCard,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.tune, color: DeniBookColors.textWhite),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: filtered.isEmpty
                      ? const Center(
                          child: Text(
                            'No customers found',
                            style: TextStyle(color: DeniBookColors.textMuted),
                          ),
                        )
                      : ListView.separated(
                          itemCount: filtered.length,
                          separatorBuilder: (context, index) =>
                              const Divider(color: Colors.white10, height: 1),
                          itemBuilder: (context, index) {
                            final item = filtered[index];
                            final initial = (item['name'] as String)[0];

                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CustomerDetailsScreen(
                                      name: item['name'] as String,
                                      phone: item['phone'] as String,
                                      balance: item['balance'] as String,
                                    ),
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundColor: DeniBookColors.surfaceCard,
                                child: Text(
                                  initial,
                                  style: const TextStyle(
                                    color: DeniBookColors.textWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item['name'] as String,
                                      style: const TextStyle(
                                        color: DeniBookColors.textWhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  StatusBadge(status: item['status'] as CustomerStatus),
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item['phone'] as String,
                                      style: const TextStyle(
                                        color: DeniBookColors.textMuted,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      item['balance'] as String,
                                      style: const TextStyle(
                                        color: DeniBookColors.textWhite,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
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
                    MaterialPageRoute(builder: (context) => const AddCustomerScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
