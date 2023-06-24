import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/repository/pokemon_repository.dart';
import 'package:pokedex_flutter/features/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({ super.key, required this.pokemonRepository });
  final PokemonRepository pokemonRepository;

   @override
   Widget build(BuildContext context) {
       return Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
            builder: (context)  {
              return HomeContainer(
                repository: pokemonRepository, 
              onItemTap: (route, arguments ) { 
                Navigator.of(context).pushNamed(route, arguments: arguments);
               },);
            }
          );
          }
          if (settings.name == '/details') {
            return MaterialPageRoute(
            builder: (context)  {
              return DetailContainer(
                repository: pokemonRepository,
                arguments: (settings.arguments as DetailArguments), 
                onBack: () => Navigator.of(context).pop(),
                
                );
            }
          );
          }
        }
       );
  }
}