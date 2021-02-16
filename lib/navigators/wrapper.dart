import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:righter/views/home/home.dart';
import 'package:righter/models/user.dart';
import 'authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    //print('inside wrapper');
    //print(user);
    //return home or startup
    if (user == null) {
      //print('calling authenticate');
      return Authenticate();
    } else {
      //print('calling hoomepage');
      return MyHomePage();
    }
  }
}
