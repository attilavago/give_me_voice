import 'package:flutter/foundation.dart';
import 'package:give_me_voice/models/grid_item.dart';
import 'package:give_me_voice/models/grid_list.dart';
import 'dart:collection';

class GridItemData extends ChangeNotifier {
  List<GridItem> _gridItems = [];
  List<GridList> _gridLists = [];

  UnmodifiableListView<GridItem> get gridItems {
    return UnmodifiableListView(_gridItems);
  }

  UnmodifiableListView<GridList> get gridLists {
    return UnmodifiableListView(_gridLists);
  }

  int get itemCount {
    print(_gridItems.length);
    return _gridItems.length;
  }

  void addGridItem(String newGridItemImage, String newGridItemLabel){
    final item = GridItem(image: newGridItemImage, label: newGridItemLabel);
    _gridItems.add(item);
    notifyListeners();
  }

  void removeGridItem(GridItem gridItem){
    _gridItems.remove(gridItem);
    notifyListeners();
  }

  void addGridList(String name){
    final grid = GridList(gridName: name, items: _gridItems);
    _gridLists.add(grid);
    print(_gridLists);
  }
}