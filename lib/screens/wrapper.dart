import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:righter/screens/home/home.dart';
import 'package:righter/models/user.dart';
import './authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    print(user);
    //return home or startup
    if (user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}
