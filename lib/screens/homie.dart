import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';

class Homie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back1.png'),
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: height * .15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 35,
                  ),
                  Text(
                    'Right~er',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      //fontFamily: 'font1',
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 35,
                  ),
                  Text(
                    'The right way to write',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 35,
                  ),
                  AnimatedButton(
                      enabled: true,
                      height: 50,
                      width: 130,
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                        // Navigator.push(context,
                        //      MaterialPageRoute(
                        //     builder: (context) => Loginscreen())
                        //     );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ))
                ],
              ),
              SizedBox(
                height: height * .6,
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
                      //Navigator.push(context,
                      //MaterialPageRoute(builder: (ctx) => Signupscreen()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
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
    );
  }
}
