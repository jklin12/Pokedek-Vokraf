import 'package:flutter/material.dart';

class PokemonColor {
  static Color getColor(String type) {
    switch (type.toLowerCase()) {
      case 'bug':
        return const Color(0xFFA8B723);
      case 'dark':
        return const Color(0xFF75754C);
      case 'dragon':
        return const Color(0xFF6F57FF);
      case 'electric':
        return const Color(0xFFF3CF30);
      case 'fairy':
        return const Color(0xFFEE6EAC);
      case 'fighting':
        return const Color(0xFFC12239);
      case 'fire':
        return const Color(0xFFF57D31);
      case 'flying':
        return const Color(0xFFA891EC);
      case 'ghost':
        return const Color(0xFF7D75FF);
      case 'grass':
        return const Color(0xFF74CB48);
      case 'ground':
        return const Color(0xFFAD9D6F);
      case 'ice':
        return const Color(0xFFA0E6FF);
      case 'normal':
        return const Color(0xFFA8A67F);
      case 'poison':
        return const Color(0xFFA43E6E);
      case 'psychic':
        return const Color(0xFFF85884);
      case 'rock':
        return const Color(0xFFB6A136);
      case 'steel':
        return const Color(0xFFB7B9D0);
      case 'water':
        return const Color(0xFF6493EB);
      default:
        return Colors.grey;
    }
  }
}