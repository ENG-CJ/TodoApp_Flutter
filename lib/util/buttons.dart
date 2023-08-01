import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/util/text.dart';

class CButton extends StatelessWidget {
  final Function() onChange;
  const CButton({super.key, required this.onChange, required this.btnChild,
  this.background,this.foreground, this.padding});
  final Widget btnChild;
  final Color? background;
  final Color? foreground;
  final double? padding;


  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onChange,
    style: TextButton.styleFrom(
      backgroundColor: background??Colors.blue,
      elevation: 10,
      foregroundColor: foreground??Colors.white,

      padding: EdgeInsets.all(padding??10)
    ), child: btnChild,);
  }
}
