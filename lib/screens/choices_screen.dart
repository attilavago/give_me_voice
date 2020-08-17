import 'package:flutter/material.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';

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
          buttonAction: (){},
        ),
        RoundButtonLabel(
          label: 'Yes',
        ),
        SizedBox(height: 30.0,),
        RoundButton(
          imageName: 'no',
          buttonAction: (){},
        ),
        RoundButtonLabel(
          label: 'No',
        ),
      ],
    );
  }
}
