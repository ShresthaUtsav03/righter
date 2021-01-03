import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final String optionInstance;
  OptionWidget({this.optionInstance});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ButtonTheme(
      minWidth: width * 0.39,
      child: OutlineButton(
        //splashColor: Colors.deepOrangeAccent,
        disabledBorderColor: Colors.grey,
        focusColor: Colors.deepOrangeAccent,
        highlightedBorderColor: Colors.deepOrangeAccent,
        padding: EdgeInsets.all(20.0),
        onPressed: () {},
        borderSide: BorderSide(width: 1.0, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          optionInstance,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
