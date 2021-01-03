import 'package:flutter/material.dart';

class TypingWidget extends StatelessWidget {
  final answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40.0),
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
            TextField(
              controller: answerController,
              decoration: InputDecoration(labelText: 'Your answer'),
              keyboardType: TextInputType.text,
            ),
            IconButton(
              icon: Image.asset('assets/images/random.png'),
              color: Colors.red[300],
              onPressed: () {
                print(answerController.text);
              },
            ),
            FlatButton(
                child: Text(
                  'Add Transaction',
                ),
                onPressed: () {
                  print(answerController.text);
                }),
          ],
        ),
      ),
    );
  }
}
