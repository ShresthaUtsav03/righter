class CustomUser {
  final String uid;

  CustomUser({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final int wordDay;
  final int streakDay;
  final int wMeanings;
  final int mChoice;
  final int fitBlanks;
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
      this.streakDay,
      this.wMeanings,
      this.mChoice,
      this.fitBlanks,
      this.articles,
      this.prepositions,
      this.punctuations,
      this.past,
      this.present,
      this.future});
}
