import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/features/details/container/pages/detail_error.dart';
import 'package:pokedex_flutter/features/details/container/pages/detail_loading.dart';
import 'package:pokedex_flutter/features/details/container/pages/detail_page.dart';
import 'package:pokedex_flutter/features/home/pages/home_error.dart';
import 'package:pokedex_flutter/features/home/pages/home_loading.dart';
import 'package:pokedex_flutter/features/home/pages/home_page.dart';

import '../../../common/errors/errors.dart';

class DetailArguments {
  DetailArguments({required this.name});
  final String name;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({Key? key, required this.repository, required this.arguments});
  final PokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const DetailLoading();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return DetailPage(name: arguments.name, list: snapshot.data!);
          } else if (snapshot.hasError) {
            final error = snapshot.error as Errors?;
            final errorMessage = error?.message ?? 'An error occurred';
            return DetailError();
          }
        }
        return const Text('Testando');
      },
    );
  }
}
