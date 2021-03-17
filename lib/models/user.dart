class CustomUser {
  final String uid;

  CustomUser({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final int wordDay;
  final int wMeanings;
  final int mChoice;
  final int confusing;
  final int random;
  final int prepositions;
  final int conjunctions;
  final int present;
  final int past;
  final int future;

  UserData(
      {this.uid,
      this.name,
      this.wordDay,
      this.wMeanings,
      this.mChoice,
      this.confusing,
      this.random,
      this.prepositions,
      this.conjunctions,
      this.past,
      this.present,
      this.future});
}
