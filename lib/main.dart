import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:righter/views/quiz/add_question.dart';
import 'package:righter/views/quiz/add_quiz.dart';

import './models/user.dart';
import 'services/authentication/auth.dart';
import './views/authentication/login.dart';
import 'views/authentication/sign_up.dart';
import 'navigators/wrapper.dart';
import './views/home/home.dart';
import 'views/word_meaning.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      child: MaterialApp(
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
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
                subtitle1: TextStyle(
                  //fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontSize: 18,
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

          scaffoldBackgroundColor: Colors.grey[850],
        ),
        initialRoute: '/wrapper',
        routes: {
          '/wrapper': (context) => Wrapper(),
          '/home': (context) => MyHomePage(),
          '/word': (context) => WordMeaning(),
          //'/typing': (context) => TypingWidget(),
          '/signup': (context) => Signup(),
          // '/startup': (context) => Startup(),
          '/login': (context) => Login(),
          '/addQuestion': (context) => AddQuestion(),
          '/addQuiz': (context) => AddQuiz(),
          //'/addWord': (context) => AddWords(),
        },
      ),
    );
  }
}
