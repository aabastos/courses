import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String name;
  final String email;
  final Function onPressed;

  ContactItem({
    @required this.name,
    @required this.email,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      onPressed: this.onPressed,
      shape: Border(
        bottom: BorderSide(
          color: Colors.black12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            this.name,
            style: kContactNameTextStyle,
          ),
          Text(
            this.email,
            style: kContactEmailTextStyle,
          ),
        ],
      ),
    );
  }
}
