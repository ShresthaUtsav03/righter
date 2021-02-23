class CustomUser {
  final String uid;

  CustomUser({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final int level;
  final int wordDay;
  final int streakDay;
  final int wMeanings;
  final int mChoice;
  final int confusing;
  final int articles;
  final int prepositions;
  final int punctuations;
  final int present;
  final int past;
  final int future;

  UserData(
      {this.uid,
      this.name,
      this.wordDay,
      this.level,
      this.streakDay,
      this.wMeanings,
      this.mChoice,
      this.confusing,
      this.articles,
      this.prepositions,
      this.punctuations,
      this.past,
      this.present,
      this.future});
}
