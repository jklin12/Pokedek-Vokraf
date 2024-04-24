import 'package:flutter/material.dart';
import 'package:vorkraf_assessment/utils/app_assets.dart';
import 'package:vorkraf_assessment/utils/app_style.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
      child: Row(
        children: [
          Image.asset(AppAssets.pokeball1),
          const SizedBox(
            width: 8,
          ),
            Text(
            "Pokédex",
            style: AppStyles.headline.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
