import 'package:flutter/material.dart';
import 'package:to_do/models/list_model.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem(this.todolist, this.onRemovetodo, {super.key});
  final ToDoList todolist;
   final void Function(ToDoList todolist) onRemovetodo;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            IconButton(
              
                onPressed:(){
                    onRemovetodo(todolist);
                } ,
                icon: const Icon(
                  Icons.check_box_outline_blank_rounded,
                  size: 30,
                )),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todolist.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      categoryIcons[todolist.category],
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      todolist.formattedDate,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
