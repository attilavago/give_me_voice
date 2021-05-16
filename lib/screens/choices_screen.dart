import 'package:flutter/material.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChoicesScreen extends StatelessWidget {
  static FlutterTts flutterTts = FlutterTts();
  Future playGridItem(String itemLabel) async {
    var result = await flutterTts.speak(itemLabel);
    if (result == 1) {}
  }

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
            buttonAction: () {
              playGridItem('Yes');
            },
          ),
          RoundButtonLabel(
            label: 'Yes',
          ),
          SizedBox(
            height: 30.0,
          ),
          RoundButton(
            imageName: 'no',
            buttonAction: () {
              playGridItem('No');
            },
          ),
          RoundButtonLabel(
            label: 'No',
          ),
        ],
      ),
    );
  }
}
