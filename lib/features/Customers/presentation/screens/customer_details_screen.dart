import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/outstanding_balance_card.dart';
import '../../../ledgers/presentation/screens/record_credit_screen.dart';
import '../../../ledgers/presentation/screens/record_payment_screen.dart';
import 'edit_customer_screen.dart';

class CustomerDetailsScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String balance;

  const CustomerDetailsScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return Scaffold(
      backgroundColor: DeniBookColors.black,
      appBar: AppBar(
        title: const Text('Customer Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DeniBookColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: DeniBookColors.yellow),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditCustomerScreen(
                    name: name,
                    phone: phone,
                    address: 'Arusha',
                    notes: 'Good customer',
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar Header
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: DeniBookColors.surfaceCard,
                  child: Text(
                    initial,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: DeniBookColors.textWhite,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: DeniBookColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phone,
                      style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Outstanding Balance Card
            OutstandingBalanceCard(amount: balance),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: '+ Record Credit',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecordCreditScreen(customerName: name),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: 'Record Payment',
                    isOutlined: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecordPaymentScreen(
                            customerName: name,
                            balance: balance,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Account Summary
            const Text(
              'Account Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: DeniBookColors.textWhite,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: DeniBookColors.surfaceCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  _SummaryRow(label: 'Total Credit', value: 'TZS 120,000'),
                  Divider(color: Colors.white12, height: 20),
                  _SummaryRow(label: 'Total Paid', value: 'TZS 40,000'),
                  Divider(color: Colors.white12, height: 20),
                  _SummaryRow(
                    label: 'Balance',
                    value: 'TZS 80,000',
                    valueColor: DeniBookColors.yellow,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Transaction History Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Transaction History',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: DeniBookColors.textWhite,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View all', style: TextStyle(color: DeniBookColors.yellow)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // History List
            const _HistoryTile(
              type: 'Credit',
              desc: 'Rice',
              date: '07 Sep 2025',
              amount: '+50,000',
              isCredit: true,
            ),
            const SizedBox(height: 12),
            const _HistoryTile(
              type: 'Payment',
              desc: 'Cash',
              date: '05 Sep 2025',
              amount: '-20,000',
              isCredit: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 14)),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? DeniBookColors.textWhite,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _HistoryTile extends StatelessWidget {
  final String type;
  final String desc;
  final String date;
  final String amount;
  final bool isCredit;

  const _HistoryTile({
    required this.type,
    required this.desc,
    required this.date,
    required this.amount,
    required this.isCredit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: DeniBookColors.surfaceCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: isCredit
                ? DeniBookColors.paid.withOpacity(0.2)
                : DeniBookColors.overdue.withOpacity(0.2),
            child: Icon(
              isCredit ? Icons.arrow_upward : Icons.arrow_downward,
              color: isCredit ? DeniBookColors.paid : DeniBookColors.overdue,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$type ($desc)',
                style: const TextStyle(
                  color: DeniBookColors.textWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(date, style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 12)),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: TextStyle(
              color: isCredit ? DeniBookColors.paid : DeniBookColors.overdue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
