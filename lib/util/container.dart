import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class CContainer extends StatelessWidget {
  final Widget containerChild;
  final double? padding;
  final double? margin;
  final Color? background;
  final double? radius;
  final LinearGradient? gradient;
  final Function()? onTap;
  const CContainer({super.key,
  required this.containerChild,
    this.gradient,
    this.background,
    this.margin,
    this.padding,
    this.radius,
    this.onTap

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:padding??10, vertical: padding??10),
        margin: EdgeInsets.symmetric(horizontal:margin??1, vertical: margin??1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius??4),
          color: background??colors['container-background'],
          gradient: gradient
        ),
        child: containerChild,
      ),
    );
  }
}
