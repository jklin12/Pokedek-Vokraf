import 'package:flutter/material.dart';

class PrevBtn extends StatelessWidget {
  const PrevBtn({super.key, required this.dataId,required this.onTap});
  final int dataId;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: dataId - 1 == 0
          ? const SizedBox(
              width: 50,
              height: 50
            )
          : IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
    );
  }
}
