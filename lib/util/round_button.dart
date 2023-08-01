import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/constants.dart';

class RoundIconButton extends StatelessWidget {
  final Color? iconBackground;
  final Color? iconColor;
  final double? constraintWidth, constraintHeight;
  final IconData icon;
  final Function() onClicked;
  const RoundIconButton(
      {super.key,
      this.iconBackground,
      this.iconColor,
      this.constraintHeight,
      this.constraintWidth,
      required this.icon,
      required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClicked,
      shape: CircleBorder(),
      elevation: 3,
      constraints: BoxConstraints.tightFor(
          width: constraintWidth ?? 56, height: constraintHeight ?? 56),
      fillColor: iconBackground ?? colors['foreground-color'],
      child: FaIcon(
          icon,
        color: iconColor ?? colors['container-background'],
      ),
    );
  }
}
