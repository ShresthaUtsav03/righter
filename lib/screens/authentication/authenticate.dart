import 'package:flutter/material.dart';
import 'package:righter/screens/authentication/login.dart';
import 'package:righter/screens/authentication/sign_up.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    print('inside authenticate');
    if (showSignIn) {
      return Login(toggleView: toggleView);
    } else {
      return Signup(toggleView: toggleView);
    }

    // return Container(
    //   child: Startup(),
    // );
  }
}
