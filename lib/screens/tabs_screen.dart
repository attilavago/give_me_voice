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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFFF4F9FC),
            //automaticallyImplyLeading: false,
            bottom: TabBar(
              unselectedLabelColor: Color(0xFF2BAE66),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF2BAE66)),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xFF2BAE66), width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Choices"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xFF2BAE66), width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Feelings"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xFF2BAE66), width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("My Grids"),
                    ),
                  ),
                ),
              ],
            ),
            //title: Text('Give Me Voice'),
          ),
        ),
        body: TabBarView(
          children: [
            ChoicesScreen(),
            FeelingsScreen(),
            GridsScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 1.0,
            child: Icon(Icons.add),
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
