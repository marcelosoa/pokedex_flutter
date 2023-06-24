import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/features/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/home/pages/home_error.dart';
import 'package:pokedex_flutter/features/home/pages/home_loading.dart';
import 'package:pokedex_flutter/features/home/pages/home_page.dart';

import '../../../common/errors/errors.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.repository, required this.onItemTap});
  final PokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return HomePage(list: snapshot.data!, onItemTap: onItemTap);
          } else if (snapshot.hasError) {
            final error = snapshot.error as Errors?;
            final errorMessage = error?.message ?? 'An error occurred';
            return HomeError(error: errorMessage);
          }
        }
        return const Text('Testando');
      },
    );
  }
}
