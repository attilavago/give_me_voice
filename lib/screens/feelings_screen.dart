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
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    RoundButton(
                      imageName: 'happy',
                      size: screenSize.width < 768 ? 50 : 100,
                      buttonAction: () {
                        playGridItem('Happy');
                      },
                    ),
                    RoundButtonLabel(
                      label: 'Happy',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    RoundButton(
                      imageName: 'sad',
                      size: screenSize.width < 768 ? 50 : 100,
                      buttonAction: () {
                        playGridItem('Sad');
                      },
                    ),
                    RoundButtonLabel(
                      label: 'Sad',
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: screenSize.width < 768 ? 20 : 75),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    RoundButton(
                      imageName: 'thinking',
                      size: screenSize.width < 768 ? 50 : 100,
                      buttonAction: () {
                        playGridItem('Thinking');
                      },
                    ),
                    RoundButtonLabel(
                      label: 'Thinking',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    RoundButton(
                      imageName: 'unwell',
                      size: screenSize.width < 768 ? 50 : 100,
                      buttonAction: () {
                        playGridItem('Unwell');
                      },
                    ),
                    RoundButtonLabel(
                      label: 'Unwell',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenSize.width < 768 ? 20 : 75),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    RoundButton(
                      imageName: 'frightened',
                      size: screenSize.width < 768 ? 50 : 100,
                      buttonAction: () {
                        playGridItem('Frightened');
                      },
                    ),
                    RoundButtonLabel(
                      label: 'Frightened',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    RoundButton(
                      imageName: 'angry',
                      size: screenSize.width < 768 ? 50 : 100,
                      buttonAction: () {
                        playGridItem('Angry');
                      },
                    ),
                    RoundButtonLabel(
                      label: 'Angry',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
