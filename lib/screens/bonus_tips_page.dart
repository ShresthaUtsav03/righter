// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:righter/shared/loading.dart';

// class BonusTipsPage extends StatelessWidget {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   final CollectionReference wordData =
//       FirebaseFirestore.instance.collection('bonus');

//   final documentId = '1';

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//         future: wordData.doc(documentId).get(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("Something went wrong");
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data = snapshot.data.data();

//             return Scaffold(
//               appBar: AppBar(
//                 title: Text('Learn new words'),
//               ),
//               body: Container(
//                   margin: EdgeInsets.all(30.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         data['topic'].toString().toUpperCase(),
//                         style: Theme.of(context).textTheme.headline4,
//                       ),
//                       SizedBox(height: 1.0),
//                       Text(data['sub-topic'],
//                           style: Theme.of(context).textTheme.subtitle1),
//                       SizedBox(height: 30.0),
//                       // for (var meaning in data['Meanings'])
//                       //   Text('-' + meaning,
//                       //       style: Theme.of(context).textTheme.bodyText2),
//                       // SizedBox(height: 30.0),
//                       // Text(
//                       //   'Synonyms:',
//                       //   style: Theme.of(context).textTheme.bodyText1,
//                       // ),
//                       // SizedBox(height: 10.0),
//                       // for (var syn in data['Synonyms'])
//                       //   Text(
//                       //     '- ' + syn,
//                       //     style: Theme.of(context).textTheme.bodyText2,
//                       //   ),
//                       // SizedBox(height: 30.0),
//                       // Text(
//                       //   'Examples:',
//                       //   style: Theme.of(context).textTheme.bodyText1,
//                       // ),
//                       // SizedBox(height: 10.0),
//                       // for (var eg in data['Examples'])
//                       //   Text(
//                       //     '- ' + eg,
//                       //     style: Theme.of(context).textTheme.bodyText2,
//                       //   ),
//                       SizedBox(height: 20.0),
//                       RaisedButton(
//                         onPressed: () {},
//                         child: Text(
//                           'Try it out!',
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         color: Colors.yellow[200],
//                       )
//                     ],
//                   )),
//             );
//           }
//           return Loading();
//         });
//   }
// }
