import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ramadhan_app/checklist/data/database.dart';
import 'package:ramadhan_app/checklist/dialogbox.dart';
import 'package:ramadhan_app/checklist/todolist.dart';
import 'package:ramadhan_app/color.dart';

class checklist extends StatefulWidget {
  const checklist({super.key});

  @override
  State<checklist> createState() => _HomePageState();
}

class _HomePageState extends State<checklist> {
//reference to the hive box
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //TODO implement
    if (_myBox.get("CHECKLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

//text controller
  final _controller = TextEditingController();

//checBox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateDatabase();
  }

//save new task
  void saveNewTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

//create a new Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

//delete task
  void deleteTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkgreen,
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          "Checklist Ramadhan",
          style: GoogleFonts.poppins(color: cream),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: db.toDolist[index][0],
            taskCompleted: db.toDolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
