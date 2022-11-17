import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightStatusBar extends StatelessWidget {
  final Widget child;
  const LightStatusBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: child,
    );
  }
}
