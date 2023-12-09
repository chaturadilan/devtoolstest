import 'package:flutter/material.dart';

class OverSizedImagePage extends StatelessWidget {
  const OverSizedImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oversized Image'),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/dash.png',
        ),
      ),
    );
  }
}
