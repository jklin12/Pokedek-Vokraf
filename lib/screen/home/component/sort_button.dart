import 'package:flutter/material.dart';
import 'package:vorkraf_assessment/utils/app_colors.dart';
import 'package:vorkraf_assessment/utils/app_style.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Action when button is tapped
          //print('Button tapped');
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text('#',
                style:
                    AppStyles.mainFont.copyWith(color: AppColors.identityColor,fontSize: 15)),
          ),
        ),
      ),
    );
  }
}
