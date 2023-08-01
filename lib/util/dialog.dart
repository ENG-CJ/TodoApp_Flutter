import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/util/buttons.dart';
import 'package:todo_app/util/container.dart';
import 'package:todo_app/util/text.dart';

class CreateTaskDialog extends StatelessWidget {
  const CreateTaskDialog(
      {super.key, required this.controller, required this.onChange});
  final TextEditingController controller;
  final Function() onChange;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
      title: CText(
        text: "Create Today Task",
      ),
      backgroundColor: colors['container-background'],
      elevation: 10,
      actionsPadding: EdgeInsets.all(20),
      content: Row(
// mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {},
              autocorrect: true,
              controller: controller,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: colors['container-background'],
                  fontFamily: "Poppins Light",
                  fontSize: 22),
              decoration: InputDecoration(
                  hintText: "task name ....",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  filled: true,
                  constraints: BoxConstraints.tightFor(width: double.infinity)),
            ),
          )
        ],
      ),
      actions: [
        CButton(
          btnChild: Text("Create"),
          onChange: onChange,
        )
      ],
    );
  }
}
