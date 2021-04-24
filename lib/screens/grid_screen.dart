import 'package:flutter/material.dart';
import 'package:give_me_voice/utils/extensions.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';
import 'package:give_me_voice/utils/db_connector.dart';

class GridScreen extends StatefulWidget {
  static String id = 'grid_screen';

  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  final MyGridsDataBaseConnector _myGridsDataBaseConnector =
      MyGridsDataBaseConnector();

  bool isDisabled = true;

  @override
  Widget build(BuildContext context) {
    _myGridsDataBaseConnector.initializeDatabase().then((value) {
      print('----database initialized from grid view-----');
    });
    return Consumer<GridItemData>(builder: (context, gridData, child) {
      return FutureBuilder<List>(
        future: _myGridsDataBaseConnector
            .getIndividualGrid(gridData.activeCardIndex),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            var grid = snapshot.data[0];
            var gridLabels = grid['labels'].toString().split(',');
            var gridLength = gridLabels.length;
            return Scaffold(
              appBar: AppBar(
                title: Text(grid['name'].toString().capitalize()),
                automaticallyImplyLeading: isDisabled,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.wheelchair_pickup_rounded),
                    onPressed: () {
                      setState(() {
                        isDisabled = false;
                      });
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                          itemCount: gridLength,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisSpacing: 30.0),
                          itemBuilder: (context, index) {
                            final item = gridLabels[index];
                            return Column(
                              children: [
                                RoundButton(
                                  imageName: item,
                                  size: 70.0,
                                  padding: 15.0,
                                  buttonAction: () async {
                                    await gridData.playGridItem(item);
                                  },
                                  buttonLongAction: () {},
                                ),
                                RoundButtonLabel(
                                  label: item.capitalize(),
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
    });
  }
}
