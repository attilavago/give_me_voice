import 'package:flutter/material.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';

class ChoicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RoundButton(
            imageName: 'yes',
            buttonAction: () {},
          ),
          RoundButtonLabel(
            label: 'Yes',
          ),
          SizedBox(
            height: 30.0,
          ),
          RoundButton(
            imageName: 'no',
            buttonAction: () {},
          ),
          RoundButtonLabel(
            label: 'No',
          ),
        ],
      ),
    );
  }
}
