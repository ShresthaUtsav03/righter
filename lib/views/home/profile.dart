import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:righter/services/authentication/auth.dart';
import 'package:righter/services/database/user_DB.dart';
import 'package:flutter_avatars_bottts/flutter_avatars_bottts.dart';

import 'dart:io';

class Profile extends StatefulWidget {
  final String username;
  final String uid;
  final int wMeanings;
  final int mChoice;
  final int confusing;
  final int articles;
  final int prepositions;
  final int conjunctions;
  final int present;
  final int past;
  final int future;

  var _bottt = Bottt.random();

  Profile(
      {this.username,
      this.uid,
      this.wMeanings,
      this.mChoice,
      this.confusing,
      this.articles,
      this.prepositions,
      this.conjunctions,
      this.present,
      this.past,
      this.future});
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (user != null) {
      _userEmail = user.email;
    }
    void _showEditingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.03, horizontal: width * 0.03),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text('Edit username',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        height: height * 0.02,
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
                        height: height * 0.02,
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

    int _getLevel() {
      return (widget.articles +
          widget.confusing +
          widget.future +
          widget.mChoice +
          widget.past +
          widget.prepositions +
          widget.present +
          widget.conjunctions +
          widget.wMeanings -
          8);
    }

    String _getLeague() {
      int level = _getLevel();
      if (level <= 10) {
        return 'Bronze';
      } else if (level <= 20) {
        return 'Silver';
      } else if (level <= 30) {
        return 'Gold';
      } else if (level <= 40) {
        return 'Platinium';
      } else if (level <= 50) {
        return 'Pro';
      } else if (level <= 60) {
        return 'Master';
      } else if (level <= 70) {
        return 'Diamond';
      } else {
        return 'God';
      }
    }

    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 42.5,
              child: CircleAvatar(
                // backgroundImage: ExactAssetImage(imageLocation),
                backgroundColor: Colors.white.withOpacity(0.3),
                radius: 40.0,
                child: Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: BotttAvatar(widget._bottt)),
              ),
            ),
            SizedBox(height: height * 0.01),
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
            Text(
              widget.username,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: height * 0.04),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              _getLevel().toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: height * 0.04),
            Text(
              'LEAGUE',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              _getLeague(),
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: height * 0.04),
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
    );
  }
}
