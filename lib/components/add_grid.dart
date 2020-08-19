import 'package:flutter/material.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';

class AddGrid extends StatelessWidget {
//  const AddGrid({this.gridItems});
//
//  final GridItemData gridItems;

  @override
  Widget build(BuildContext context) {
    return Consumer<GridItemData>(
      builder: (context, gridData, child){
        return Column(
          children: <Widget>[
            Text('Search for available choices and feelings.'),
            TextField(
              onChanged: (value){

              },
              decoration: InputDecoration(
                suffixIcon: MaterialButton(
                    child: Icon(Icons.search),
                    onPressed: (){
                      //gridItems.addGridItem(searchValue, searchValue);
                    }
                ),
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
            Text('Your grid items'),
            ListView.builder(
              itemCount: gridData.gridItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  final item = gridData.gridItems[index];
                  return Column(
                    children: <Widget>[
                      RoundButton(
                        imageName: 'happy',
                        buttonAction: () {},
                      ),
                      RoundButtonLabel(
                        label: 'Happy',
                      ),
                    ],
                  );
                })
          ],
        );
      }
    );
  }
}