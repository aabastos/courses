import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  final String hint;
  final Function onChanged;
  final TextInputType type;
  final bool obscure;

  final bool showError;
  final String errorText;

  RoundedInput({
    this.hint,
    this.onChanged,
    this.type,
    this.obscure,
    this.showError,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: this.type != null ? this.type : TextInputType.text,
      obscureText: this.obscure != null ? this.obscure : false,
      onChanged: this.onChanged != null ? this.onChanged : () {},
      textAlign: TextAlign.center,
      style: TextStyle(
        color: kInputTextColor,
      ),
      decoration: InputDecoration(
        hintText: this.hint != null ? this.hint : '',
        hintStyle: TextStyle(
          color: kInputTextColor,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kInputTextColor,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorText:
            this.showError != null && this.showError ? this.errorText : null,
      ),
    );
  }
}
