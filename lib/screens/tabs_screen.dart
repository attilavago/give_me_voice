import 'package:flutter/material.dart';
import 'package:give_me_voice/constants/colors.dart';
import 'package:give_me_voice/screens/choices_screen.dart';
import 'package:give_me_voice/screens/feelings_screen.dart';
import 'package:give_me_voice/screens/grids_screen.dart';
import 'package:give_me_voice/components/add_grid.dart';

class TabsScreen extends StatefulWidget {
  static String id = 'tabs_screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Choices',
              ),
              Tab(text: 'Feelings'),
              Tab(text: 'My Grids'),
            ],
          ),
          title: Text('Give Me Voice'),
        ),
        body: TabBarView(
          children: [
            ChoicesScreen(),
            FeelingsScreen(),
            GridsScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            elevation: 1.0,
            icon: Icon(Icons.add),
            label: Text('NEW GRID'),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                ),
                context: context,
                builder: (context) => Container(
                  height: 500,
//                  padding: EdgeInsets.all(20.0),
                  child: AddGrid(),
                ),
              );
            }),
      ),
    );
  }
}
