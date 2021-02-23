import 'package:flutter/material.dart';

class OptionWidget extends StatefulWidget {
  final String option, description, optionSelected, correctOption;

  OptionWidget(
      {@required this.correctOption,
      @required this.description,
      @required this.option,
      @required this.optionSelected});

  @override
  _OptionWidgetState createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.optionSelected == widget.description
              ? widget.optionSelected == widget.correctOption
                  ? Colors.greenAccent
                  : Colors.redAccent
              : Colors.grey,
          width: 3.0,
        ),
        // color: widget.optionSelected == widget.description
        //     ? widget.description == widget.correctOption
        //         ? Colors.green.withOpacity(0.7)
        //         : Colors.red.withOpacity(0.7)
        //     : Colors.grey[750],
        borderRadius: BorderRadius.circular(13),
      ),
      child: Text(
        widget.description,
        style: TextStyle(color: Colors.white),
      ),
    );
    // return ButtonTheme(
    //   minWidth: width * 0.39,
    //   child: OutlineButton(
    //     //splashColor: Colors.deepOrangeAccent,
    //     disabledBorderColor: Colors.grey,
    //     focusColor: Colors.deepOrangeAccent,
    //     highlightedBorderColor: Colors.deepOrangeAccent,
    //     padding: EdgeInsets.all(20.0),
    //     onPressed: () {},
    //     borderSide: BorderSide(width: 1.0, color: Colors.white),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     child: Text(
    //       widget.optionInstance,
    //       style: Theme.of(context).textTheme.subtitle1,
    //     ),
    //   ),
    // );
  }
}
