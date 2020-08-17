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
        backgroundColor: Color(kAppBackground),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Give Me Voice',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 35.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Bio ipsum dolor sit amet, consectetur adipiscing elit. Etiam leo magna, in lorem sit amet, scelerisque.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundButton(
                imageName: 'iloveyou',
                buttonAction: (){
                  Navigator.pushNamed(context, TabsScreen.id);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'I love you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade700,
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
