import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  AdaptiveIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Icon(icon),
            onPressed: onPressed,
          )
        : IconButton(
            icon: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: onPressed,
          );
  }
}
