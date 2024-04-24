import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
    );
  }
}
