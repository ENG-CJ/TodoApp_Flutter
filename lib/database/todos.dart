import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class TodoController{

   List<Map<String,dynamic>> _todosList=[];
   final _todBox=Hive.box("todo");

  List<Map<String,dynamic>> getTodos(){
     var data=_todBox.keys.map((key){
       var item =_todBox.get(key);
        return {"key": key, "taskName": item['taskName'], 'description': item['description'], 'complete': item['complete']};
    }).toList();
     _todosList=data;
    return _todosList;
  }

  void createTask(Map<String,dynamic> data)async {
    await _todBox.add(data);
  }

  void deleteTask(dynamic key) {
     _todBox.delete(key);
  }
  void updateData(int key, Map<String, dynamic> value){
    _todBox.putAt(key, value);
  }


}