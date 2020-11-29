import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/user.dart';
import './screens/services/auth.dart';
import './screens/startup.dart';
import './screens/authentication/login.dart';
import 'screens/authentication/sign_up.dart';
import './screens/wrapper.dart';
import './screens/home/tense_section.dart';
import 'screens/home/profile.dart';
import './widgets/typing_answer.dart';
import './screens/home/grammar_section.dart';
import './screens/home/home.dart';
import 'widgets/word_meaning.dart';

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

          scaffoldBackgroundColor: Colors.grey[850],
        ),
        initialRoute: '/wrapper',
        routes: {
          '/wrapper': (context) => Wrapper(),
          '/home': (context) => MyHomePage(),
          '/word': (context) => WordMeaning(),
          '/grammar': (context) => GrammarSection(),
          '/typing': (context) => TypingWidget(),
          '/profile': (context) => Profile(),
          '/verbs': (context) => TenseSection(),
          '/signup': (context) => Signup(),
          '/startup': (context) => Startup(),
          '/login': (context) => Login(),

          //'/quiz': (context) => Ques
        },
      ),
    );
  }
}
