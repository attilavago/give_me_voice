import 'package:flutter/material.dart';
import 'package:give_me_voice/screens/welcome_screen.dart';
import 'package:give_me_voice/screens/tabs_screen.dart';

void main() {
  runApp(GiveMeVoice());
}

class GiveMeVoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        TabsScreen.id: (context) => TabsScreen(),
      },
    );
  }
}

