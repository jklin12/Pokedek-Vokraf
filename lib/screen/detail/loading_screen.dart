import 'package:flutter/material.dart';
import 'package:vorkraf_assessment/screen/detail/component/bg_image.dart';
import 'package:vorkraf_assessment/utils/app_assets.dart';
import 'package:vorkraf_assessment/utils/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const BgImage(),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.6,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.ilhouette),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              )),
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
