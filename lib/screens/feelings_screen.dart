import 'package:flutter/material.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FeelingsScreen extends StatelessWidget {
  const FeelingsScreen({
    Key key,
  }) : super(key: key);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  RoundButton(
                    imageName: 'happy',
                    buttonAction: () {
                      playGridItem('Happy');
                    },
                  ),
                  RoundButtonLabel(
                    label: 'Happy',
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RoundButton(
                    imageName: 'sad',
                    buttonAction: () {
                      playGridItem('Sad');
                    },
                  ),
                  RoundButtonLabel(
                    label: 'Sad',
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  RoundButton(
                    imageName: 'thinking',
                    buttonAction: () {
                      playGridItem('Thinking');
                    },
                  ),
                  RoundButtonLabel(
                    label: 'Thinking',
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RoundButton(
                    imageName: 'unwell',
                    buttonAction: () {
                      playGridItem('Unwell');
                    },
                  ),
                  RoundButtonLabel(
                    label: 'Unwell',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  RoundButton(
                    imageName: 'frightened',
                    buttonAction: () {
                      playGridItem('Frightened');
                    },
                  ),
                  RoundButtonLabel(
                    label: 'Frightened',
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RoundButton(
                    imageName: 'angry',
                    buttonAction: () {
                      playGridItem('Angry');
                    },
                  ),
                  RoundButtonLabel(
                    label: 'Angry',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
