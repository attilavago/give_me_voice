import 'package:flutter/material.dart';
import 'package:give_me_voice/utils/extensions.dart';

class RoundButtonLabel extends StatelessWidget {
  const RoundButtonLabel({this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            label.capitalize(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.0,
              color: Color(0xFFF4F9FC),
            ),
          ),
        ),
      ),
    );
  }
}
