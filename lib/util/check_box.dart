import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CCheckBox extends StatelessWidget {
  final Function(bool?) onChange;
  final bool? checked;
  const CCheckBox({super.key, required this.onChange, this.checked});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checked??false,
      onChanged: onChange,
      activeColor: Colors.green,
    );
  }
}
