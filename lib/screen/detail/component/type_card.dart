import 'package:flutter/material.dart';
import 'package:vorkraf_assessment/model/detail_model.dart';
import 'package:vorkraf_assessment/utils/app_style.dart';
import 'package:vorkraf_assessment/utils/pokemon_color.dart';

class Typecard extends StatelessWidget {
  const Typecard({super.key, required this.detailData});
  final DetailModel detailData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: detailData.types!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var item = detailData.types![index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Container(
              decoration: BoxDecoration(
                color: PokemonColor.getColor(item.type!.name!),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Center(
                  child: Text(
                    item.type!.name!,
                    style: AppStyles.subtitle2.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
