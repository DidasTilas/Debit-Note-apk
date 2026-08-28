import 'package:flutter/material.dart';

class LatestArrivalCardContainer extends StatelessWidget {
    final bool isComplete;
    final int currentCard;
    final Function(int) onCard;


    const LatestArrivalCardContainer({
        super.key,
        required this.isComplete,
        required this.currentCard,
        required this.onCard,
    });

    @override
    Widget build(BuildContext context) {
        return Padding(
                padding: const EdgeInsets.all(12.0),

                child: ListView(
                        children: [
                            _LatestArrivalCard(
                                assetPath: 'assets/latest_arrivals_icons/egg_.png',
                                formattedDate: 'Friday August 21 2026',
                                quantity: 2,
                                customers: 'Dayo, Ben',
                                debts: 20000,
                                isComplete: false,
                                isSelected: currentCard == 0,
                                onTap: () => onCard(0),
                            ),
                            _LatestArrivalCard(
                                assetPath: 'assets/latest_arrivals_icons/egg_.png',
                                formattedDate: 'Thursday August 20 2026',
                                quantity: 1,
                                customers: 'Elisha',
                                debts: 10000,
                                isComplete: false,
                                isSelected: currentCard == 1,
                                onTap: () => onCard(1),
                            ),
                            _LatestArrivalCard(
                                assetPath: 'assets/latest_arrivals_icons/egg_.png',
                                formattedDate: 'Wednesday August 19 2026',
                                quantity: 2,
                                customers: 'John, Mary',
                                debts: 10000,
                                isComplete: false,
                                isSelected: currentCard == 2,
                                onTap: () => onCard(2),
                            ),

                            _LatestArrivalCard(
                                assetPath: 'assets/latest_arrivals_icons/egg_.png',
                                formattedDate: 'Tuesday August 18 2026',
                                quantity: 3,
                                customers: 'Peter',
                                debts: 30000,
                                isComplete: false,
                                isSelected: currentCard == 3,
                                onTap: () => onCard(3),
                            ),

                            _LatestArrivalCard(
                                assetPath: 'assets/latest_arrivals_icons/egg_.png',
                                formattedDate: 'Tuesday August 18 2026',
                                quantity: 3,
                                customers: 'Peter',
                                debts: 30000,
                                isComplete: false,
                                isSelected: currentCard == 4,
                                onTap: () => onCard(4),
                            ),

                            _LatestArrivalCard(
                                assetPath: 'assets/latest_arrivals_icons/egg_.png',
                                formattedDate: 'Tuesday August 18 2026',
                                quantity: 3,
                                customers: 'Peter',
                                debts: 30000,
                                isComplete: false,
                                isSelected: currentCard == 5,
                                onTap: () => onCard(5),
                            ),

                            _LatestArrivalCard(
                                assetPath: 'assets/latest_arrivals_icons/egg_.png',
                                formattedDate: 'Tuesday August 18 2026',
                                quantity: 3,
                                customers: 'Peter',
                                debts: 30000,
                                isComplete: false,
                                isSelected: currentCard == 6,
                                onTap: () => onCard(6),
                            ),

                            _LatestArrivalCard(
                                assetPath: 'assets/latest_arrivals_icons/egg_.png',
                                formattedDate: 'Tuesday August 18 2026',
                                quantity: 3,
                                customers: 'Peter',
                                debts: 30000,
                                isComplete: false,
                                isSelected: currentCard == 7,
                                onTap: () => onCard(7),
                            ),
                        ],
                ),
        );
    }
}

class _LatestArrivalCard extends StatelessWidget {
    final String assetPath;
    final String formattedDate;
    final int quantity;
    final String customers;
    final int debts;
    final bool isComplete;
    final bool isSelected;
    final VoidCallback onTap;

    const _LatestArrivalCard({
        required this.assetPath,
        required this.formattedDate,
        required this.quantity,
        required this.customers,
        required this.debts,
        required this.isComplete,
        required this.isSelected,
        required this.onTap,
    });

    @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                        color: isSelected ? Colors.amberAccent : Colors.white24,
                        width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                            children: [
                                Image.asset(
                                    assetPath,
                                    width: 24,
                                    height: 24,
                                    color: Colors.white70,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                    formattedDate,
                                    style: TextStyle(
                                        color: isSelected ? Colors.amberAccent : Colors.white70,
                                        fontSize: 19,
                                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                            'Quantity: $quantity',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                        ),
                        Text(
                            'Customers: $customers',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                            'Total Debt: $debts',
                            style: const TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                    ],
                ),
            ),
        ),
    );
  }
}