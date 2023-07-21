import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;

  CardContainer({@required this.cardColor, this.cardChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
