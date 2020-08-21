import 'package:flutter/material.dart';
import 'package:give_me_voice/screens/tabs_screen.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({this.imageName, this.buttonAction, this.size = 50.0, this.padding = 15.0});
  final String imageName;
  final Function buttonAction;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: buttonAction,
      elevation: 2.0,
      fillColor: Colors.white,
      child: Image.asset(
        'images/$imageName.png',
        height: size,
      ),
      padding: EdgeInsets.all(padding),
      shape: CircleBorder(),
    );
  }
}