import 'package:flutter/material.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';

class ChoicesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('A grid to communicate core decisions'),
        SizedBox(height: 30.0,),
        RoundButton(
          imageName: 'yes',
          buttonAction: (){
            Provider.of<GridItemData>(context).itemCount;
          },
        ),
        RoundButtonLabel(
          label: 'Yes ${Provider.of<GridItemData>(context).itemCount}',
        ),
        SizedBox(height: 30.0,),
        RoundButton(
          imageName: 'no',
          buttonAction: (){
            Provider.of<GridItemData>(context).addGridItem('booo', 'booo');
          },
        ),
        RoundButtonLabel(
          label: 'No',
        ),
      ],
    );
  }
}
