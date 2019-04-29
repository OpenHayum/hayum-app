import 'package:flutter/material.dart';

class HayumTextField extends StatelessWidget {
  HayumTextField({Key key, this.labelText, bool obscureText = false})
      : this.obscureText = obscureText,
        super(key: key);

  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: this.obscureText,
        decoration: new InputDecoration(
          labelText: labelText,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
        ));
  }
}
