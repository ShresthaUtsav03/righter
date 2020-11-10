import 'package:flutter/material.dart';

class WordMeaning extends StatelessWidget {
  final word = 'Obstinate';
  final group = 'Adjective';
  final meaning =
      'stubbornly refusing to change one\'s opinion or chosen course of action, despite attempts to persuade one to do so.';
  final synonyms = [
    'stubborn',
    'headstrong',
    'willful',
    'unyielding',
    'inflexible',
    'unbending'
  ];
  final uses = [
    'An obstinate person is difficult to persuade.',
    'My obstinate brother refuses to listen to vegan arguments'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Righter'),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[800],
      body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                word,
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                group,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                meaning,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  'Try it out!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.yellow[200],
              )
            ],
          )),
    );
  }
}
