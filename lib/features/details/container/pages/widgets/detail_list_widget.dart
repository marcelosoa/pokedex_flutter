import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/home/pages/widgets/widget_pokemon_item.dart';

import '../../../../../common/models/pokemon.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({super.key, required this.pokemon, required this.list});
  final Pokemon pokemon;
  final List<Pokemon> list;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 80,
        left: 0,
        right: 0,
        height: 350,
        child: Container(
          color: pokemon.baseColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(pokemon.name,
                              style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        Text(pokemon.num,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 56.0),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: PageView(
                    children: list.map((e) => Image.network(
                      e.image,
                      // height: 50,
                      // width: 100,
                      fit: BoxFit.scaleDown,
                    )).toList(),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
