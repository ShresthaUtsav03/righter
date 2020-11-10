import 'package:flutter/material.dart';

class GrammarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 500,
    //   child: ListView.builder(
    //     itemBuilder: (context, index) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Card(
            child: Row(
              children: <Widget>[
                Text('Row 1'),
              ],
            ),
          ),
          Card(
            child: Row(
              children: <Widget>[
                Text('Row 2'),
              ],
            ),
          ),
          Card(
            child: Row(
              children: <Widget>[
                Text('Row 3'),
              ],
            ),
          ),
        ],
      ),
      //       );
      // },
      // itemCount: 5,
      //),
    );
  }
}
