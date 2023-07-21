import 'package:flutter/material.dart';

import '../constants.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  CircularButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      elevation: 2.0,
      fillColor: kBackgroundButtonsColor,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(
        icon,
        size: 20.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}
