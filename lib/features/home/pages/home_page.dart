import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/home/pages/widgets/widget_pokemon_item.dart';

import '../../../common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap});
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Pokedex'),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(left: 10),
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu)))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: list
                  .map((e) => PokemonItemWidget(pokemon: e, onTap: onItemTap))
                  .toList()),
        ));
  }
}
