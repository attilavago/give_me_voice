import 'package:flutter/material.dart';
import 'package:give_me_voice/models/grid_list.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:give_me_voice/screens/grid_screen.dart';
import 'package:give_me_voice/utils/extensions.dart';
import 'package:give_me_voice/utils/db_connector.dart';

class GridsScreen extends StatefulWidget {
  @override
  _GridsScreenState createState() => _GridsScreenState();
}

class _GridsScreenState extends State<GridsScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  MyGridsDataBaseConnector _myGridsDataBaseConnector =
      MyGridsDataBaseConnector();
  @override
  Widget build(BuildContext context) {
    _myGridsDataBaseConnector.initializeDatabase().then((value) {
      print('----database initialized from grids list-----');
    });
    // Future<void> _showMyDialog(GridList item) async {
    //   return showDialog<void>(
    //     context: context,
    //     barrierDismissible: true,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Are you sure?'),
    //         content: SingleChildScrollView(
    //           child: ListBody(
    //             children: <Widget>[
    //               Text('You are about to delete the "${item.gridName}" grid!'),
    //               Text('Is this really what you want?'),
    //             ],
    //           ),
    //         ),
    //         actions: <Widget>[
    //           TextButton(
    //             child: Text('No, leave it.'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //           TextButton(
    //             child: Text('Yes, delete.'),
    //             onPressed: () {
    //               Provider.of<GridItemData>(context, listen: false)
    //                   .removeGridList(item);
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    return Consumer<GridItemData>(builder: (context, gridData, child) {
      return FutureBuilder<List>(
        future: _myGridsDataBaseConnector.getGrids(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            var gridsCount = snapshot.data.length;
            var grids = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (gridsCount == 0)
                    Text('You currently have no grids. How about adding one?',
                        textAlign: TextAlign.center),
                  Expanded(
                    child: ListView.builder(
                        itemCount: gridsCount,
                        itemBuilder: (context, index) {
                          final grid = grids[index];
                          final gridImages = grid['images'].split(',');
                          return Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                // remove grid
                              });
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'The "${grid['name'].capitalize()}" grid has been deleted!')));
                            },
                            background: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'delete',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          grid['name'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            //_showMyDialog(grid);
                                          },
                                          icon: Icon(Icons.delete),
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        for (var image in gridImages)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 3.0, bottom: 10.0),
                                            child: Image.asset(
                                              'images/${image}.png',
                                              height: 30.0,
                                            ),
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        OutlineButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0)),
                                          onPressed: () {
                                            gridData.setActiveCardIndex(index);
                                            Navigator.pushNamed(
                                                context, GridScreen.id);
                                          },
                                          child: Text(
                                            'Open',
                                            style: TextStyle(fontSize: 17.0),
                                          ),
                                          color: Theme.of(context).accentColor,
                                          highlightedBorderColor:
                                              Theme.of(context).accentColor,
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .accentColor),
                                          textColor:
                                              Theme.of(context).accentColor,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 1.0),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('blaaaaah', textAlign: TextAlign.center),
                ],
              ),
            );
          }
        },
      );
    });
  }
}
