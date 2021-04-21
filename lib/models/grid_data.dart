import 'package:flutter/foundation.dart';
import 'package:give_me_voice/models/grid_item.dart';
import 'package:give_me_voice/models/grid_list.dart';
import 'dart:collection';
import 'package:flutter_tts/flutter_tts.dart';

class GridItemData extends ChangeNotifier {
  List<GridItem> _gridItems = [];
  List<GridList> _gridLists = [];
  List<String> _feelings = [
    'angry',
    'anguished',
    'anxious',
    'astonished',
    'bawling',
    'beaming',
    'cheeky',
    'confounded',
    'confused',
    'cowboy',
    'crying',
    'disappointed',
    'disguised',
    'dizzy',
    'downcast',
    'drooling',
    'exhaling',
    'exploding',
    'expressionless',
    'extatic',
    'fearful',
    'flushed',
    'frightened',
    'frowning',
    'grimacing',
    'grinning',
    'happy',
    'hot',
    'hug',
    'hush',
    'hypnotized',
    'ill',
    'iloveyou',
    'injured',
    'inlove',
    'intrigued',
    'kiss',
    'laughing',
    'looking',
    'lier',
    'looking',
    'nauseated',
    'nerd',
    'neutral',
    'no',
    'party',
    'pensive',
    'persevering',
    'pleading',
    'quiet',
    'relieved',
    'rollingeyes',
    'sad',
    'shush',
    'sick',
    'sleepy',
    'speechless',
    'star-struck',
    'surprised',
    'swearing',
    'thinking',
    'tired',
    'unamused',
    'unwell',
    'woozy',
    'worried',
    'yes',
    'yummi',
    'zany'
  ];
  int _activeCard;
  FlutterTts flutterTts = FlutterTts();

  UnmodifiableListView<GridItem> get gridItems {
    return UnmodifiableListView(_gridItems);
  }

  UnmodifiableListView<GridList> get gridLists {
    return UnmodifiableListView(_gridLists);
  }

  int get itemCount {
    return _gridItems.length;
  }

  List get feelings {
    return _feelings;
  }

  void addGridItem(String newGridItemImage, String newGridItemLabel) {
    final item = GridItem(image: newGridItemImage, label: newGridItemLabel);
    _gridItems.add(item);
    notifyListeners();
  }

  void removeGridItem(GridItem gridItem) {
    _gridItems.remove(gridItem);
    notifyListeners();
  }

  void addGridList(String name) {
    final grid = GridList(gridName: name, items: _gridItems);
    _gridLists.add(grid);
    _gridItems = [];
    notifyListeners();
  }

  void removeGridList(GridList gridList) {
    _gridLists.remove(gridList);
    notifyListeners();
  }

  void setActiveCardIndex(int index) {
    _activeCard = index;
    notifyListeners();
  }

  int get activeCardIndex {
    return _activeCard;
  }

  Future playGridItem(String itemLabel) async {
    var result = await flutterTts.speak(itemLabel);
    if (result == 1) {
      print(itemLabel);
    }
  }
}
