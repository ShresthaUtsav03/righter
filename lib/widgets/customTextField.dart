import 'package:flutter/material.dart';
import 'package:righter/shared/constants.dart';

class Customtextfield extends StatelessWidget {
  final bool issecured;
  final String hint;
  final Function changeFunction;
  final Function validateFunction;

  Customtextfield(
      {this.hint, this.issecured, this.changeFunction, this.validateFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        validator: validateFunction,
        obscureText: issecured,
        onChanged: changeFunction,
        decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[300],
            errorStyle: errorStyle,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(color: Theme.of(context).accentColor, width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.transparent))),
        style: TextStyle(
          color: Colors.black.withOpacity(0.8),
          fontWeight: FontWeight.w600,
          fontSize: 23,
        ),
      ),
    );
  }
}
