import 'package:flutter/material.dart';
import '../../widgets/menu_icon.dart';

class TenseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            elevation: 5.0,
            // child: Column(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     SizedBox(height: 20.0),
            //     Text(
            //       'Tip of the day',
            //       style: Theme.of(context).textTheme.headline3,
            //     ),
            //     SizedBox(height: 10.0),
            //     Text(
            //       'Everyday vs Every day',
            //       style: Theme.of(context).textTheme.headline4,
            //     ),
            //     SizedBox(height: 10.0),
            //     Text(
            //       'Yes there is a difference!',
            //       style: Theme.of(context).textTheme.subtitle1,
            //     ),
            //     SizedBox(height: 20.0),
            //   ],
            // ),
            child: SizedBox(
              child: Text(
                'chart',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              height: 200.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MenuItem(
                bgColor: Colors.deepOrangeAccent,
                imageLocation: 'assets/images/present.png',
                level: 1,
                menuLabel: 'Present tense',
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItem(
                bgColor: Colors.greenAccent,
                imageLocation: 'assets/images/past.png',
                level: 2,
                menuLabel: 'Past tense',
              ),
              MenuItem(
                bgColor: Colors.blueAccent,
                imageLocation: 'assets/images/future.png',
                level: 3,
                menuLabel: 'Future tense',
              ),
            ],
          )
        ],
      ),
    );
  }
}
