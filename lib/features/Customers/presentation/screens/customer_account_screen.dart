import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/outstanding_balance_card.dart';

class CustomerAccountScreen extends StatefulWidget {
  final String name;
  final String phone;

  const CustomerAccountScreen({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  State<CustomerAccountScreen> createState() => _CustomerAccountScreenState();
}

class _CustomerAccountScreenState extends State<CustomerAccountScreen> {
  int _selectedSegment = 0; // 0: Summary, 1: History

  @override
  Widget build(BuildContext context) {
    final initial = widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '?';

    return Scaffold(
      backgroundColor: DeniBookColors.black,
      appBar: AppBar(
        title: const Text('Customer Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DeniBookColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Header Avatar
            CircleAvatar(
              radius: 36,
              backgroundColor: DeniBookColors.surfaceCard,
              child: Text(
                initial,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: DeniBookColors.textWhite,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: DeniBookColors.textWhite,
              ),
            ),
            Text(
              widget.phone,
              style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 14),
            ),
            const SizedBox(height: 24),

            // Segmented Tab Selector
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: DeniBookColors.surfaceCard,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedSegment = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _selectedSegment == 0
                              ? DeniBookColors.yellow
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Summary',
                          style: TextStyle(
                            color: _selectedSegment == 0
                                ? Colors.black
                                : DeniBookColors.textWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedSegment = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _selectedSegment == 1
                              ? DeniBookColors.yellow
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'History',
                          style: TextStyle(
                            color: _selectedSegment == 1
                                ? Colors.black
                                : DeniBookColors.textWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            if (_selectedSegment == 0) ...[
              const OutstandingBalanceCard(amount: 'TZS 80,000'),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(
                    child: _MiniCard(
                      label: 'Total Credit',
                      amount: 'TZS 120,000',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _MiniCard(
                      label: 'Total Paid',
                      amount: 'TZS 40,000',
                    ),
                  ),
                ],
              ),
            ] else ...[
              const Column(
                children: [
                  // History list
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  final String label;
  final String amount;

  const _MiniCard({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DeniBookColors.surfaceCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 12)),
          const SizedBox(height: 6),
          Text(
            amount,
            style: const TextStyle(
              color: DeniBookColors.textWhite,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
