import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:to_do/Screens/new_todo.dart';
import 'package:to_do/list_item/item_list.dart';
import 'package:to_do/main.dart';
import 'package:to_do/models/list_model.dart';

class ToDoDisplay extends StatefulWidget {
  const ToDoDisplay({super.key});

  @override
  State<ToDoDisplay> createState() => _ToDoDisplayState();
}

class _ToDoDisplayState extends State<ToDoDisplay> {
  final List<ToDoList> _registeredtodo = [
    ToDoList(title: 'Flutter', category: Category.study, date: DateTime.now()),
    ToDoList(
        title: 'Coding Question',
        category: Category.study,
        date: DateTime.now()),
  ];

  void _removetodo(ToDoList todo) {
    final todoIndex = _registeredtodo.indexOf(todo);
    setState(() {
      _registeredtodo.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Task Completed'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredtodo.insert(todoIndex, todo);
            });
          }),
    ));
  }

  void _openNewtodoAdd() {
    showModalBottomSheet(
      backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
       shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical( 
            top: Radius.circular(25.0),
          ),
       ),
      elevation: 20,
        context: context,
        isScrollControlled: true,
       
        builder: (ctx) => NewToDo(onAddToDo: _addToDo));
  }

  void _addToDo(ToDoList todo) {
    setState(() {
      _registeredtodo.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(
      child: Text('No Pending work found!'),
    );

    if (_registeredtodo.isNotEmpty) {
      maincontent = ListToDo(
        todolist: _registeredtodo,
        onRemovetodo: _removetodo,
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
        title:  Text(
          'Tasks',
          style: Theme.of(context).textTheme.headlineSmall
        ),
        // actions: [
        //   IconButton(onPressed: _openNewtodoAdd, icon: const Icon(Icons.add))
        // ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Day is here!',
              style: Theme.of(context).textTheme.headlineSmall,)
          ),
          Expanded(child: maincontent),


          
             Container(
                height: 60,
                width: 60,
                margin:  const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 5, 99, 125),

                  ),
                
      
                child: IconButton(
                    onPressed: _openNewtodoAdd
                    , icon: const Icon(Icons.add,color: Colors.white,size: 35,))),
          
        ],
      ),
    );
  }
}
