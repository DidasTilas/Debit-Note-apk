import 'package:flutter/material.dart';

class DebtViewingCard extends StatelessWidget {

  final int currentCard;
  final bool isComplete;
  final Function(int) onCard;
  
  const DebtViewingCard({
    super.key,
    required this.currentCard,
    required this.onCard,
    required this.isComplete,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            _DebtView(
                assetPath: 'assets/debt_card_icons/account_.png',
                customerName: 'Dayo',
                aMount: 10000,
                quantityUnpaid: 1,
                isComplete: false,
                isSelected: currentCard == 0,
                onTap: () => onCard(0),
            ),
            _DebtView(
              assetPath: 'assets/debt_card_icons/account_.png',
              customerName: 'Ben',
              aMount: 10000,
              quantityUnpaid: 1,
              isComplete: false,
              isSelected: currentCard == 1,
              onTap: () => onCard(1),
            ),
          ],
        ),
    );
  }
}

class _DebtView extends StatelessWidget {
  final String assetPath;
  final String customerName;
  final int aMount;
  final int quantityUnpaid;
  final bool isSelected;
  final bool isComplete;
  final VoidCallback onTap;

  const _DebtView ({
    required this.assetPath,
    required this.customerName,
    required this.aMount,
    required this.quantityUnpaid,
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
                          ),
                          const SizedBox(width: 12),
                          Text(
                            customerName,
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
                        'Quantity unpaid: $quantityUnpaid',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Total Debt: $aMount',
                          style: const TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          ),
                      ),
                  ],
                )
            ),
        ),
    );
  }

}