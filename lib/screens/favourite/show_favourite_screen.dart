import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/favourite_provider.dart';

class ShowFavouriteScreen extends StatelessWidget {
  const ShowFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nouns'),
          centerTitle: true,
          actions: [
            Consumer<FavouriteProvider>(builder: (context, value, child) {
              return IconButton(
                onPressed: value.clearFavourite,
                icon: const Icon(
                  Icons.rotate_left_rounded,
                ),
              );
            })
          ],
        ),
        body: Consumer<FavouriteProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.words.length,
              itemBuilder: (context, index) {
                final word = value.words[index].toString();
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
                      trailing: IconButton(
                        onPressed: () {
                          value.toggleFavourite(word);
                        },
                        icon: Icon(
                          value.isExist(word)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                        ),
                      )),
                );
              },
            );
          },
        ));
  }
}
