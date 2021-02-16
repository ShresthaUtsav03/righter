import 'package:flutter/material.dart';
import '../../widgets/menu_icon.dart';

class TenseSection extends StatefulWidget {
  final int pastLevel;
  final int presentLevel;
  final int futureLevel;

  TenseSection({this.futureLevel, this.pastLevel, this.presentLevel});
  @override
  _TenseSectionState createState() => _TenseSectionState();
}

class _TenseSectionState extends State<TenseSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.deepOrangeAccent,
                imageLocation: 'assets/images/present.png',
                level: widget.presentLevel,
                menuLabel: 'Present tense',
                quizId: 'present',
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItem(
                bgColor: Colors.greenAccent,
                imageLocation: 'assets/images/past.png',
                level: widget.pastLevel,
                menuLabel: 'Past tense',
                quizId: 'past',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                imageLocation: 'assets/images/future.png',
                level: widget.futureLevel,
                menuLabel: 'Future tense',
                quizId: 'future',
              ),
            ],
          )
        ],
      ),
    );
  }
}
