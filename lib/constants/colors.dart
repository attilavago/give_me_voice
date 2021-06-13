import 'package:flutter/material.dart';

const kAppBackground = 0xFFe0e0e0;
final kFancyBackground = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.green.shade300, Colors.green.shade400]));

final kFancyBackgroundInverse = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.green.shade400, Colors.green.shade300]));

final kFancyCardBackground = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.green.shade400, Color(0xFF2BAE66)]));
