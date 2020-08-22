import 'package:flutter/material.dart';
import 'package:give_me_voice/models/grid_list.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:provider/provider.dart';

class GridScreen extends StatelessWidget {
  static String id = 'grid_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<GridItemData>(builder: (context, gridData, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          title: Text(Provider.of<GridItemData>(context)
              .gridLists[gridData.activeCardIndex]
              .gridName),
        ),
      );
    });
  }
}
