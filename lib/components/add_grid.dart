import 'package:flutter/material.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';
import 'package:give_me_voice/utils/db_connector.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
  String inlineError = '';

  static FlutterTts flutterTts = FlutterTts();
  Future playGridItem(String itemLabel) async {
    var result = await flutterTts.speak(itemLabel);
    if (result == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    _myGridsDataBaseConnector.initializeDatabase().then((value) {});
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text('Add up to 6 emojis to your grid'),
              ),
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: GridView.builder(
                itemCount: gridData.feelings.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6),
                itemBuilder: (context, index) {
                  final item = gridData.feelings[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RoundButton(
                      imageName: item,
                      size: 35.0,
                      padding: 5.0,
                      buttonAction: () {
                        playGridItem(item);
                      },
                      buttonLongAction: () {
                        gridData.addGridItem(item, item);
                        labels.add(item);
                        images.add(item);
                      },
                    ),
                  );
                }),
          )),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: inlineError == ''
                  ? Text('Your Grid')
                  : Text(
                      inlineError,
                      style: TextStyle(color: Colors.red),
                    ),
            ),
          ),
          Container(
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: GridView.builder(
                    itemCount: gridData.gridItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6),
                    itemBuilder: (context, index) {
                      final item = gridData.gridItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: RoundButton(
                          imageName: item.image,
                          size: 35.0,
                          padding: 5.0,
                          buttonAction: () {},
                          buttonLongAction: () {
                            gridData.removeGridItem(item);
                          },
                        ),
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
                      setState(() {
                        inlineError = '';
                      });
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
                            if (nameInput.text.length == 0) {
                              setState(() {
                                inlineError =
                                    'You must name your grid before saving!';
                              });
                            } else {
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
                            }
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
