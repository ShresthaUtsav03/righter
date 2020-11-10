import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String option;

  Answer(this.selectHandler, this.option);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        color: Colors.grey[800],
        textColor: Colors.white,
        child: Text(option),
        onPressed: selectHandler,
      ),
    );
  }
}
