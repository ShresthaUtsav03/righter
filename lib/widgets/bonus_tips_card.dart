import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:righter/shared/loading.dart';

class BonusTip extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference tipData =
      FirebaseFirestore.instance.collection('bonus');

  final documentId = '1';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: tipData.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();

          return Column(
            children: [
              Text(
                data['topic'],
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 10.0),
              Text(
                data['sub-topic'],
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          );
        }
        return Loading();
      },
    );
  }
}
