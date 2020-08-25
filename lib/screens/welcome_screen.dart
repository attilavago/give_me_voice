import 'package:flutter/material.dart';
import 'package:give_me_voice/screens/tabs_screen.dart';
import 'package:give_me_voice/constants/colors.dart';
import 'package:give_me_voice/components/round_button.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF41CE8F),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Give Me Voice',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'BalooThambi2',
                  fontSize: 34.0,
                ),
              ),
              Text(
                'lite',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              Text(
                'Communicate without words, with a single touch. Give voice to those who do not have!',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Tap below to start your journey.'),
              Text('For best experience, turn the sound on.'),
              SizedBox(
                height: 80.0,
              ),
              RoundButton(
                imageName: 'iloveyou',
                buttonAction: () {
                  Navigator.pushNamed(context, TabsScreen.id);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'I Love You',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
