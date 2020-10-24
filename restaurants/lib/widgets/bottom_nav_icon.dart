import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/provider/navigation.dart';

class BottomNavIcon extends StatelessWidget {
  final int index;
  final IconData icon;

  const BottomNavIcon({Key key, this.index, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, model, _) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              icon,
              color: index == model.index ? Color(0xFFE1614A) : Colors.black54,
            ),
            onPressed: () => model.setindex(index),
          ),
        ],
      ),
    );
  }
}
