import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
        elevation: 0.9,
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) {
            return Text(
              value.counter.toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      floatingActionButton:
          Consumer<CounterProvider>(builder: (context, value, child) {
        return FloatingActionButton(
          onPressed: () {
            value.increment();
          },
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}
