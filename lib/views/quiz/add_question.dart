import 'package:flutter/material.dart';
import 'package:righter/services/database/quiz_DB.dart';

class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  QuizDatabaseService databaseService = new QuizDatabaseService();

  Map receivedPara = {};
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String level = '1';
  String question, option1, option2, option3, option4;

  uploadQuizData(String quizId) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      print(quizId);
      await databaseService
          .addQuestionData(questionMap, quizId, level)
          .then((value) {
        question = "";
        option1 = "";
        option2 = "";
        option3 = "";
        option4 = "";
        setState(() {
          isLoading = false;
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("error is happening ");
    }
  }

  @override
  Widget build(BuildContext context) {
    receivedPara = ModalRoute.of(context).settings.arguments;
    //print(receivedPara);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          receivedPara['quizId'],
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black97),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      validator: (val) =>
                          val.isEmpty ? "Enter the level" : null,
                      decoration: InputDecoration(hintText: "Level"),
                      onChanged: (val) => level = val,
                    ),
                    SizedBox(height: 6),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      validator: (val) =>
                          val.isEmpty ? "Enter the questions" : null,
                      decoration: InputDecoration(hintText: "Question"),
                      onChanged: (val) => question = val,
                    ),
                    SizedBox(height: 6),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      validator: (val) =>
                          val.isEmpty ? "Enter Option 1 " : null,
                      decoration:
                          InputDecoration(hintText: "Option1 (Correct Answer)"),
                      onChanged: (val) => option1 = val,
                    ),
                    SizedBox(height: 6),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      validator: (val) => val.isEmpty ? "Enter Option 2" : null,
                      decoration: InputDecoration(hintText: "Option2"),
                      onChanged: (val) => option2 = val,
                    ),
                    SizedBox(height: 6),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      //validator: (val) => val.isEmpty ? "Enter option3" : null,
                      decoration: InputDecoration(hintText: "Option3"),
                      onChanged: (val) => option3 = val,
                    ),
                    SizedBox(height: 6),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      //validator: (val) => val.isEmpty ? "Enter option4" : null,
                      decoration: InputDecoration(hintText: "Option4"),
                      onChanged: (val) => option4 = val,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            print(receivedPara['quizId']);
                            uploadQuizData(receivedPara['quizId'].toString());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Add Question",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
