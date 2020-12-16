import 'package:flutter/material.dart';
import 'package:righter/widgets/bonus_tips_card.dart';
import 'package:righter/widgets/menu_icon.dart';

class GrammarSection extends StatefulWidget {
  final int articlesLevel;
  final int prepositionsLevel;
  final int punctuationsLevel;

  GrammarSection(
      {this.articlesLevel, this.prepositionsLevel, this.punctuationsLevel});

  @override
  _GrammarSectionState createState() => _GrammarSectionState();
}

class _GrammarSectionState extends State<GrammarSection> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 500,
    //   child: ListView.builder(
    //     itemBuilder: (context, index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            onTap: () {
              print('object');
              Navigator.pushNamed(context, '/bonus');
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              elevation: 5.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  Text(
                    'Bonus tips',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 10.0),
                  BonusTip(),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.deepOrangeAccent,
                imageLocation: 'assets/images/the.png',
                level: widget.articlesLevel,
                menuLabel: 'Articles',
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.greenAccent,
                imageLocation: 'assets/images/prepositions.png',
                level: widget.prepositionsLevel,
                menuLabel: 'Prepositions',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                imageLocation: 'assets/images/punctuations.png',
                level: widget.punctuationsLevel,
                menuLabel: 'Punctuations',
              )
            ],
          ),
        ],
      ),

      //       );
      // },
      // itemCount: 5,
      //),
    );
  }
}
