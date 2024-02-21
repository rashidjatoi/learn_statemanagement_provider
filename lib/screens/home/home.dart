import 'package:flutter/material.dart';

import '../favourite/favourite_screen.dart';
import '../theme/theme_change_screen.dart';
import '../todo/todo_screen.dart';
import '/screens/counter/counter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("State Management"),
          centerTitle: true,
          elevation: 0.9,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CounterScreen(),
                    ),
                  );
                },
                child: const Text('Counter Screen'),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThemeChangerScreen(),
                    ),
                  );
                },
                child: const Text('Theme Screen'),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavouriteScreen(),
                    ),
                  );
                },
                child: const Text('Favourite Screen'),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TodoScreen(),
                    ),
                  );
                },
                child: const Text('Todo Screen'),
              ),
            ],
          ),
        ));
  }
}
