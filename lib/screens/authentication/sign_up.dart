import 'package:flutter/material.dart';
import 'package:righter/screens/services/auth.dart';
import 'package:righter/shared/constants.dart';
import 'package:righter/shared/loading.dart';

import '../../widgets/customTextField.dart';

class Signup extends StatefulWidget {
  final Function toggleView;
  Signup({this.toggleView});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return loading
        ? Loading()
        : Scaffold(
            //resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/back3.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: height * .06,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.toggleView();
                              // Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: width * .07,
                                ),
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * .03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: width * .07,
                              ),
                              Text(
                                'Create account',
                                style: TextStyle(
                                  color: Colors.white,
                                  //fontFamily: 'font1',
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .18,
                          ),
                          Customtextfield(
                            hint: 'Enter a nickname',
                            issecured: false,
                            changeFunction: (val) {
                              setState(() => name = val);
                            },
                            validateFunction: (val) =>
                                val.isEmpty ? 'Field cannot be empty' : null,
                          ),
                          Customtextfield(
                              hint: 'Enter your email',
                              issecured: false,
                              changeFunction: (val) {
                                setState(() => email = val);
                              },
                              validateFunction: (val) {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val);
                                if (val.isEmpty) {
                                  return 'Field cannot be empty';
                                } else if (!emailValid) {
                                  return 'Invalid email';
                                } else {
                                  return null;
                                }
                              }),
                          Customtextfield(
                            hint: 'Password',
                            issecured: true,
                            changeFunction: (val) {
                              setState(() => password = val);
                            },
                            validateFunction: (val) {
                              if (val.isEmpty) {
                                return 'This field cannot be empty';
                              } else if (val.length < 6) {
                                return 'Password is too short';
                              } else {
                                return null;
                              }
                            },
                          ),
                          Customtextfield(
                            hint: 'Confirm password',
                            issecured: true,
                            validateFunction: (val) {
                              if (val.isEmpty) {
                                return 'This field cannot be empty';
                              } else if (val != password) {
                                return 'Passwords do not match!';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: height * .03,
                          ),
                          Text(
                            error,
                            style: errorStyle,
                          ),
                          SizedBox(
                            height: height * .03,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ButtonTheme(
                              minWidth: width,
                              height: 55,
                              child: RaisedButton(
                                color: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _authService
                                        .registerWithEmailAndPass(
                                            name, email, password);
                                    // print(result);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error = 'Email already in use!';
                                      });
                                    }
                                  }
                                },
                                child: Text(
                                  'Create Now',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * .03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
