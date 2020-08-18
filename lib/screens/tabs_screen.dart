import 'package:flutter/material.dart';
import 'package:give_me_voice/constants/colors.dart';
import 'package:give_me_voice/screens/choices_screen.dart';
import 'package:give_me_voice/screens/feelings_screen.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';

class TabsScreen extends StatelessWidget {
  static String id = 'tabs_screen';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => GridItemData(),
      child: MaterialApp(
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
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text('Search for available choices and feelings.'),
                              TextField(
                                decoration: InputDecoration(
                                  suffixIcon: MaterialButton(
                                    child: Icon(Icons.search),
                                      onPressed: (){}
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'Search',
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  );
                }
                ),
          ),
        ),
      ),
    );
  }
}



