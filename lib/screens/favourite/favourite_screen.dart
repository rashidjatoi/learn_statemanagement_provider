import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/favourite_provider.dart';
import 'show_favourite_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final names = nouns.take(50).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouns'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ShowFavouriteScreen();
                },
              ));
            },
            icon: const Icon(
              Icons.favorite_outline,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final word = names[index].toString();
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade100,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(word),
              trailing: Consumer<FavouriteProvider>(
                builder: (context, value, child) {
                  return IconButton(
                    onPressed: () {
                      value.toggleFavourite(word);
                    },
                    icon: Icon(
                      value.isExist(word)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
