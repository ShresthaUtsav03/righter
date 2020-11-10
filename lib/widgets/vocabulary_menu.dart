import 'package:flutter/material.dart';

import '../widgets/menu_icon.dart';

class VocabularyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                  SizedBox(height: 10.0),
                  Text(
                    'Word of the day',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
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
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
          MenuItem(
            bgColor: Colors.deepOrangeAccent,
            iconSize: 1.0,
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
                iconSize: 1.0,
                imageLocation: 'assets/images/select.png',
                level: 2,
                menuLabel: 'Multiple Choice',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                iconSize: 1.0,
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
