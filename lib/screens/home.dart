import 'package:flutter/material.dart';

import '../screens/grammar_section.dart';

import '../screens/profile.dart';

import '../widgets/vocabulary_menu.dart';

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
              VocabularyMenu(),
              GrammarSection(),
              Profile(),
              Container(
                color: Colors.red,
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
            Tab(
              icon: Icon(Icons.perm_identity),
            ),
            Tab(
              icon: Icon(Icons.settings),
            )
          ],
          labelColor: Colors.amber[900],
          unselectedLabelColor: Colors.indigoAccent[100],
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.amber[900],
        ),
      ),
    );
  }
}
