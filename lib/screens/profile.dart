import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String imageLocation = 'assets/images/default.jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: ExactAssetImage(imageLocation),
              radius: 50.0,
              child: InkWell(
                borderRadius: BorderRadius.circular(50.0),
                onTap: () {
                  print('Delete or change dp ');
                },
                //child: ,
                //behavior: HitTestBehavior.opaque,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Bruce-Lee',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 30.0),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '8',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 30.0),
            Text(
              'LEAGUE',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Gold',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 30.0),
            Text(
              'BEST STREAK',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '30 days',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'brucelee@1inch.punch',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
