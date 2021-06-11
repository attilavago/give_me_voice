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

  bool isDisabled = false;
  bool topLeftPressed = false;
  bool bottomLeftPressed = false;
  bool topRightPressed = false;
  bool bottomRightPressed = false;

  @override
  Widget build(BuildContext context) {
    _myGridsDataBaseConnector.initializeDatabase().then((value) {});
    return WillPopScope(
      onWillPop: isDisabled ? () async => false : null,
      child: Consumer<GridItemData>(builder: (context, gridData, child) {
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
                    automaticallyImplyLeading: !isDisabled,
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.wheelchair_pickup_rounded),
                        onPressed: () {
                          setState(() {
                            isDisabled = true;
                            topLeftPressed = false;
                            topRightPressed = false;
                            bottomLeftPressed = false;
                            bottomRightPressed = false;
                          });
                        },
                      ),
                    ],
                  ),
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('test'),
                        ],
                      ),
                    ],
                  )

                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 1,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           IconButton(
                  //               icon: Icon(Icons.circle),
                  //               color: Color(0xFFF4F9FC),
                  //               onPressed: () {
                  //                 setState(() {
                  //                   topLeftPressed = true;
                  //                   if (isDisabled &&
                  //                       topLeftPressed &&
                  //                       topRightPressed &&
                  //                       bottomLeftPressed &&
                  //                       bottomRightPressed) {
                  //                     isDisabled = false;
                  //                   }
                  //                 });
                  //               }),
                  //           IconButton(
                  //               icon: Icon(Icons.circle),
                  //               color: Color(0xFFF4F9FC),
                  //               onPressed: () {
                  //                 setState(() {
                  //                   bottomLeftPressed = true;
                  //                   if (isDisabled &&
                  //                       topLeftPressed &&
                  //                       topRightPressed &&
                  //                       bottomLeftPressed &&
                  //                       bottomRightPressed) {
                  //                     isDisabled = false;
                  //                   }
                  //                 });
                  //               })
                  //         ],
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 8,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(top: 20, bottom: 20),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Expanded(
                  //               flex: 8,
                  //               child: GridView.builder(
                  //                   itemCount: gridLength,
                  //                   physics: new NeverScrollableScrollPhysics(),
                  //                   gridDelegate:
                  //                       SliverGridDelegateWithFixedCrossAxisCount(
                  //                           crossAxisCount: 2,
                  //                           mainAxisSpacing: 25.0),
                  //                   itemBuilder: (context, index) {
                  //                     final item = gridLabels[index];
                  //                     return Column(
                  //                       children: [
                  //                         RoundButton(
                  //                           imageName: item,
                  //                           size: 70.0,
                  //                           padding: 15.0,
                  //                           buttonAction: () async {
                  //                             await gridData.playGridItem(item);
                  //                           },
                  //                           buttonLongAction: () {},
                  //                         ),
                  //                         RoundButtonLabel(
                  //                           label: item.capitalize(),
                  //                         )
                  //                       ],
                  //                     );
                  //                   }),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 1,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           IconButton(
                  //               icon: Icon(Icons.circle),
                  //               color: Color(0xFFF4F9FC),
                  //               onPressed: () {
                  //                 setState(() {
                  //                   topRightPressed = true;
                  //                   if (isDisabled &&
                  //                       topLeftPressed &&
                  //                       topRightPressed &&
                  //                       bottomLeftPressed &&
                  //                       bottomRightPressed) {
                  //                     isDisabled = false;
                  //                   }
                  //                 });
                  //               }),
                  //           IconButton(
                  //               icon: Icon(Icons.circle),
                  //               color: Color(0xFFF4F9FC),
                  //               onPressed: () {
                  //                 setState(() {
                  //                   bottomRightPressed = true;
                  //                   if (isDisabled &&
                  //                       topLeftPressed &&
                  //                       topRightPressed &&
                  //                       bottomLeftPressed &&
                  //                       bottomRightPressed) {
                  //                     isDisabled = false;
                  //                   }
                  //                 });
                  //               })
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  );
            }
          },
        );
      }),
    );
  }
}
