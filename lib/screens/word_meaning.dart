import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:righter/shared/loading.dart';

class WordMeaning extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference wordData =
      FirebaseFirestore.instance.collection('vocabulary');

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
  final documentId = '1';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: wordData.doc(documentId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();

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
                        data['Word'].toString().toUpperCase(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 1.0),
                      Text(data['Category'],
                          style: Theme.of(context).textTheme.subtitle1),
                      SizedBox(height: 30.0),
                      for (var meaning in data['Meanings'])
                        Text('-' + meaning,
                            style: Theme.of(context).textTheme.bodyText2),
                      SizedBox(height: 30.0),
                      Text(
                        'Synonyms:',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(height: 10.0),
                      for (var syn in data['Synonyms'])
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
                      for (var eg in data['Examples'])
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
          return Loading();
        });
  }
}
