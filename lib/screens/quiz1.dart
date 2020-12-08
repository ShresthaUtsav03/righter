// import 'package:flutter/material.dart';

// class QuestionsMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[800],
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[],
//         ),
//       ),
//     );
//   }
// }

// class Quiz extends StatelessWidget {
//   final List<Map<String, Object>> questions;
//   final int questionIndex;
//   final Function answerQuestion;

//   Quiz(
//       {@required this.questions,
//       @required this.answerQuestion,
//       @required this.questionIndex});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Question(
//           questions[questionIndex]['question'],
//         ),
//         ...(questions[questionIndex]['options'] as List<Map<String, Object>>)
//             .map((option) {
//           return Answer(
//               () => answerQuestion(option['score']), option['option']);
//         }).toList()
//       ],
//     );
//   }
// }

// class Result extends StatelessWidget {
//   final int resultScore;
//   final Function resetHandler;

//   Result(this.resultScore, this.resetHandler);

//   String get resultPhrase {
//     String resultText;
//     if (resultScore >= 1) {
//       resultText = "You can start at level 2";
//     } else if (resultScore == 0) {
//       resultText = "You can start at level 1";
//     } else {
//       resultText = "Hmm";
//     }
//     return resultText;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           Text(
//             resultPhrase,
//             style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           FlatButton(
//             child: Text('Restart Quiz'),
//             textColor: Colors.blue,
//             onPressed: resetHandler,
//           )
//         ],
//       ),
//     );
//   }
// }

// class Answer extends StatelessWidget {
//   final Function selectHandler;
//   final String option;

//   Answer(this.selectHandler, this.option);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10.0),
//       child: RaisedButton(
//         color: Colors.grey[800],
//         textColor: Colors.white,
//         child: Text(option),
//         onPressed: selectHandler,
//       ),
//     );
//   }
// }

// class Question extends StatelessWidget {
//   final String questionStatement;

//   Question(this.questionStatement);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.all(10.0),
//       child: Text(
//         questionStatement,
//         style: TextStyle(fontSize: 24.0),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }
