import 'package:flutter/material.dart';
import 'package:righter/widgets/optionBox.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String question = 'I go to school ____________';
  List<String> options = ['Everyday', 'every day', 'someday', 'some day'];

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select the correct answer'),
        actions: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('4/10'),
              LinearProgressIndicator(
                backgroundColor: Colors.grey,
                minHeight: 20.0,
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.021),
          Text('4/10'),
          SizedBox(height: height * 0.20),
          Center(
            child: Column(children: [
              Text(
                question,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: height * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionWidget(
                    optionInstance: options[0],
                  ),
                  OptionWidget(
                    optionInstance: options[1],
                  ),
                ],
              ),
              SizedBox(height: height * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionWidget(
                    optionInstance: options[2],
                  ),
                  OptionWidget(
                    optionInstance: options[3],
                  ),
                ],
              ),
            ]),
          )
        ],
      )),
    );
  }
}
