import 'package:flutter/material.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:give_me_voice/components/round_button_label.dart';

class FeelingsScreen extends StatelessWidget {
  const FeelingsScreen({
    Key key,
  }) : super(key: key);

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
                    buttonAction: () {},
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
                    buttonAction: () {},
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
                    buttonAction: () {},
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
                    buttonAction: () {},
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
                    buttonAction: () {},
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
                    buttonAction: () {},
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
