import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import '../../services/authentication/auth.dart';
import 'package:righter/shared/constants.dart';
import 'package:righter/shared/loading.dart';

import '../../widgets/customTextField.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
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
                          image: AssetImage('assets/images/back2.png'))),
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: height * .25,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Text(
                                      'Hello there!',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(.7),
                                        fontSize: 50,
                                        //fontFamily: 'font1',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Container(
                                      height: 8,
                                      width: width * .5,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          //color: Color(0xFFFE7550),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )
                                  ],
                                ),
                                SizedBox(height: height * 0.02),
                              ],
                            ),
                            Customtextfield(
                              hint: 'Enter your email',
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
                              },
                              issecured: false,
                              changeFunction: (val) {
                                setState(() => email = val.trim());
                              },
                            ),
                            Customtextfield(
                              hint: 'Enter your password',
                              issecured: true,
                              validateFunction: (val) {
                                if (val.isEmpty) {
                                  return 'This field cannot be empty';
                                } else if (val.length < 6) {
                                  return 'Password is too short';
                                } else {
                                  return null;
                                }
                              },
                              changeFunction: (val) {
                                setState(() => password = val.trim());
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              error,
                              style: errorStyle,
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                AnimatedButton(
                                  enabled: true,
                                  height: 50,
                                  width: 130,
                                  color: Theme.of(context).accentColor,
                                  //color: Color(0xFFFE7550),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      dynamic result = await _authService
                                          .signInWithEmail(email, password);
                                      //print(result);
                                      if (result == null) {
                                        setState(() {
                                          loading = false;
                                          error = 'Incorrect credentials';
                                        });
                                      }
                                    }
                                  },

                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't Have an account?",
                                  style: TextStyle(
                                      color: Colors.grey[350],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.toggleView();
                                    // Navigator.pushReplacementNamed(
                                    //     context, '/signup');
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (ctx) => Signupscreen()));
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        //color: Color(0xFFFE7550),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: height * 0.03),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
