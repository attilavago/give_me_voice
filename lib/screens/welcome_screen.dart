import 'package:flutter/material.dart';
import 'package:give_me_voice/screens/tabs_screen.dart';
import 'package:give_me_voice/constants/colors.dart';
import 'package:give_me_voice/components/round_button.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';
  static FlutterTts flutterTts = FlutterTts();

  Future playGridItem(String itemLabel) async {
    var result = await flutterTts.speak(itemLabel);
    if (result == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: kFancyBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                'standard',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              Text(
                'Communicate without words, with a single touch.',
                textAlign: TextAlign.center,
              ),
              Text(
                'Give voice to those who do not have!',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Tap below to start your journey.',
                textAlign: TextAlign.center,
              ),
              Text(
                'For best experience, turn the sound on.',
                textAlign: TextAlign.center,
              ),
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
