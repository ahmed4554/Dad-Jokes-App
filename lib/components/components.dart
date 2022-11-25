import 'package:dad_jokes/model/random_joke_model.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BuildJokeItem extends StatelessWidget {
  const BuildJokeItem({Key? key, required this.model}) : super(key: key);
  final JokeModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: mainColor,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '-${model.setup}',
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '=\"${model.delivery}\"',
            style: const TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class BuildColorPalletItem extends StatelessWidget {
  const BuildColorPalletItem({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
