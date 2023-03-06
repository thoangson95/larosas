import 'package:flutter/material.dart';
import 'package:larosas/constants.dart';

class StarMetterWidget extends StatelessWidget {
  const StarMetterWidget({Key? key, this.score = 4.5}) : super(key: key);

  final double score;

  @override
  Widget build(BuildContext context) {
    late double totalScore = score;
    final children = <Widget>[];
    if (totalScore > 5) totalScore = 5;
    if (totalScore < 0) totalScore = 0;
    if (totalScore.floor() > 0) {
      for (var i = 0; i < totalScore.floor(); i++) {
        children.add(const Padding(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.star_rate_rounded,
            color: starMetterColor,
            size: 24,
          ),
        ));
      }
      if ((totalScore.ceil() - totalScore.floor()) > 0) {
        children.add(const Padding(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.star_half_rounded,
            color: starMetterColor,
            size: 24,
          ),
        ));
      }
      if (totalScore.ceil() < 5) {
        for (var i = 0; i < (5 - totalScore.ceil()); i++) {
          children.add(const Padding(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.star_outline_rounded,
              color: starMetterColor,
              size: 24,
            ),
          ));
        }
      }
    } else {
      for (var i = 0; i < 5; i++) {
        children.add(const Padding(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.star_outline_rounded,
            color: starMetterColor,
            size: 24,
          ),
        ));
      }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
