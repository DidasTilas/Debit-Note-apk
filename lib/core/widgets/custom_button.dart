import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.95,
      child: ElevatedButton.icon(
        //validate will return true if form is valid
          onPressed: (){
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amberAccent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 5,
          ),
          icon: const Icon(Icons.add, size: 20),
          label: const Text('Add Customer')
      ),
    );
  }
}