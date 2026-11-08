import 'package:flutter/material.dart';
import '../../../core/theme/denibook_theme.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeniBookColors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today Summary Cards
            Row(
              children: const [
                Expanded(
                  child: _MetricCard(
                    title: "Today's Credit",
                    value: "TZS 120,000",
                    icon: Icons.upload,
                    color: DeniBookColors.yellow,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    title: "Today's Payments",
                    value: "TZS 60,000",
                    icon: Icons.download,
                    color: DeniBookColors.paid,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const _MetricCard(
              title: "Total Outstanding",
              value: "TZS 500,000",
              icon: Icons.account_balance,
              color: DeniBookColors.owing,
              fullWidth: true,
            ),
            const SizedBox(height: 24),

            // Customers Summary
            const Text(
              'Customers Summary',
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _SummaryStat(label: 'Owing', count: '18', color: DeniBookColors.owing),
                  _SummaryStat(label: 'Fully Paid', count: '17', color: DeniBookColors.paid),
                  _SummaryStat(label: 'Total Customers', count: '35', color: DeniBookColors.yellow),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Quick Charts (7-day bar chart)
            const Text(
              'Quick Charts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: DeniBookColors.textWhite,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Credit vs Payments (Last 7 Days)',
              style: TextStyle(color: DeniBookColors.textMuted, fontSize: 13),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: DeniBookColors.surfaceCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _BarGroup(day: 'Mon', creditHeight: 80, paymentHeight: 40),
                  _BarGroup(day: 'Tue', creditHeight: 120, paymentHeight: 90),
                  _BarGroup(day: 'Wed', creditHeight: 60, paymentHeight: 30),
                  _BarGroup(day: 'Thu', creditHeight: 140, paymentHeight: 100),
                  _BarGroup(day: 'Fri', creditHeight: 90, paymentHeight: 70),
                  _BarGroup(day: 'Sat', creditHeight: 110, paymentHeight: 85),
                  _BarGroup(day: 'Sun', creditHeight: 50, paymentHeight: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final bool fullWidth;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DeniBookColors.surfaceCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: DeniBookColors.textWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryStat extends StatelessWidget {
  final String label;
  final String count;
  final Color color;

  const _SummaryStat({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 12),
        ),
      ],
    );
  }
}

class _BarGroup extends StatelessWidget {
  final String day;
  final double creditHeight;
  final double paymentHeight;

  const _BarGroup({
    required this.day,
    required this.creditHeight,
    required this.paymentHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 10,
              height: creditHeight,
              decoration: BoxDecoration(
                color: DeniBookColors.yellow,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 10,
              height: paymentHeight,
              decoration: BoxDecoration(
                color: DeniBookColors.paid,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 11),
        ),
      ],
    );
  }
}
