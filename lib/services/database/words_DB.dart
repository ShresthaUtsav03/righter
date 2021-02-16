// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:righter/models/words.dart';

// class WordDatabaseService {
//   final int day;

//   WordDatabaseService({this.day});
//   final firestoreInstance = FirebaseFirestore.instance;
//   final CollectionReference wordCollection =
//       FirebaseFirestore.instance.collection('vocabulary');

//   Future<void> addWordData(quizData, String level) async {
//     await FirebaseFirestore.instance
//         .collection("quiz")
//         .doc(wordID)
//         .collection(level)
//         .add(quizData)
//         .catchError((e) {
//       print(e);
//     });
//   }

//   WordData _wordDataFromSnapshot(DocumentSnapshot snapshot) {
//     print(snapshot.data()['word']);
//     return WordData(
//       word: snapshot.data()['Word'],
//       category: snapshot.data()['Category'],
//       examples: snapshot.data()['Examples'],
//       meanings: snapshot.data()['Meanings'],
//       synonyms: snapshot.data()['Synonyms'],
//     );
//   }

//   //get word of the day
//   Stream<WordData> get wordData {
//     return wordCollection
//         .doc(day.toString())
//         .snapshots()
//         .map(_wordDataFromSnapshot);
//   }

//   void allWords(int day) {
//     firestoreInstance
//         .collection('vocabulary')
//         .doc(day.toString())
//         .get()
//         .then((value) {
//       return WordData(
//         word: value.data()['word'],
//         category: value.data()['category'],
//         examples: value.data()['examples'],
//         meanings: value.data()['meanings'],
//         synonyms: value.data()['synonyms'],
//       );
//     });
//   }
// }
