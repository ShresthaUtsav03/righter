import 'package:flutter/material.dart';
import 'package:righter/screens/homie.dart';
import 'package:righter/screens/login.dart';
import 'package:righter/screens/sign_up.dart';

import './screens/tense_section.dart';
import './screens/profile.dart';
import './widgets/typing_answer.dart';
import './screens/grammar_section.dart';
import './screens/home.dart';
import './screens/word_meaning.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Righter',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.deepOrangeAccent,
        primaryColor: Colors.amberAccent[200],

        //fontFamily:

        textTheme: ThemeData.light().textTheme.copyWith(
              headline4: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 1.5,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
              headline3: TextStyle(
                color: Colors.white,
                fontSize: 34.0,
              ),
              subtitle1: TextStyle(
                //fontFamily: 'OpenSans',
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              bodyText2: TextStyle(
                color: Colors.grey[400],
                fontSize: 18.0,
              ),
              bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                decoration: TextDecoration.underline,
              ),
            ),

        appBarTheme: AppBarTheme(
          color: Colors.grey[500],
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        ),
        cardTheme: CardTheme(
          color: Colors.grey[700],
        ),

        scaffoldBackgroundColor: Colors.grey[800],
      ),
      initialRoute: '/homie',
      routes: {
        '/home': (context) => MyHomePage(),
        '/word': (context) => WordMeaning(),
        '/grammar': (context) => GrammarSection(),
        '/typing': (context) => TypingWidget(),
        '/profile': (context) => Profile(),
        '/verbs': (context) => TenseSection(),
        '/signup': (context) => Signup(),
        '/homie': (context) => Homie(),
        '/login': (context) => Loginscreen(),

        //'/quiz': (context) => Ques
      },
    );
  }
}
