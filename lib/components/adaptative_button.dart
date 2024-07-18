import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  AdaptativeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: () => onPressed,
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : ElevatedButton(
            onPressed: () => onPressed,
            child: Text(label),
            style: Theme.of(context).elevatedButtonTheme.style,
          );
  }
}
