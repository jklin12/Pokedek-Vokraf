import 'package:flutter/material.dart';
import 'package:vorkraf_assessment/model/detail_model.dart';
import 'package:vorkraf_assessment/utils/app_style.dart';
import 'package:vorkraf_assessment/utils/pokemon_color.dart';

class StatsDetail extends StatelessWidget {
  const StatsDetail({
    super.key,
    required this.detailModel,
  });
  final DetailModel detailModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0),
      child: Row(
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.end,
             
            children: [
              statsTitle("HP"),
              statsTitle("ATK"),
              statsTitle("DEF"),
              statsTitle("STATK"),
              statsTitle("SDEF"),
              statsTitle("SPD"),
            ],
           ),
            
          Expanded(
            child: Column(
              children: [
                stasBar(detailModel.stats![0].baseStat!),
                stasBar(detailModel.stats![1].baseStat!),
                stasBar(detailModel.stats![2].baseStat!),
                stasBar(detailModel.stats![3].baseStat!),
                stasBar(detailModel.stats![4].baseStat!),
                stasBar(detailModel.stats![5].baseStat!), 
                ],
            ),
          ),
        ],
      ),
    );
  }

  Widget statsTitle(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Text(
            label,
            style: AppStyles.subtitle2.copyWith(
        color: PokemonColor.getColor(detailModel.types!.first.type!.name!)),
          ),
    );
  }

  Widget stasBar(int value) {
    Color pokemonColor =
        PokemonColor.getColor(detailModel.types!.first.type!.name!);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:0.0),
      child: Row(
        children: [
          const SizedBox(height: 17,child: VerticalDivider(),),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:10.0),
             child: SizedBox(
              width: 20,
              child: Text(value.toString(),style: AppStyles.body2,)),
           ),
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                minHeight: 5,
                value: value / 300,
                backgroundColor: pokemonColor.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(pokemonColor),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
