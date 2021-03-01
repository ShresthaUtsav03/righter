import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final int total, correct, incorrect, notattempted;
  Results(
      {@required this.incorrect,
      @required this.total,
      @required this.correct,
      @required this.notattempted});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.correct / widget.total >= 0.8
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                size: 50.0,
                color: Colors.redAccent,
              ), // Text(
              //   "${widget.correct}/ ${widget.total}",
              //   style: TextStyle(fontSize: 25),
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              SizedBox(
                height: 25,
              ),
              Text(
                widget.correct / widget.total >= 0.8
                    ? "Level up!"
                    : "Try again",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 25,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "You got ${((widget.correct / widget.total) * 100).floor()}% answers correct!",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Go to home",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
