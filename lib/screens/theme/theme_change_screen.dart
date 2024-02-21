import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class ThemeChangerScreen extends StatelessWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ThemeProvider>(builder: (context, value, child) {
          return IconButton(
            onPressed: () {
              value.toggleTheme();
            },
            icon: const Icon(
              Icons.rotate_left_outlined,
            ),
          );
        }),
      ),
    );
  }
}
