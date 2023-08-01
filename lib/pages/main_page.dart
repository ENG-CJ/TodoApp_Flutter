import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/database/todos.dart';
import 'package:todo_app/util/container.dart';
import 'package:todo_app/util/dialog.dart';
import 'package:todo_app/util/listTile.dart';
import 'package:todo_app/util/round_button.dart';
import 'package:todo_app/util/text.dart';

import '../util/messages.dart';
import '../util/todo_tile.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {


  bool? checkValue = false;
  TextEditingController _controler = TextEditingController();
  static Icon? icoData = Icon(Icons.arrow_right);
  static IconData? data = icoData?.icon;
  TodoController todo = TodoController();
  var todoListItems;

  final mybox=Hive.box("todo");
  @override
  void initState() {
    // TODO: implement initState
    todoListItems = todo.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Icon(Icons.exit_to_app),
          title: Text("Dark Todo App"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    // todoListItems = todo.getTodos();
                  });
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CContainer(
                radius: 10,
                gradient: const LinearGradient(
                    colors: [Color(0xffDA4453), Color(0xff89216B)]),
                padding: 30,
                containerChild: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CText(
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins Black",
                          ),
                          text: "My Todo List",
                        ),
                        CText(
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins Light",
                          ),
                          text: "Do Tasks At the right time!!",
                        ),
                      ],
                    ),
                    RoundIconButton(
                      icon: Icons.add_task,
                      onClicked: () {
                        print(mybox.get("todo"));
                        _controler.clear();
                        showDialog(
                            context: context,
                            builder: (context) => CreateTaskDialog(
                                  onChange: ()  {
                                    setState((){
                                      todo.createTask({
                                        "taskName": _controler.text,
                                        "description": "No Descr",
                                        "complete": false
                                      });
                                      todoListItems=todo.getTodos();
                                      // await todo.updateTodo();
                                    });
                                    Navigator.pop(context);


                                  },
                                  controller: _controler,
                                ));
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: todoListItems.length,
                    itemBuilder: (context, index) {
                      var item = todoListItems[index];
                      return TodoTile(
                          onDelete: (context) {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Messages.confirm(

                                      context,
                                      (){

                                        setState(()  {

                                           todo.deleteTask(item['key']);
                                          todoListItems=todo.getTodos();

                                        });
                                        Navigator.of(context).pop();
                                      },
                                      title: CText(text: "Confirm",
                                      style: TextStyle(color: colors['gr-2'], fontSize: 21),),
                                      message: CText(text: "Are You Sure To Delete This task, Once you remove you can recover!?",
                                        style: TextStyle(color: colors['container-background'], fontSize: 18),)
                                    );
                                  });
                            });
                          },
                          taskName: item['taskName'],
                          description: item['description'],
                          value: item['complete'],
                          onChange: (_value) {
                            setState(() {
                              item['complete'] = !item['complete'];
                            });
                            todo.updateData(index, item);
                            if(item['complete'])
                           {
                             Messages.showToas("You've Completed One Task");
                           }
                          },
                          index: index + 1);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
