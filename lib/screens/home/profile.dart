import 'package:flutter/material.dart';
import 'package:righter/screens/services/auth.dart';
import 'package:righter/shared/loading.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String imageLocation = 'assets/images/default.jpg';
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ButtonTheme(
                minWidth: width,
                height: 55,
                child: RaisedButton(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () async {
                    await _authService.signOut();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        'Sign out',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
