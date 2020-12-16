import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:righter/services/database/database.dart';
import 'package:righter/shared/loading.dart';
import 'package:righter/widgets/word_nav_button.dart';

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

    return FutureBuilder<DocumentSnapshot>(
        future: wordData.doc(wordId).get(),
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
                      SizedBox(height: 40.0),
                      // Text(
                      //   'Feeling confident?',
                      //   style: Theme.of(context).textTheme.subtitle1,
                      // ),
                      SizedBox(height: 10.0),
                      WordNavButtons(uid: uid)
                    ],
                  )),
            );
          }
          return Container();
        });
  }
}
