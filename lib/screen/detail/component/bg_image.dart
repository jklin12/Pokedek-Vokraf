import 'package:flutter/material.dart';
import 'package:vorkraf_assessment/utils/app_assets.dart';

class BgImage extends StatelessWidget {
  const BgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.pokeball2),
                        fit: BoxFit.cover)),
              )),
          const Expanded(
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Card(
                color: Color.fromRGBO(239, 239, 239, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
