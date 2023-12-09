import 'package:flutter/material.dart';

class JankScreen extends StatelessWidget {
  const JankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        if (index == 40) return const VeryExpensiveOne();
        return Text("Dash:$index");
      },
      itemCount: 100,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 40,
        );
      },
    ));
  }
}

class VeryExpensiveOne extends StatelessWidget {
  const VeryExpensiveOne({super.key});

  @override
  Widget build(BuildContext context) {
    return expensiveFunction();
  }

  Widget expensiveFunction() {
    return Stack(
      children: [
        for (int i = 0; i < 1000; i++)
          const Text(
            'Dash: 40',
          ),
      ],
    );
  }
}
