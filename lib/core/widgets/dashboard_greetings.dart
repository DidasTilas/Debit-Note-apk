import 'package:flutter/material.dart';

class DashboardGreetings extends StatelessWidget {
  const DashboardGreetings({super.key});

  final String textMorning = 'morning';
  final String textAfternoon = 'afternoon';
  final String textEvening = 'evening';
  final String firstName = 'Regina';
  final String lastName = 'Milambo';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          text: 'Good $textMorning\n',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          children: <TextSpan>[
            TextSpan(
              text: '$firstName $lastName\n',
              style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            TextSpan(
              text: "Here's your business summary",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
