import 'package:flutter/material.dart';
import 'package:vorkraf_assessment/model/detail_model.dart';
import 'package:vorkraf_assessment/model/species_model.dart';
import 'package:vorkraf_assessment/utils/app_assets.dart';
import 'package:vorkraf_assessment/utils/app_style.dart';

class AboutDetail extends StatelessWidget {
  const AboutDetail(
      {super.key, required this.detailData, required this.speciesData});
  final DetailModel detailData;
  final SpeciesModel speciesData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weigth(),
              const VerticalDivider(),
              height(),
              const VerticalDivider(),
              moves()
            ],
          ),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            speciesData.flavorTextEntries![0].flavorText!,
            style: AppStyles.body3,
          ),
        )
      ],
    );
  }

  Widget moves() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              detailData.moves![0].move!.name!,
              style: AppStyles.body3,
            ),
            Text(
              detailData.moves![1].move!.name!,
              style: AppStyles.body3,
            ),
          ],
        ),
        caption('moves')
      ],
    );
  }

  Widget weigth() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Image.asset(AppAssets.weight),
              Text(
                "${detailData.weight!} kg",
                style: AppStyles.body3,
              )
            ],
          ),
        ),
        caption('Height'),
      ],
    );
  }

  Widget height() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Image.asset(AppAssets.straighten),
              Text(
                "${detailData.height!} m",
                style: AppStyles.body3,
              )
            ],
          ),
        ),
        caption("Height")
      ],
    );
  }

  Widget caption(String caption) {
    return Text(
      caption,
      style: AppStyles.body2,
    );
  }
}
