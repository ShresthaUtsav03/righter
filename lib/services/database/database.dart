import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:righter/models/levels.dart';
import 'package:righter/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //user specific levels reference
  final CollectionReference levelCollection =
      FirebaseFirestore.instance.collection('userLevels');

  //level list from snapshot
  List<Level> _levelListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Level(
          mChoice: doc.data()['mChoice'] ?? '1',
          articles: doc.data()['articles'] ?? '1',
          fitBlanks: doc.data()['fitBlanks'] ?? '1',
          name: doc.data()['name'] ?? '1',
          future: doc.data()['future'] ?? '1',
          past: doc.data()['past'] ?? '1',
          prepositions: doc.data()['prepositions'] ?? '1',
          present: doc.data()['present'] ?? '1',
          punctuations: doc.data()['punctuations'] ?? '1',
          wMeanings: doc.data()['wMeanings'] ?? '1');
    }).toList();
  }

  //userData from Snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      fitBlanks: snapshot.data()['fitBlanks'],
      articles: snapshot.data()['articles'],
      future: snapshot.data()['future'],
      mChoice: snapshot.data()['mChoice'],
      name: snapshot.data()['name'],
      past: snapshot.data()['past'],
      prepositions: snapshot.data()['prepostitions'],
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

  //add userData to database when new user is created
  Future updateUserData(
      String name,
      int wMeanings,
      int mChoice,
      int fitBlanks,
      int articles,
      int prepositions,
      int punctuations,
      int present,
      int past,
      int future) async {
    return await levelCollection.doc(uid).set(
      {
        'name': name,
        'articles': articles,
        'fitBlanks': fitBlanks,
        'prepostitions': prepositions,
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

//get data of all users
// Stream<List<Level>> get levels {
//   return levelCollection.snapshots().map(_levelListFromSnapshot);
// }

//
