import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/util/buttons.dart';
import 'package:todo_app/util/text.dart';

class Messages {
  static Widget confirm(BuildContext context, Function() onDelete,{Widget? message, Widget? title}) {
    var alert = AlertDialog(
      title: title,
      content: message,
      elevation: 3,
      contentTextStyle:
          TextStyle(color: colors['container-background'], fontSize: 100),
      backgroundColor: colors['foreground-color'],
      actions: [
        CButton(onChange: onDelete, btnChild: CText(text: "Yes")),
        CButton(onChange: () {
          Navigator.of(context).pop();
        }, btnChild: CText(text: "No")),
      ],
    );

    return alert;
  }

  static showToas(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: colors['complete-color'],
      fontSize: 18,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );

  }


  static void showMessage(String messageInfo){
     Fluttertoast.showToast(msg: messageInfo,
      backgroundColor: colors['complete-color'],
       textColor: Colors.white,
       fontSize:  25,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM

     );
  }













}
