import 'package:flutter/material.dart';
import 'package:righter/widgets/menu_icon.dart';

class GrammarSection extends StatelessWidget {
  final String uid;
  final int bonusId;
  final int articlesLevel;
  final int prepositionsLevel;
  final int conjunctionsLevel;
  final int pastLevel;
  final int presentLevel;
  final int futureLevel;

  GrammarSection(
      {this.uid,
      this.bonusId,
      this.articlesLevel,
      this.prepositionsLevel,
      this.conjunctionsLevel,
      this.futureLevel,
      this.pastLevel,
      this.presentLevel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // return Container(
    //   height: 500,
    //   child: ListView.builder(
    //     itemBuilder: (context, index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01),
                Text(
                  'Verbs',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: height * 0.01),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                quizId: 'present',
                bgColor: Colors.deepOrangeAccent,
                imageLocation: 'assets/images/present.png',
                level: presentLevel,
                menuLabel: 'Present tense',
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItem(
                bgColor: Colors.greenAccent,
                imageLocation: 'assets/images/past.png',
                level: pastLevel,
                menuLabel: 'Past tense',
                quizId: 'past',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                imageLocation: 'assets/images/future.png',
                level: futureLevel,
                menuLabel: 'Future tense',
                quizId: 'future',
              ),
            ],
          ),
          SizedBox(height: height * 0.04),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01),
                Text('Others', style: Theme.of(context).textTheme.headline3),
                SizedBox(height: height * 0.01),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.deepOrangeAccent,
                imageLocation: 'assets/images/the.png',
                level: articlesLevel,
                menuLabel: 'articles',
                quizId: 'articles',
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.greenAccent,
                imageLocation: 'assets/images/prepositions.png',
                level: prepositionsLevel,
                menuLabel: 'Prepositions',
                quizId: 'prepositions',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                imageLocation: 'assets/images/conjunction.png',
                level: conjunctionsLevel,
                menuLabel: 'Conjuctions',
                quizId: 'conjuctions',
              )
            ],
          ),
          SizedBox(height: height * 0.02),
        ],
      ),

      //       );
      // },
      // itemCount: 5,
      //),
    );
  }
}
