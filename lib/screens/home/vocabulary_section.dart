import 'package:flutter/material.dart';
import 'package:righter/widgets/word_of_the_day.dart';
import '../../widgets/menu_icon.dart';

class VocabularySection extends StatelessWidget {
  final String uid;
  final int wordDay;
  final int wMeaningsLevel;
  final int mChoiceLevel;
  final int fitBlanksLevel;

  VocabularySection(
      {this.uid,
      this.wordDay,
      this.fitBlanksLevel,
      this.mChoiceLevel,
      this.wMeaningsLevel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    // final wordData = Provider.of<WordData>(context);
    // print(wordData.word);
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
          Container(
            height: height * 0.267,
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
                  WordOfTheDay(wordId: wordDay.toString(), uid: uid),
                ],
              ),
            ),
          ),
          MenuItem(
            bgColor: Colors.deepOrangeAccent,
            imageLocation: 'assets/images/dictionary.png',
            level: wMeaningsLevel,
            menuLabel: 'Word Meanings',
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.greenAccent,
                imageLocation: 'assets/images/select.png',
                level: mChoiceLevel,
                menuLabel: 'Multiple Choice',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                imageLocation: 'assets/images/question_mark.png',
                level: fitBlanksLevel,
                menuLabel: 'Fill in the blanks',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
