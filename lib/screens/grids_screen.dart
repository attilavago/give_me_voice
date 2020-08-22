import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:give_me_voice/screens/grid_screen.dart';

class GridsScreen extends StatelessWidget {
  const GridsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                  Provider.of<GridItemData>(context)
                                      .removeGridList(grid);
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
