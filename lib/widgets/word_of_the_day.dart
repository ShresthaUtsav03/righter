import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:righter/services/database/database.dart';

class WordOfTheDay extends StatefulWidget {
  String wordId;
  String uid;

  WordOfTheDay({this.wordId, this.uid});

  @override
  _WordOfTheDayState createState() => _WordOfTheDayState();
}

class _WordOfTheDayState extends State<WordOfTheDay> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference tipData =
      FirebaseFirestore.instance.collection('vocabulary');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: tipData.doc(widget.wordId).get(),
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
                    RaisedButton(
                      onPressed: () async {
                        await DatabaseService(uid: widget.uid).downWord();
                        setState(() {
                          widget.wordId =
                              (int.parse(widget.wordId) - 1).toString();
                        });
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
                    //WordNavButtons(uid: uid)
                  ],
                )
              : InkWell(
                  onTap: () {
                    //print("Learn new words wow!");
                    Navigator.pushNamed(context, '/word', arguments: {
                      'wordId': widget.wordId,
                      'uid': widget.uid
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        data['word'].toString().toUpperCase(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        data['category'],
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
