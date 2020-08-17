import 'package:flutter/material.dart';

class RoundButtonLabel extends StatelessWidget {
  const RoundButtonLabel({this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 20.0,
        ),
      ),
    );
  }
}