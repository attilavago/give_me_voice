import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';

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
          Text(gridData.gridItems.length == 0
              ? 'You currently have no grids. How about adding one?'
              : 'Your grids'),
          Expanded(
            child: ListView.builder(
                itemCount: gridData.gridLists.length,
                itemBuilder: (context, index) {
                  final grid = gridData.gridLists[index];
                  return Text(grid.gridName);
                }),
          )
        ],
      );
    });
  }
}
