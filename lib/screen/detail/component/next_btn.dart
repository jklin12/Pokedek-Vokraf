import 'package:flutter/material.dart';

class NextBtn extends StatelessWidget {
  const NextBtn({super.key, required this.dataId,required this.onTap});
  final int dataId;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )),
    );
  }
}
