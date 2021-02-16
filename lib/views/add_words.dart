// import 'package:flutter/material.dart';
// import 'package:righter/services/database/words_DB.dart';

// class AddWords extends StatefulWidget {
//   @override
//   _AddWordsState createState() => _AddWordsState();
// }

// class _AddWordsState extends State<AddWords> {
//   @override
//   Widget build(BuildContext context) {
//     WordDatabaseService databaseService = new WordDatabaseService();

//     //Map receivedPara = {};
//     final _formKey = GlobalKey<FormState>();
//     bool isLoading = false;
//     String wordID = '0';
//     String word, category;

//     uploadQuizData() async {
//       if (_formKey.currentState.validate()) {
//         setState(() {
//           isLoading = true;
//         });

//         Map<String, String> wordMap = {
//           "word": word,
//           "category": category,
//         };

//         print(wordID);
//         await databaseService.addWordData(wordMap, wordID, level).then((value) {
//           word = "";
//           category = "";

//           setState(() {
//             isLoading = false;
//           });
//         }).catchError((e) {
//           print(e);
//         });
//       } else {
//         print("error is happening ");
//       }
//     }

//     @override
//     Widget build(BuildContext context) {
//       //receivedPara = ModalRoute.of(context).settings.arguments;
//       //print(receivedPara);
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text(
//             'Add new word',
//             //receivedPara['wordID'],
//             style: TextStyle(color: Colors.black),
//           ),
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//           // iconTheme: IconThemeData(color: Colors.black97),
//         ),
//         body: isLoading
//             ? Container(
//                 child: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               )
//             : Form(
//                 key: _formKey,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 24),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         style: TextStyle(color: Colors.black),
//                         validator: (val) =>
//                             val.isEmpty ? "Enter the wordIdD" : null,
//                         decoration: InputDecoration(hintText: "WordID"),
//                         onChanged: (val) => level = val,
//                       ),
//                       SizedBox(height: 6),
//                       TextFormField(
//                         style: TextStyle(color: Colors.black),
//                         validator: (val) =>
//                             val.isEmpty ? "Enter the words" : null,
//                         decoration: InputDecoration(hintText: "word"),
//                         onChanged: (val) => word = val,
//                       ),
//                       SizedBox(height: 6),
//                       TextFormField(
//                         style: TextStyle(color: Colors.black),
//                         validator: (val) =>
//                             val.isEmpty ? "Enter Option 1 " : null,
//                         decoration: InputDecoration(hintText: "category"),
//                         onChanged: (val) => category = val,
//                       ),
//                       SizedBox(height: 6),
//                       TextFormField(
//                         style: TextStyle(color: Colors.black),
//                         validator: (val) =>
//                             val.isEmpty ? "Enter Option 2" : null,
//                         decoration: InputDecoration(hintText: "Option2"),
//                         onChanged: (val) => option2 = val,
//                       ),
//                       SizedBox(height: 6),
//                       TextFormField(
//                         style: TextStyle(color: Colors.black),
//                         validator: (val) =>
//                             val.isEmpty ? "Enter option3" : null,
//                         decoration: InputDecoration(hintText: "Option3"),
//                         onChanged: (val) => option3 = val,
//                       ),
//                       SizedBox(height: 6),
//                       TextFormField(
//                         style: TextStyle(color: Colors.black),
//                         validator: (val) =>
//                             val.isEmpty ? "Enter option4" : null,
//                         decoration: InputDecoration(hintText: "Option4"),
//                         onChanged: (val) => option4 = val,
//                       ),
//                       Spacer(),
//                       Row(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: MediaQuery.of(context).size.width / 2 - 20,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 24, vertical: 20),
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(30)),
//                               child: Text(
//                                 "Submit",
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.white),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 8,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               //print(receivedPara['wordID']);
//                               uploadQuizData(
//                                   //receivedPara['wordID'].toString()
//                                   );
//                             },
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: MediaQuery.of(context).size.width / 2 - 40,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 24, vertical: 20),
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(30)),
//                               child: Text(
//                                 "Add word",
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       );
//     }
//   }
// }
