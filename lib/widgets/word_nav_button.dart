import 'package:flutter/material.dart';
import 'package:righter/services/database/database.dart';

class WordNavButtons extends StatelessWidget {
  const WordNavButtons({
    Key key,
    @required this.uid,
  }) : super(key: key);

  final String uid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RaisedButton(
          onPressed: () async {
            await DatabaseService(uid: uid).downWord();
            Navigator.pop(context);
          },
          child: Text(
            'Previous word',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: Theme.of(context).accentColor,
        ),
        // SizedBox(width: 10.0),
        RaisedButton(
          onPressed: () async {
            await DatabaseService(uid: uid).upWord();

            Navigator.pop(context);
          },
          child: Text(
            'Next word',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
