import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/util/container.dart';
import 'package:todo_app/util/text.dart';

import 'check_box.dart';

class TodoTile extends StatelessWidget {
  final int index;
  const TodoTile(
      {super.key,
      required this.index,
      this.value,
      required this.onChange,
      this.description,
      required this.taskName,
      required this.onDelete});
  final bool? value;
  final String taskName;
  final String? description;
  final Function(bool?) onChange;
  final void Function(BuildContext) onDelete;

  static Icon myIcon = Icon(Icons.delete);
  static IconData? iconData = myIcon.icon;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(8),
            onPressed: onDelete,
            backgroundColor: Color(0xffec2F4B),
            foregroundColor: Colors.white,
            label: "Delete Task",
            // padding: EdgeInsets.all(4),
            icon: iconData,
          )
        ],
      ),
      child: CContainer(
        background: value == true
            ? colors['complete-color']
            : colors['container-background'],
        margin: 7,
        padding: 10,
        containerChild: ListTile(
            title: CText(
              text: taskName,
              style: TextStyle(
                  decoration: value == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontFamily: "Poppins Black",
                  fontSize: 19),
            ),
            subtitle: CText(
              text: description ?? "",
              style: TextStyle(
                  fontFamily: "Poppins Light",
                  fontSize: 15,
                  decoration: value == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: Icon(Icons.read_more),
            leading: Checkbox(
              value: value ?? false,
              onChanged: onChange,
              activeColor: Colors.green,
            )),
      ),
    );
  }
}
