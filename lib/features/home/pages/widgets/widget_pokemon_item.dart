import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/home/pages/widgets/widget_type_pokemon.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget(
      {Key? key, required this.pokemon, required this.onTap})
      : super(key: key);
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => onTap('/details', DetailArguments(pokemon: pokemon)),
            child: Container(
          decoration: BoxDecoration(
            color: pokemon.baseColor!.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(pokemon.num),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: pokemon.type
                            .map((e) => TypeWidget(name: e))
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Image.network(
                        pokemon.image,
                        width: 80,
                        height: 80,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
