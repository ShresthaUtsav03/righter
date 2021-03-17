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
      wordDay: snapshot.data()['wordDay'],
      confusing: snapshot.data()['confusing'],
      random: snapshot.data()['random'],
      future: snapshot.data()['future'],
      mChoice: snapshot.data()['mChoice'],
      name: snapshot.data()['name'],
      past: snapshot.data()['past'],
      prepositions: snapshot.data()['prepositions'],
      present: snapshot.data()['present'],
      conjunctions: snapshot.data()['conjunctions'],
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

  Future upLevel(String categoryName) async {
    return await levelCollection.doc(uid).update({
      '$categoryName': FieldValue.increment(1),
    }).then((_) {
      print("Increment!");
    });
  }

  //add userData to database when new user is created
  Future updateUserData(
      String name,
      int wordDay,
      int wMeanings,
      int mChoice,
      int confusing,
      int random,
      int prepositions,
      int conjunctions,
      int present,
      int past,
      int future) async {
    return await levelCollection.doc(uid).set(
      {
        'name': name,
        'wordDay': wordDay,
        'random': random,
        'confusing': confusing,
        'prepositions': prepositions,
        'mChoice': mChoice,
        'wMeanings': wMeanings,
        'conjunctions': conjunctions,
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
//         random: doc.data()['random'] ?? '1',
//         confusing: doc.data()['confusing'] ?? '1',
//         name: doc.data()['name'] ?? 'username',
//         future: doc.data()['future'] ?? '1',
//         past: doc.data()['past'] ?? '1',
//         prepositions: doc.data()['prepositions'] ?? '1',
//         present: doc.data()['present'] ?? '1',
//         conjunctions: doc.data()['conjunctions'] ?? '1',
//         wMeanings: doc.data()['wMeanings'] ?? '1');
//   }).toList();
// }

//get data of all users
// Stream<List<Level>> get levels {
//   return levelCollection.snapshots().map(_levelListFromSnapshot);
// }

//
