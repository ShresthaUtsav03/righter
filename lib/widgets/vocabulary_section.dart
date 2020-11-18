import 'package:flutter/material.dart';

import 'menu_icon.dart';

class VocabularySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            onTap: () {
              print("Learn new words wow!");
              Navigator.pushNamed(context, '/word');
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
                    'Word of the day',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'OBSTINATE',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'adjective',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
          MenuItem(
            bgColor: Colors.deepOrangeAccent,
            imageLocation: 'assets/images/dictionary.png',
            level: 1,
            menuLabel: 'Word Meanings',
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.greenAccent,
                imageLocation: 'assets/images/select.png',
                level: 2,
                menuLabel: 'Multiple Choice',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                imageLocation: 'assets/images/question_mark.png',
                level: 3,
                menuLabel: 'Fill in the blanks',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
