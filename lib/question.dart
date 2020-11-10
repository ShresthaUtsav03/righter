import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionStatement;

  Question(this.questionStatement);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
        questionStatement,
        style: TextStyle(fontSize: 24.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
