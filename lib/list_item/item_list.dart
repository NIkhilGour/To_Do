import 'package:to_do/list_item/todo_item.dart';
import 'package:to_do/models/list_model.dart';
import 'package:flutter/material.dart';

class ListToDo extends StatelessWidget {
  const ListToDo({super.key, required this.todolist,required this.onRemovetodo});

  final List<ToDoList> todolist;
  final void Function(ToDoList todolist) onRemovetodo;
  @override
  Widget build(BuildContext context) {
    // this is used for the dismissible list but we dont want dismissible so we use listview 
    // return ListView.builder(
    //   itemCount: todolist.length,
    //   itemBuilder: (ctx, index) => Dismissible(
    //       key: ValueKey(todolist[index]),
    //       background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.75),
    //          // margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
    //       ),
          
    //       onDismissed: (direction) {
    //         onRemovetodo(todolist[index]);
    //       },
    //       child: ToDoItem(todolist[index],onRemovetodo)),
    // );

      return ListView(

        children: [
          for(int i=0;i<todolist.length;i++)
          ToDoItem(todolist[i], onRemovetodo)

          
        ],
    );
  }
}

// class Practice extends StatelessWidget {
//    const Practice({super.key,required this.todolist, required this.onRemovetodo});
//   final List<ToDoList> todolist;
//   final void Function(ToDoList todolist) onRemovetodo;

//   @override
//   Widget build(BuildContext context) {
    
    
  
    
    
    
//   }
// }