import 'package:flutter/material.dart';

import '../constants.dart';

class FooterButton extends StatelessWidget {
  final Function onTap;
  final String text;

  FooterButton({@required this.onTap, this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        color: kBottomButtonColor,
        margin: EdgeInsets.only(top: 10.0),
        height: 80.0,
        child: Center(
          child: Text(
            this.text,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
