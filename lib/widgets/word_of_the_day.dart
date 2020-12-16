import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:righter/services/database/database.dart';
import 'package:righter/widgets/word_nav_button.dart';

class WordOfTheDay extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference tipData =
      FirebaseFirestore.instance.collection('vocabulary');

  final String wordId;
  final String uid;

  WordOfTheDay({this.wordId, this.uid});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: tipData.doc(wordId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();

          return (data == null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Please wait for new words to be added!',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.amberAccent),
                    ),
                    //WordNavButtons(uid: uid)
                  ],
                )
              : GestureDetector(
                  onTap: () {
                    //print("Learn new words wow!");
                    Navigator.pushNamed(context, '/word',
                        arguments: {'wordId': wordId, 'uid': uid});
                  },
                  child: Column(
                    children: [
                      Text(
                        data['Word'].toString().toUpperCase(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        data['Category'],
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                );
        }
        return Container();
      },
    );
  }
}
