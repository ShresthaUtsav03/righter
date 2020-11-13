import 'package:flutter/material.dart';
import 'package:righter/widgets/menu_icon.dart';

class GrammarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 500,
    //   child: ListView.builder(
    //     itemBuilder: (context, index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MenuItem(
                  bgColor: Colors.deepOrangeAccent,
                  imageLocation: 'assets/images/the.png',
                  level: 1,
                  menuLabel: 'Articles',
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MenuItem(
                  bgColor: Colors.greenAccent,
                  imageLocation: 'assets/images/prepositions.png',
                  level: 2,
                  menuLabel: 'Prepositions',
                ),
                MenuItem(
                  bgColor: Colors.blueAccent,
                  imageLocation: 'assets/images/punctuations.png',
                  level: 3,
                  menuLabel: 'Punctuations',
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MenuItem(
                  bgColor: Colors.deepOrangeAccent,
                  imageLocation: 'assets/images/random.png',
                  level: 1,
                  menuLabel: '',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuItem(
                  bgColor: Colors.greenAccent,
                  imageLocation: 'assets/images/random.png',
                  level: 2,
                  menuLabel: '',
                ),
                MenuItem(
                  bgColor: Colors.blueAccent,
                  imageLocation: 'assets/images/random.png',
                  level: 3,
                  menuLabel: '',
                ),
              ],
            )
          ],
        ),
      ),
      //       );
      // },
      // itemCount: 5,
      //),
    );
  }
}
