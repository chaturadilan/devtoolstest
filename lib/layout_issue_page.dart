import 'package:flutter/material.dart';

class LayoutIssuePage extends StatelessWidget {
  const LayoutIssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(children: [Text("Dev "), Text("Fest")]),
            Row(
              children: [
                Text("Hello! "),
                Text(
                    "Welcome to the Flutter Dev Fest. This is a very long text.")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
