import 'package:flutter/material.dart';
import 'package:vorkraf_assessment/screen/detail/detail_screen.dart';
import 'package:vorkraf_assessment/utils/app_style.dart';

class Tumbnail extends StatelessWidget {
  final String name;
  final String number;
  final String image;

  const Tumbnail(
      {super.key,
      required this.name,
      required this.number,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(DetailScreen.id, arguments: number),
      child: Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 3.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "#${number.padLeft(3, '0')}",
                    style: AppStyles.subtitle2
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ),
                Center(
                  child: Image.network(
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png",
                    width: 50,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      name,
                      style: AppStyles.subtitle1
                          .copyWith(fontWeight: FontWeight.w300),
                    ))
              ],
            ),
          )),
    );
  }
}
