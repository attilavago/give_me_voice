import 'package:flutter/material.dart';
import 'package:give_me_voice/screens/tabs_screen.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({this.imageName, this.buttonAction});
  final String imageName;
  final Function buttonAction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: buttonAction,
      elevation: 2.0,
      fillColor: Colors.white,
      child: Image.asset(
        'images/$imageName.png',
        height: 50.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}