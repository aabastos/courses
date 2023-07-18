import 'package:flutter/material.dart';

const Color kBackgroundColor = Colors.grey;
const Color kPrimaryButtonColor = Colors.lightBlueAccent;
const Color kSecondaryButtonColor = Colors.blueAccent;

const Color kInputTextColor = Colors.black54;

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kContactNameTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 30.0,
);

const kContactEmailTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 15.0,
);
