import 'package:flutter/material.dart';
import 'package:righter/models/words.dart';
import 'package:righter/services/database/words_DB.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:righter/shared/loading.dart';

import '../../widgets/menu_icon.dart';

class VocabularySection extends StatefulWidget {
  final int wMeaningsLevel;
  final int mChoiceLevel;
  final int fitBlanksLevel;

  VocabularySection(
      {this.fitBlanksLevel, this.mChoiceLevel, this.wMeaningsLevel});
  @override
  _VocabularySectionState createState() => _VocabularySectionState();
}

class _VocabularySectionState extends State<VocabularySection> {
  @override
  Widget build(BuildContext context) {
    // final levels = Provider.of<List<Level>>(context);
    // levels.forEach((level) {
    //   print(level.name);
    //   print(level.past);
    //   print(level.present);
    // });
    // for (var doc in levels.docs) {
    //   print(doc.data()['present']);
    // }
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
              onTap: () {
                //print("Learn new words wow!");
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
                      'noun',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              )),
          MenuItem(
            bgColor: Colors.deepOrangeAccent,
            imageLocation: 'assets/images/dictionary.png',
            level: widget.wMeaningsLevel,
            menuLabel: 'Word Meanings',
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.greenAccent,
                imageLocation: 'assets/images/select.png',
                level: widget.mChoiceLevel,
                menuLabel: 'Multiple Choice',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                imageLocation: 'assets/images/question_mark.png',
                level: widget.fitBlanksLevel,
                menuLabel: 'Fill in the blanks',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
