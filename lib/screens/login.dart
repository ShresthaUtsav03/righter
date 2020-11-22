import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

import '../widgets/customTextField.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back2.png'))),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: height * .31,
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
                                  borderRadius: BorderRadius.circular(5)),
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                    Customtextfield(
                      hint: 'Enter your email',
                      issecured: false,
                    ),
                    Customtextfield(
                      hint: 'Enter your password',
                      issecured: true,
                    ),
                    SizedBox(
                      height: 25,
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
                            onPressed: () {},
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: height * .15,
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
                            Navigator.pushNamed(context, '/signup');
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
                    )
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
