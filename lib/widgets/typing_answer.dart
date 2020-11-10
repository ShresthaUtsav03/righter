import 'package:flutter/material.dart';

class TypingWidget extends StatelessWidget {
  final answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40.0),
        child: Column(
          children: [
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
