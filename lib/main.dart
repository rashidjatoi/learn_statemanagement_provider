import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/counter_provider.dart';
import '/provider/favourite_provider.dart';
import '/provider/theme_provider.dart';
import '/provider/todo_provider.dart';
import '/screens/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (va) => ThemeProvider()),
        ChangeNotifierProvider(create: (va) => CounterProvider()),
        ChangeNotifierProvider(create: (va) => FavouriteProvider()),
        ChangeNotifierProvider(create: (va) => TodoProvider()),
      ],
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.theme,
          home: const HomeScreen(),
        );
      },
    );
  }
}
