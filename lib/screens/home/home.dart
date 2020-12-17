import 'package:flutter/material.dart';
import 'package:righter/models/user.dart';
import 'package:provider/provider.dart';
import 'package:righter/services/database/database.dart';
import 'package:righter/shared/loading.dart';

import './tense_section.dart';
import './grammar_section.dart';
import 'profile.dart';
import './vocabulary_section.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print('homepage here');
    final user = Provider.of<CustomUser>(context);

    return DefaultTabController(
      length: 3,
      // child: StreamProvider<DocumentSnapshot>.value(
      //value: DatabaseService().levels,
      child: StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData userData = snapshot.data;

              return Scaffold(
                //backgroundColor: Colors.grey[800],
                // appBar: AppBar(
                //   // centerTitle: true,
                //   // elevation: 0,
                //   backgroundColor: Colors.grey[900],
                //   title: Text('Righter'),
                // ),
                body: SafeArea(
                  minimum: const EdgeInsets.all(10.0),
                  child: TabBarView(
                    children: <Widget>[
                      VocabularySection(
                        uid: userData.uid,
                        wordDay: userData.wordDay,
                        fitBlanksLevel: userData.fitBlanks,
                        mChoiceLevel: userData.mChoice,
                        wMeaningsLevel: userData.wMeanings,
                      ),
                      ListView(
                        children: [
                          GrammarSection(
                            uid: userData.uid,
                            bonusId: userData.bonusDay,
                            articlesLevel: userData.articles,
                            prepositionsLevel: userData.prepositions,
                            punctuationsLevel: userData.punctuations,
                            futureLevel: userData.future,
                            pastLevel: userData.past,
                            presentLevel: userData.present,
                          ),
                        ],
                      ),
                      // TenseSection(
                      //   futureLevel: userData.future,
                      //   pastLevel: userData.past,
                      //   presentLevel: userData.present,
                      // ),
                      Profile(
                        streak: userData.streakDay,
                        username: userData.name,
                        uid: userData.uid,
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.font_download,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.category),
                    ),
                    // Tab(
                    //   icon: Icon(Icons.group_work),
                    // ),
                    Tab(
                      icon: Icon(Icons.perm_identity),
                    )
                  ],
                  labelColor: Theme.of(context).accentColor,
                  unselectedLabelColor: Colors.indigoAccent[100],
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.all(5.0),
                  indicatorColor: Theme.of(context).accentColor,
                ),
              );
            } else {
              return Loading();
            }
          }),
      //),
    );
  }
}
