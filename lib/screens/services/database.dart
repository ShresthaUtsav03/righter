import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:righter/models/levels.dart';
import 'package:righter/widgets/word_meaning.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //user specific levels reference
  final CollectionReference levelCollection =
      FirebaseFirestore.instance.collection('userLevels');

  Future updateUserData(
      String name,
      String wMeanings,
      String mChoice,
      String fitBlanks,
      String articles,
      String prepositions,
      String punctuations,
      String present,
      String past,
      String future) async {
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

  //level list from snapshot
  // List<Level> _levelListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     return Level(
  //         mChoice: doc.data()['mChoice'] ?? '1',
  //         articles: doc.data()['articles'] ?? '1',
  //         fitBlanks: doc.data()['fitBlanks'] ?? '1',
  //         name: doc.data()['name'] ?? '1',
  //         future: doc.data()['future'] ?? '1',
  //         past: doc.data()['past'] ?? '1',
  //         prepositions: doc.data()['prepositions'] ?? '1',
  //         present: doc.data()['present'] ?? '1',
  //         punctuations: doc.data()['punctuations'] ?? '1',
  //         wMeanings: doc.data()['wMeanings'] ?? '1');
  //   }).toList();
  // }

  //get user levels stream
  Stream<QuerySnapshot> get levels {
    return levelCollection.snapshots();
  }
}
