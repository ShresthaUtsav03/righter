import 'package:cloud_firestore/cloud_firestore.dart';

class QuizDatabaseService {
  Future<void> addQuestionData(quizData, String quizId, String level) async {
    await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizId)
        .collection(level)
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }

  getQuestionData(String quizId) async {
    return await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizId)
        .collection("1")
        .get();
  }
}
