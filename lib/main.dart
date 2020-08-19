import 'package:flutter/material.dart';
import 'package:give_me_voice/screens/welcome_screen.dart';
import 'package:give_me_voice/screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';

void main() {
  runApp(GiveMeVoice());
}

class GiveMeVoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => GridItemData(),
      child: MaterialApp(
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          TabsScreen.id: (context) => TabsScreen(),
        },
      ),
    );
  }
}

