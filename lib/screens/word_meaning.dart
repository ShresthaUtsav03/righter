import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:righter/services/database/database.dart';

// ignore: must_be_immutable
class WordMeaning extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference wordData =
      FirebaseFirestore.instance.collection('vocabulary');

  String wordId = '';
  String uid = '';
  Map receivedPara = {};

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    receivedPara = ModalRoute.of(context).settings.arguments;
    //print(receivedPara);
    wordId = receivedPara['wordId'].toString();
    uid = receivedPara['uid'];
    bool _isButtonDisabled = false;

    return FutureBuilder<DocumentSnapshot>(
        future: wordData.doc(wordId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            if (wordId == '1') {
              _isButtonDisabled = true;
            }

            return Scaffold(
              appBar: AppBar(
                title: Text('Learn new words'),
              ),
              body: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['word'].toString().toUpperCase(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(height: 1.0),
                        Text(data['category'],
                            style: Theme.of(context).textTheme.subtitle1),
                        SizedBox(height: 30.0),
                        for (var meaning in data['meanings'])
                          Text('- ' + meaning,
                              style: Theme.of(context).textTheme.bodyText2),
                        SizedBox(height: 30.0),
                        Text(
                          'Synonyms:',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(height: 10.0),
                        for (var syn in data['synonyms'])
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
                        for (var eg in data['examples'])
                          Text(
                            '- ' + eg,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              disabledColor: Colors.grey[100],
                              onPressed: _isButtonDisabled
                                  ? null
                                  : () async {
                                      await DatabaseService(uid: uid)
                                          .downWord();
                                      Navigator.pop(context);
                                    },
                              child: Text(
                                'Previous word',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Theme.of(context).accentColor,
                            ),
                            SizedBox(width: 10.0),
                            RaisedButton(
                              onPressed: () async {
                                await DatabaseService(uid: uid).upWord();

                                Navigator.pop(context);
                              },
                              child: Text(
                                'Next word',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Theme.of(context).accentColor,
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            );
          }
          return Container();
        });
  }
}
