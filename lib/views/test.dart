// import 'package:flutter/material.dart';

// class Rightly extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _RightlyState();
//   }
// }

// class _RightlyState extends State<Rightly> {
//   final _questions = const [
//     {
//       'question': 'I have lived here ______ 6 years.',
//       'options': [
//         {'option': 'for', 'score': 1},
//         {'option': 'since', 'score': 0},
//         {'option': 'from', 'score': 0},
//         {'option': 'till', 'score': 0}
//       ]
//     },
//     {
//       'question': 'I have _____ too many burgers today.',
//       'options': [
//         {'option': 'had', 'score': 1},
//         {'option': 'have', 'score': 0},
//         {'option': 'has', 'score': 0}
//       ]
//     }
//   ];

//   var _questionIndex = 0;
//   var _totalScore = 0;

//   void _resetQuiz() {
//     setState(() {
//       _questionIndex = 0;
//       _totalScore = 0;
//     });
//   }

//   void _answerQuestion(int score) {
//     _totalScore += score;
//     setState(() {
//       _questionIndex = _questionIndex + 1;
//     });
//     print(_questionIndex);
//     if (_questionIndex < _questions.length) {
//       print('We have more questions!');
//     } else {
//       print('No more questions');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('right~ly'),
//         ),
//         body: _questionIndex < _questions.length
//             ? Quiz(
//                 answerQuestion: _answerQuestion,
//                 questionIndex: _questionIndex,
//                 questions: _questions,
//               )
//             : Result(_totalScore, _resetQuiz),
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
