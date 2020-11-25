import 'package:flutter/material.dart';
import './tense_section.dart';

import './grammar_section.dart';

import '../profile.dart';

import './vocabulary_section.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
              VocabularySection(),
              GrammarSection(),
              TenseSection(),
              Profile(),
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
            Tab(
              icon: Icon(Icons.group_work),
            ),
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
      ),
    );
  }
}
