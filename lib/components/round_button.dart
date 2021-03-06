import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {this.imageName,
      this.buttonAction,
      this.buttonLongAction,
      this.size = 50.0,
      this.padding = 15.0});
  final String imageName;
  final Function buttonAction;
  final Function buttonLongAction;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: imageName,
      child: RawMaterialButton(
        onPressed: buttonAction,
        onLongPress: buttonLongAction,
        elevation: 1.0,
        fillColor: Colors.white,
        splashColor: Color(0xFFCADAE0),
        child: ExcludeSemantics(
          excluding: true,
          child: Image.asset(
            'images/$imageName.png',
            height: size,
          ),
        ),
        padding: EdgeInsets.all(padding),
        shape: CircleBorder(
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
        ),
      ),
    );
  }
}
