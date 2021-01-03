import 'package:flutter/material.dart';
import 'package:righter/widgets/optionBox.dart';

class Quiz extends StatefulWidget {
  final String question =
      'Mom told me to divide the ice cream _____ my five friends.';
  final List<String> options = ['among', 'with', 'between', 'over'];
  final String qType = 'mcq';

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.021),
            Text(
              '4/10',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
            SizedBox(height: height * 0.20),
            Center(
              child: Column(children: [
                Text(widget.question,
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(height: height * 0.08),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OptionWidget(
                          optionInstance: widget.options[0],
                        ),
                        OptionWidget(
                          optionInstance: widget.options[1],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OptionWidget(
                          optionInstance: widget.options[2],
                        ),
                        OptionWidget(
                          optionInstance: widget.options[3],
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}
