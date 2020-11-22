import 'package:flutter/material.dart';

import '../widgets/customTextField.dart';

class Signup extends StatelessWidget {
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
                  image: AssetImage('assets/images/back3.png'),
                  fit: BoxFit.fill),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * .06,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
                    hint: 'Enter your name',
                    issecured: false,
                  ),
                  Customtextfield(
                    hint: 'Enter your email',
                    issecured: false,
                  ),
                  Customtextfield(
                    hint: 'Enter your password',
                    issecured: true,
                  ),
                  Customtextfield(
                    hint: 'Confirm password',
                    issecured: true,
                  ),
                  SizedBox(
                    height: height * .1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ButtonTheme(
                      minWidth: width,
                      height: 55,
                      child: RaisedButton(
                        color: Color(0xFFFE7550),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Create Now',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
