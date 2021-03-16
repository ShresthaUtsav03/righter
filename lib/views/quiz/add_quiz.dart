import 'package:flutter/material.dart';

class AddQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Add Questions',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black97),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                  child: Text('Word Meanings'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuestion', arguments: {
                      'quizId': 'wMeanings',
                    });
                  }),
              RaisedButton(
                  child: Text('Multiple Choice'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuestion', arguments: {
                      'quizId': 'mChoice',
                    });
                  }),
              RaisedButton(
                  child: Text('Confusing terms'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuestion', arguments: {
                      'quizId': 'confusing',
                    });
                  }),
              RaisedButton(
                  child: Text('Present Tense'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuestion', arguments: {
                      'quizId': 'present',
                    });
                  }),
              RaisedButton(
                  child: Text('Past Tense'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuestion', arguments: {
                      'quizId': 'past',
                    });
                  }),
              RaisedButton(
                  child: Text('Future Tense'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuestion', arguments: {
                      'quizId': 'future',
                    });
                  }),
              RaisedButton(
                  child: Text('Phrasal Verbs'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuestion', arguments: {
                      'quizId': 'articles',
                    });
                  }),
              RaisedButton(
                  child: Text('Prepositions'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuestion', arguments: {
                      'quizId': 'prepositions',
                    });
                  }),
              RaisedButton(
                  child: Text('Conjunctions'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuestion', arguments: {
                      'quizId': 'conjunctions',
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
