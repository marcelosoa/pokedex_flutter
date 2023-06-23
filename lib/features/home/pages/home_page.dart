import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/details/container/detail_container.dart';

import '../../../common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.list, required this.onItemTap});
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, int index) {
            return ListTile(
              title: Text(list[index].name),
              onTap: () => onItemTap(
                  '/details', DetailArguments(name: list[index].name)),
            );
          }),
    );
  }
}
