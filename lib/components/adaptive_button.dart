import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const AdaptiveButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(label),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text(label),
          );
  }
}
