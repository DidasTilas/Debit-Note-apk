import 'package:flutter/material.dart';

class UserProfileRow extends StatelessWidget {
  final String customerName;
  final int phoneNumber;
  final bool isPaid;
  final int aMount;

  const UserProfileRow({
    super.key,
    required this.customerName,
    required this.phoneNumber,
    required this.isPaid,
    required this.aMount,
  });

  @override
  Widget build(BuildContext context) {
    // Extract the first initial and convert to uppercase
    final String initial = customerName.isNotEmpty
        ? customerName[0].toUpperCase()
        : '?';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Avatar containing one initial of customerName
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.black,
            child: Text(
              initial,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(width: 16), // Spacing between avatar and text
          // 2. Column containing customerName and details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // CustomerName
                Text(
                  customerName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4), // Small vertical space
                // Detail 1: phoneNumber
                Text(
                  '$phoneNumber',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: // Detail 2: aMount
              Text(
                '$aMount',
                style: TextStyle(
                  fontSize: 13,
                  color: isPaid ? Colors.green : Colors.red,
                  fontStyle: FontStyle.normal,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
