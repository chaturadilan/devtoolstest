import 'package:flutter/material.dart';

class ColumnsRedBlue extends StatelessWidget {
  const ColumnsRedBlue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.red,
          height: 100,
          width: double.infinity,
        ),
        Container(
          color: Colors.blue,
          height: 100,
          width: double.infinity,
        ),
      ],
    ));
  }
}
