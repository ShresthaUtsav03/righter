import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:righter/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //user specific levels reference
  final CollectionReference levelCollection =
      FirebaseFirestore.instance.collection('userLevels');

  //userData from Snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      streakDay: snapshot.data()['streakDay'],
      level: snapshot.data()['level'],
      wordDay: snapshot.data()['wordDay'],
      confusing: snapshot.data()['confusing'],
      articles: snapshot.data()['articles'],
      future: snapshot.data()['future'],
      mChoice: snapshot.data()['mChoice'],
      name: snapshot.data()['name'],
      past: snapshot.data()['past'],
      prepositions: snapshot.data()['prepositions'],
      present: snapshot.data()['present'],
      punctuations: snapshot.data()['punctuations'],
      wMeanings: snapshot.data()['wMeanings'],
    );
  }

  //get levels of the user
  Stream<UserData> get userData {
    return levelCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  //update username only

  Future updateUsername(
    String name,
  ) async {
    return await levelCollection.doc(uid).update({
      'name': name,
    }).then((_) {
      //print("Username changed!");
    });
  }

  Future upWord() async {
    return await levelCollection.doc(uid).update({
      'wordDay': FieldValue.increment(1),
    }).then((_) {
      print("Increment!");
    });
  }

  Future downWord() async {
    return await levelCollection.doc(uid).update({
      'wordDay': FieldValue.increment(-1),
    }).then((_) {
      print("Decrement!");
    });
  }

  //add userData to database when new user is created
  Future updateUserData(
      String name,
      int wordDay,
      int level,
      int streakDay,
      int wMeanings,
      int mChoice,
      int confusing,
      int articles,
      int prepositions,
      int punctuations,
      int present,
      int past,
      int future) async {
    return await levelCollection.doc(uid).set(
      {
        'name': name,
        'wordDay': wordDay,
        'level': level,
        'streakDay': streakDay,
        'articles': articles,
        'confusing': confusing,
        'prepositions': prepositions,
        'mChoice': mChoice,
        'wMeanings': wMeanings,
        'punctuations': punctuations,
        'past': past,
        'present': present,
        'future': future,
      },
    );
  }
}

//level list from snapshot
// List<Level> _levelListFromSnapshot(QuerySnapshot snapshot) {
//   return snapshot.docs.map((doc) {
//     return Level(
//         mChoice: doc.data()['mChoice'] ?? '1',
//         articles: doc.data()['articles'] ?? '1',
//         confusing: doc.data()['confusing'] ?? '1',
//         name: doc.data()['name'] ?? 'username',
//         future: doc.data()['future'] ?? '1',
//         past: doc.data()['past'] ?? '1',
//         prepositions: doc.data()['prepositions'] ?? '1',
//         present: doc.data()['present'] ?? '1',
//         punctuations: doc.data()['punctuations'] ?? '1',
//         wMeanings: doc.data()['wMeanings'] ?? '1');
//   }).toList();
// }

//get data of all users
// Stream<List<Level>> get levels {
//   return levelCollection.snapshots().map(_levelListFromSnapshot);
// }

//
