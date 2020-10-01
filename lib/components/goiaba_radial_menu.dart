import 'package:flutter/material.dart';
import 'goiaba_radial_menu/src/radial_menu.dart';
import 'goiaba_radial_menu/src/radial_menu_item.dart';

class GoiabaRadialMenu extends StatefulWidget {
  @override
  _GoiabaRadialMenuState createState() => _GoiabaRadialMenuState();
}

class _GoiabaRadialMenuState extends State<GoiabaRadialMenu> {
  final items = [
    RadialMenuItem(
        Icon(Icons.star, color: Colors.white), Colors.red, () => print('red')),
    RadialMenuItem(Icon(Icons.star, color: Colors.white), Colors.green,
        () => print('green')),
    RadialMenuItem(Icon(Icons.star, color: Colors.white), Colors.blue,
        () => print('blue')),
    RadialMenuItem(Icon(Icons.star, color: Colors.white), Colors.yellow,
        () => print('yellow')),
    RadialMenuItem(Icon(Icons.star, color: Colors.white), Colors.purple,
        () => print('purple')),
  ];

  @override
  Widget build(BuildContext context) {
    return RadialMenu(items, fanout: Fanout.top);
  }
}
