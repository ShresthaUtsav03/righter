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
        title: Text('Learn new words'),
      ),
      body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                word,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 1.0),
              Text(group, style: Theme.of(context).textTheme.subtitle1),
              SizedBox(height: 30.0),
              Text(meaning, style: Theme.of(context).textTheme.bodyText2),
              SizedBox(height: 30.0),
              Text(
                'Synonyms:',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 10.0),
              for (var syn in synonyms)
                Text(
                  '- ' + syn,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              SizedBox(height: 30.0),
              Text(
                'Examples:',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 10.0),
              for (var eg in uses)
                Text(
                  '- ' + eg,
                  style: Theme.of(context).textTheme.bodyText2,
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
