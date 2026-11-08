import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/search_bar.dart';
import 'add_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _products = const [
    {
      'name': 'Rice (Mbeya)',
      'unit': 'kg',
      'cost': 'TZS 2,200',
      'price': 'TZS 2,800',
      'stock': '120 kg',
      'sold': '45 kg',
    },
    {
      'name': 'Sugar (Kilombero)',
      'unit': 'kg',
      'cost': 'TZS 2,800',
      'price': 'TZS 3,200',
      'stock': '80 kg',
      'sold': '30 kg',
    },
    {
      'name': 'Cooking Oil',
      'unit': 'liters',
      'cost': 'TZS 6,500',
      'price': 'TZS 7,500',
      'stock': '40 liters',
      'sold': '15 liters',
    },
    {
      'name': 'Wheat Flour',
      'unit': 'bags',
      'cost': 'TZS 18,000',
      'price': 'TZS 22,000',
      'stock': '15 bags',
      'sold': '5 bags',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _products.where((p) {
      final name = (p['name'] as String).toLowerCase();
      return name.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: DeniBookColors.black,
      appBar: AppBar(
        title: const Text('Products Inventory'),
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
                    hintText: 'Search products...',
                    onChanged: (q) => setState(() => _searchQuery = q),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: filtered.isEmpty
                        ? const Center(
                            child: Text(
                              'No products found',
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
                                    Icons.inventory_2_outlined,
                                    color: DeniBookColors.yellow,
                                  ),
                                ),
                                title: Text(
                                  item['name'] as String,
                                  style: const TextStyle(
                                    color: DeniBookColors.textWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  'Cost: ${item['cost']} | Price: ${item['price']}',
                                  style: const TextStyle(
                                    color: DeniBookColors.textMuted,
                                    fontSize: 12,
                                  ),
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Stock: ${item['stock']}',
                                      style: const TextStyle(
                                        color: DeniBookColors.paid,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Sold: ${item['sold']}',
                                      style: const TextStyle(
                                        color: DeniBookColors.textMuted,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
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
                      MaterialPageRoute(builder: (context) => const AddProductScreen()),
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
