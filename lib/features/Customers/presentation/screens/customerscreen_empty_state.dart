import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget{
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Customers'),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 150.0),
              child: Icon(
                Icons.people_alt_outlined,
                size: 200,
                color: Colors.grey.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(
              height: 35,
              width:260,
              child: Text(
                'No Customers yet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsetsGeometry.only(bottom: 30.0),
              child: const SizedBox(
                height: 25,
                width:400,
                child: Text(
                  'Add your first customer to get started',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}