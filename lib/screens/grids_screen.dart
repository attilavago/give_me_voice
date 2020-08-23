import 'package:flutter/material.dart';
import 'package:give_me_voice/models/grid_list.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:give_me_voice/screens/grid_screen.dart';

class GridsScreen extends StatelessWidget {
  const GridsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(GridList item) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You are about to delete the "${item.gridName}" grid!'),
                  Text('Is this really what you want?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('No, leave it.'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Yes, delete.'),
                onPressed: () {
                  Provider.of<GridItemData>(context).removeGridList(item);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Consumer<GridItemData>(builder: (context, gridData, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(Provider.of<GridItemData>(context).gridLists.length == 0
              ? 'You currently have no grids. How about adding one?'
              : 'Your grids'),
          Expanded(
            child: ListView.builder(
                itemCount: gridData.gridLists.length,
                itemBuilder: (context, index) {
                  final grid = gridData.gridLists[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(grid.gridName),
                            ],
                          ),
                          Row(
                            children: [
                              for (var item in grid.items)
                                Image.asset(
                                  'images/${item.image}.png',
                                  height: 30.0,
                                )
                            ],
                          ),
                          Row(
                            children: [
                              OutlineButton.icon(
                                onPressed: () {
                                  _showMyDialog(grid);
                                },
                                icon: Icon(Icons.delete),
                                label: Text('Delete'),
                              ),
                              OutlineButton.icon(
                                onPressed: () {
                                  Provider.of<GridItemData>(context)
                                      .setActiveCardIndex(index);
                                  Navigator.pushNamed(context, GridScreen.id);
                                },
                                icon: Icon(Icons.remove_red_eye),
                                label: Text('Open'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      );
    });
  }
}
