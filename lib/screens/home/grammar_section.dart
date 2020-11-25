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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Tip of the day',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Everyday vs Every day',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Yes there is a difference!',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
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
        ],
      ),

      //       );
      // },
      // itemCount: 5,
      //),
    );
  }
}