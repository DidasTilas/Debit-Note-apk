import 'package:flutter/material.dart';
import 'package:arc_progress_ring/arc_progress_ring.dart';

class DashboardArcs extends StatelessWidget {
  const DashboardArcs({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dashboardItems = [
      {
        'title': 'inStock',
        'value': '3/12',
        'progress': 0.25,
        'color': Colors.cyanAccent,
        'icon': Icons.inventory_outlined,
      },
      {
        'title': 'Debts',
        'value': '20K,TZS',
        'progress': 0.20,
        'color': Colors.greenAccent,
        'icon': Icons.groups_sharp,
      },
      {
        'title': 'Cash',
        'value': '80K,TZS',
        'progress': 0.80,
        'color': Colors.amberAccent,
        'icon': Icons.money_outlined,
      },
      {
        'title': 'Profit',
        'value': '30K,TZS',
        'progress': 0.60,
        'color': Colors.purpleAccent,
        'icon': Icons.bar_chart,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        crossAxisCount: 2, // 2 items per row to cleanly separate 4 items
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: dashboardItems.map((item) {
          return Card(
            color: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title and Icon Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(item['icon'], color: item['color'], size: 18),
                    ],
                  ),
                  const Spacer(),

                  // ArcProgressRing Configuration
                  Expanded(
                    flex: 5,
                    child: ArcProgressRing(
                      progress: item['progress'], // Value from 0.0 to 1.0
                      progressColor: item['color'], // Customized arc colors
                      backgroundColor: Colors.white10,
                      animationCurve: Curves.easeOutCubic,
                      animationDuration: const Duration(seconds: 2),
                      strokeWidth: 6.0,
                      // centerBuilder slot allows positioning subtext inside the ring
                      centerBuilder: (context, progress) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['value'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${(item['progress'] * 100).toInt()}%',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
