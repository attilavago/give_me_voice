import 'package:flutter/material.dart';
import 'package:give_me_voice/utils/extensions.dart';

class RoundButtonLabel extends StatelessWidget {
  const RoundButtonLabel({this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        label.capitalize(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17.0,
        ),
      ),
    );
  }
}
