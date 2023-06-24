import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/details/container/pages/widgets/detail_app_bar_widget.dart';
import 'package:pokedex_flutter/features/details/container/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.list,
      required this.pokemon,
      required this.onBack});
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBarWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          DetailListWidget(pokemon: pokemon, list: list)
        ],
      ),
    );
  }
}
