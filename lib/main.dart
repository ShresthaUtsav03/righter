import 'package:flutter/material.dart';
import './screens/profile.dart';
import './widgets/typing_answer.dart';

import './screens/grammar_section.dart';
import './screens/quiz.dart';
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

        //fontFamily:

        textTheme: ThemeData.light().textTheme.copyWith(
              headline4: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 1.5,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
              subtitle1: TextStyle(
                //fontFamily: 'OpenSans',
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
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
        //   textTheme: Theme.of(context).textTheme.apply(
        //       fontFamily: 'Open Sans',
        //       bodyColor: Colors.white,
        //       displayColor: Colors.white),
        // ),
        // theme: ThemeData(
        //   textTheme: TextTheme(
        //     bodyText1: TextStyle(),
        //     bodyText2: TextStyle(),
        //   ).apply(
        //     bodyColor: Colors.white,
        //     displayColor: Colors.blue,
        //   ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(),
        '/word': (context) => WordMeaning(),
        '/grammar': (context) => GrammarSection(),
        '/typing': (context) => TypingWidget(),
        '/profile': (context) => Profile(),

        //'/quiz': (context) => Ques
      },
    );
  }
}
