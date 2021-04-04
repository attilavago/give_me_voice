import 'package:flutter/material.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';
import 'package:give_me_voice/utils/db_connector.dart';

class AddGrid extends StatefulWidget {
  @override
  _AddGridState createState() => _AddGridState();
}

class _AddGridState extends State<AddGrid> {
  MyGridsDataBaseConnector _myGridsDataBaseConnector =
      MyGridsDataBaseConnector();
  String searchValue;
  String gridTitle;

  final emojiInput = TextEditingController();
  final nameInput = TextEditingController();
  List labels = [];
  List images = [];

  @override
  Widget build(BuildContext context) {
    _myGridsDataBaseConnector.initializeDatabase().then((value) {
      print('----database initialized-----');
    });
    return Consumer<GridItemData>(builder: (context, gridData, child) {
      return Column(
        children: <Widget>[
          Container(
            height: 10.0,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('Search for available choices and feelings.'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    controller: emojiInput,
                    onChanged: (value) {
                      searchValue = value;
                      print(searchValue);
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          onPressed: () {
                            gridData.addGridItem(searchValue, searchValue);
                            labels.add(searchValue);
                            images.add(searchValue);
                            setState(() {
                              emojiInput.clear();
                            });
                          }),
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                    ),
                  ),
                ),
                if (gridData.gridItems.length == 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You have not added any "feelings" or "choices" yet. Try searching for some.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: GridView.builder(
                itemCount: gridData.gridItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6),
                itemBuilder: (context, index) {
                  final item = gridData.gridItems[index];
                  return RoundButton(
                    imageName: item.image,
                    size: 35.0,
                    padding: 5.0,
                    buttonAction: () {},
                    buttonLongAction: () {
                      gridData.removeGridItem(item);
                    },
                  );
                }),
          )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    controller: nameInput,
                    onChanged: (value) {
                      gridTitle = value;
                    },
                    decoration: InputDecoration(
                      isDense: true, // Added this
                      contentPadding:
                          EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.save),
                          iconSize: 30.0,
                          onPressed: () {
                            gridData.addGridList(gridTitle);
                            _myGridsDataBaseConnector.insertGridItem(
                                nameInput.text,
                                labels.join(','),
                                images.join(','));
                            _myGridsDataBaseConnector.getGrids();
                            setState(() {
                              nameInput.clear();
                            });
                            Navigator.pop(context);
                          }),
                      border: OutlineInputBorder(),
                      labelText: 'Name your grid',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
