import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_flutter/common/consts/const_api.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

import '../errors/errors.dart';

abstract class IPokemonRepository {
 Future<List<Pokemon>> getAllPokemons();
}


class PokemonRepository implements IPokemonRepository {
  final Dio dio;
  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ConstApi.allPokemons);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Errors(message: 'Não foi possível recuperar dados da api');
    }
  }
}