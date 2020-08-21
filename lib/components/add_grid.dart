import 'package:flutter/material.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';

class AddGrid extends StatefulWidget {
  @override
  _AddGridState createState() => _AddGridState();
}

class _AddGridState extends State<AddGrid> {
  String searchValue;

  final emojiInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<GridItemData>(
      builder: (context, gridData, child){
        return Column(
          children: <Widget>[
            Text('Search for available choices and feelings.'),
            TextField(
              controller: emojiInput,
              onChanged: (value){
                searchValue = value;
              },
              decoration: InputDecoration(
                suffixIcon: MaterialButton(
                    child: Icon(Icons.search),
                    onPressed: (){
                      Provider.of<GridItemData>(context).addGridItem(searchValue, searchValue);
                      setState(() {
                        emojiInput.clear();
                      });
                    }
                ),
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
            Text('Your grid items'),
            Expanded(
                child: GridView.builder(
                    itemCount: gridData.gridItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
                    itemBuilder: (context, index){
                      final item = gridData.gridItems[index];
                      return RoundButton(
                        imageName: item.image,
                        size: 35.0,
                        padding: 5.0,
                        buttonAction: () {},
                      );
                    })
        ),
          ],
        );
      }
    );
  }
}