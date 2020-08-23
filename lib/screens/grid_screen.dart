import 'package:flutter/material.dart';
import 'package:give_me_voice/models/grid_list.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    itemCount: gridData
                        .gridLists[gridData.activeCardIndex].items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final item = gridData
                          .gridLists[gridData.activeCardIndex].items[index];
                      return Column(
                        children: [
                          RoundButton(
                            imageName: item.image,
                            size: 70.0,
                            padding: 15.0,
                            buttonAction: () {},
                            buttonLongAction: () {},
                          ),
                          RoundButtonLabel(
                            label: item.label,
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}