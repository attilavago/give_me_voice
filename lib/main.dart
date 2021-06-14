import 'package:flutter/material.dart';
import 'package:give_me_voice/screens/welcome_screen.dart';
import 'package:give_me_voice/screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:give_me_voice/models/grid_data.dart';
import 'package:give_me_voice/screens/grid_screen.dart';

void main() {
  runApp(GiveMeVoice());
}

class GiveMeVoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GridItemData(),
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color(0xFF2BAE66),
            accentColor: Color(0xFF2BAE66),
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: Color(0xFFF4F9FC),
            primaryIconTheme: IconThemeData(
              color: Color(0xFF2BAE66),
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 20.0),
              bodyText2: TextStyle(fontSize: 16.0),
              headline1: TextStyle(fontFamily: 'BalooThambi2'),
              headline2: TextStyle(fontFamily: 'BalooThambi2'),
              headline3: TextStyle(fontFamily: 'BalooThambi2'),
              headline4: TextStyle(fontFamily: 'BalooThambi2'),
              headline5: TextStyle(fontFamily: 'BalooThambi2'),
              headline6: TextStyle(
                  fontFamily: 'BalooThambi2', color: Color(0xFFF4F9FC)),
              button: TextStyle(fontFamily: 'BalooThambi2', fontSize: 18.0),
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Color(0xFFF4F9FC),
            ),
            appBarTheme: AppBarTheme(
                textTheme: TextTheme(
              headline6: TextStyle(
                fontFamily: 'BalooThambi2',
//                color: Color(0xFFF4F9FC),
                fontSize: 28.0,
              ),
            ))),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          TabsScreen.id: (context) => TabsScreen(),
          GridScreen.id: (context) => GridScreen(),
        },
      ),
    );
  }
}
