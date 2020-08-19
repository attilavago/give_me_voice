import 'package:flutter/foundation.dart';
import 'package:give_me_voice/models/grid_item.dart';
import 'dart:collection';

class GridItemData extends ChangeNotifier {
  List<GridItem> _gridItems = [
    GridItem(image: 'happy', label: 'Happy'),
  ];

  UnmodifiableListView<GridItem> get gridItems {
    return UnmodifiableListView(_gridItems);
  }

  int get itemCount {
    print(_gridItems.length);
    return _gridItems.length;
  }

  void addGridItem(String newGridItemImage, String newGridItemLabel){
    final item = GridItem(image: newGridItemImage, label: newGridItemLabel);
    _gridItems.add(item);
    print(_gridItems[0].label);
    notifyListeners();
  }
}