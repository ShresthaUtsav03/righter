import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:righter/services/authentication/auth.dart';
import 'package:righter/services/database/database.dart';

import 'dart:io';

class Profile extends StatefulWidget {
  final String username;
  final String uid;
  final int streak;
  final int level;

  Profile({this.level, this.streak, this.username, this.uid});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String imageLocation = 'assets/images/default.jpg';
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _currentName;
  String _userEmail;
  File image;

  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (user != null) {
      _userEmail = user.email;
    }
    void _showEditingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text('Edit username',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(fillColor: Colors.grey),
                        initialValue: widget.username,
                        validator: (value) =>
                            value.isEmpty ? 'Username cannot be empty' : null,
                        onChanged: (value) =>
                            setState(() => _currentName = value),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        child: Text('Update',
                            style: Theme.of(context).textTheme.subtitle1),
                        color: Theme.of(context).accentColor,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: widget.uid)
                                .updateUsername(
                                    _currentName ?? widget.username);
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ),
                ));
          });
    }

    String _getLeague(level) {
      if (level <= 10) {
        return 'Silver';
      } else if (level <= 20) {
        return 'Gold';
      } else if (level <= 30) {
        return 'Platinum';
      } else if (level <= 40) {
        return 'Diamond';
      } else {
        return 'God';
      }
    }

    return SingleChildScrollView(
      child: Container(
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
              Row(
                children: [
                  Text(
                    'NAME',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  FlatButton.icon(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    label: Text(''),
                    onPressed: () => _showEditingPanel(),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                widget.username,
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
                widget.level.toString(),
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
                _getLeague(widget.level),
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
                widget.streak.toString() + ' days',
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
                    _userEmail,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ButtonTheme(
                  minWidth: width,
                  height: 55,
                  child: OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
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
                        Text('Sign out',
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
