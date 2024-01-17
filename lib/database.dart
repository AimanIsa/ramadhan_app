import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {

  List toDolist = [];

  //reference box
    final _myBox = Hive.box('myBox');

  //run this method opening this app for the first time
  void createInitialData() {
    toDolist = [
      ["5 prayer",false],
      ["Sadaqah",false],
    ];
  }

  //load data from database
  void loadData() {
    toDolist = _myBox.get("CHECKLIST");
  }

  //update database
  void updateDatabase() {
    _myBox.put("CHECKLIST",toDolist);
  }


}