import 'package:flutter/material.dart';
import 'package:give_me_voice/constants/colors.dart';
import 'package:give_me_voice/screens/choices_screen.dart';
import 'package:give_me_voice/screens/feelings_screen.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:give_me_voice/constants/emojis.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';
import 'package:give_me_voice/components/add_grid.dart';

class TabsScreen extends StatefulWidget {
  static String id = 'tabs_screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //var searchValue;
  //GridItemData gridItems = GridItemData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade700,
            actions: <Widget>[
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){},
            ),
          ],
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Choices',
                ),
                Tab(text: 'Feelings'),
              ],
            ),
            title: Text('Give Me Voice'),
          ),
          backgroundColor: Color(kAppBackground),
          body: TabBarView(
            children: [
              ChoicesScreen(),
              FeelingsScreen(),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              icon: Icon(Icons.add),
              label: Text('New grid'),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                        padding: EdgeInsets.all(20.0),
                        child: AddGrid(),
                      ),
                );
              }
              ),
        ),
      ),
    );
  }
}



