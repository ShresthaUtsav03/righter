import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:righter/models/question_model.dart';
import 'package:righter/services/database/quiz_DB.dart';
import 'package:righter/shared/loading.dart';
import 'package:righter/views/quiz/results.dart';
import 'package:righter/widgets/optionBox.dart';

class Quiz extends StatefulWidget {
  final String quizId, quizLabel;

  Quiz(this.quizId, this.quizLabel);

  @override
  _QuizState createState() => _QuizState();
}

int total = 0;
int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;

class _QuizState extends State<Quiz> {
  QuizDatabaseService databaseService = new QuizDatabaseService();
  QuerySnapshot questionSnapshot;

  QuestionModel getQuestionModel(DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = new QuestionModel();

    questionModel.question = questionSnapshot.data()["question"];
    questionModel.hint = questionSnapshot.data()["hint"];

    List<String> options = [
      questionSnapshot.data()["option1"],
      questionSnapshot.data()["option2"],
      questionSnapshot.data()["option3"],
      questionSnapshot.data()["option4"],
    ];

    options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctAnswer = questionSnapshot.data()["option1"];
    questionModel.answered = false;

    return questionModel;
  }

  @override
  void initState() {
    print("${widget.quizId}");
    databaseService.getQuestionData(widget.quizId).then((value) {
      questionSnapshot = value;
      _notAttempted = 0;
      _correct = 0;
      _incorrect = 0;
      total = questionSnapshot.docs.length;
      print("Total is $total for ${widget.quizId}");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.quizLabel,
          style: TextStyle(color: Colors.black),
        ),
        //backgroundColor: Colors.transparent,
        elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black97),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: questionSnapshot == null
              ? Container(
                  child: Loading(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: questionSnapshot.docs.length,
                  itemBuilder: (context, index) {
                    return QuizPlayTile(
                        questionModel:
                            getQuestionModel(questionSnapshot.docs[index]),
                        index: index);
                  }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return Results(
                  correct: _correct,
                  incorrect: _incorrect,
                  notattempted: _notAttempted,
                  total: total,
                );
              }),
            );
          }),
    );
  }
}

class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  QuizPlayTile({this.questionModel, this.index});
  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";
  void _showHint(bool isCorrect) {
    showModalBottomSheet(
        backgroundColor: Colors.grey[800],
        //isCorrect ? Colors.greenAccent.withOpacity(0.5) : Colors.redAccent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: isCorrect
                  ? Colors.green[900].withOpacity(0.8)
                  : Colors.red[900].withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //SizedBox(height: 20.0),
                  Text("Correct answer is:",
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 10.0),
                  Text(
                    widget.questionModel.correctAnswer,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 24.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    widget.questionModel.hint,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Spacer(),
                  isCorrect
                      ? Row(
                          children: [
                            Spacer(),
                            Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 35.0,
                            ),
                            Text("Good Job!")
                          ],
                        )
                      : Row(
                          children: [
                            Spacer(),
                            Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 35.0,
                            ),
                            Text("Oops!"),
                          ],
                        ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SizedBox(height: height * 0.021),
          // Text(
          //   '4/10',
          //   style: Theme.of(context)
          //       .textTheme
          //       .headline5
          //       .copyWith(color: Colors.white),
          // ),
          SizedBox(height: 30.0),

          Text("${widget.index + 1}. ${widget.questionModel.question}",
              style: Theme.of(context).textTheme.headline4),
          SizedBox(height: 35),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                //correct
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctAnswer) {
                  optionSelected = widget.questionModel.option1;
                  widget.questionModel.answered = true;
                  _correct += 1;
                  _notAttempted -= 1;
                  setState(() {});
                  _showHint(true);
                } else {
                  optionSelected = widget.questionModel.option1;
                  widget.questionModel.answered = true;
                  _incorrect += 1;
                  _notAttempted -= 1;
                  setState(() {});
                  _showHint(false);
                }
              }
            },
            child: OptionWidget(
              correctOption: widget.questionModel.correctAnswer,
              description: widget.questionModel.option1,
              optionSelected: optionSelected,
              option: "A",
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                //correct
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctAnswer) {
                  optionSelected = widget.questionModel.option2;
                  widget.questionModel.answered = true;
                  _correct += 1;
                  _notAttempted -= 1;
                  setState(() {});
                  _showHint(true);
                } else {
                  optionSelected = widget.questionModel.option2;
                  widget.questionModel.answered = true;
                  _incorrect += 1;
                  _notAttempted -= 1;
                  setState(() {});
                  _showHint(false);
                }
              }
            },
            child: OptionWidget(
              correctOption: widget.questionModel.correctAnswer,
              description: widget.questionModel.option2,
              optionSelected: optionSelected,
              option: "B",
            ),
          ),
          SizedBox(height: 20),
          //SizedBox(height: height * 0.07),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                //correct
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctAnswer) {
                  optionSelected = widget.questionModel.option3;
                  widget.questionModel.answered = true;
                  _correct += 1;
                  _notAttempted -= 1;
                  setState(() {});
                  _showHint(true);
                } else {
                  optionSelected = widget.questionModel.option3;
                  widget.questionModel.answered = true;
                  _incorrect += 1;
                  _notAttempted -= 1;
                  setState(() {});
                  _showHint(false);
                }
              }
            },
            child: OptionWidget(
              correctOption: widget.questionModel.correctAnswer,
              description: widget.questionModel.option3,
              optionSelected: optionSelected,
              option: "C",
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                //correct
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctAnswer) {
                  optionSelected = widget.questionModel.option4;
                  widget.questionModel.answered = true;
                  _correct += 1;
                  _notAttempted -= 1;
                  setState(() {});
                  _showHint(true);
                } else {
                  optionSelected = widget.questionModel.option4;
                  widget.questionModel.answered = true;
                  _incorrect += 1;
                  _notAttempted -= 1;
                  setState(() {});
                  _showHint(false);
                }
              }
            },
            child: OptionWidget(
              correctOption: widget.questionModel.correctAnswer,
              description: widget.questionModel.option4,
              optionSelected: optionSelected,
              option: "D",
            ),
          ),
          SizedBox(height: 35)
        ],
      ),
    );
  }
}
