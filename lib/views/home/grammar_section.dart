import 'package:flutter/material.dart';
import 'package:righter/widgets/menu_icon.dart';

class GrammarSection extends StatelessWidget {
  final String uid;
  final int bonusId;
  final int articlesLevel;
  final int prepositionsLevel;
  final int punctuationsLevel;
  final int pastLevel;
  final int presentLevel;
  final int futureLevel;

  GrammarSection(
      {this.uid,
      this.bonusId,
      this.articlesLevel,
      this.prepositionsLevel,
      this.punctuationsLevel,
      this.futureLevel,
      this.pastLevel,
      this.presentLevel});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 500,
    //   child: ListView.builder(
    //     itemBuilder: (context, index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.0),
                Text(
                  'Verbs',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          SizedBox(height: 20.0),
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
          SizedBox(height: 20.0),

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
          // InkWell(
          //   onTap: () {
          //     print('object');
          //     Navigator.pushNamed(context, '/bonus');
          //   },
          //   child: Card(
          //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          //     elevation: 5.0,
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         SizedBox(height: 20.0),
          //         Text(
          //           'Bonus tips',
          //           style: Theme.of(context).textTheme.headline3,
          //         ),
          //         SizedBox(height: 10.0),
          //         BonusTip(bonusId: bonusId, uid: uid),
          //         SizedBox(height: 20.0),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: 20.0),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.0),
                Text('Others', style: Theme.of(context).textTheme.headline3),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.deepOrangeAccent,
                imageLocation: 'assets/images/the.png',
                level: articlesLevel,
                menuLabel: 'Articles',
                quizId: 'articles',
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
                level: prepositionsLevel,
                menuLabel: 'Prepositions',
                quizId: 'prepositions',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                imageLocation: 'assets/images/punctuations.png',
                level: punctuationsLevel,
                menuLabel: 'Punctuations',
                quizId: 'punctuations',
              )
            ],
          ),
          SizedBox(height: 20.0),
        ],
      ),

      //       );
      // },
      // itemCount: 5,
      //),
    );
  }
}
