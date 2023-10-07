import 'package:flutter/material.dart';
import 'package:to_do/models/list_model.dart';

class NewToDo extends StatefulWidget {
  const NewToDo({super.key, required this.onAddToDo});

  final void Function(ToDoList toDoList) onAddToDo;

  @override
  State<NewToDo> createState() => _NewToDoState();
}

class _NewToDoState extends State<NewToDo> {
  final _titlecontroller = TextEditingController();
  DateTime? dateTime;
  Category _selectedCategory = Category.home;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
      builder: (context, child) => Theme(data: ThemeData.dark(), child: child!),
    );

    setState(() {
      dateTime = pickedDate;
    });
  }

  void submitToDo() {
    if (_titlecontroller.text.trim().isEmpty || dateTime == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure a valid title , date and category was entered'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Okay'))
                ],
              ));

      return;
    }

    widget.onAddToDo(ToDoList(
        title: _titlecontroller.text,
        category: _selectedCategory,
        date: dateTime!));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // final keyboardspace = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 190,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                  value: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onChanged: (value) => {},
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _titlecontroller,
                    keyboardAppearance: Brightness.dark,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 20, maxWidth: 160),
                      counterStyle: TextStyle(color: Colors.white),
                      hintText: 'Add a task',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                  ),
                ),
                const SizedBox(
                  width: 110,
                ),
                IconButton(
                    onPressed: submitToDo,
                    icon: const Icon(
                      Icons.arrow_circle_up,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(
                    dropdownColor: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    icon: const Icon(Icons.home_repair_service_outlined),
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  TextButton.icon(
                    onPressed: _presentDatePicker,
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    label: Text(
                      dateTime == null
                          ? 'No date selected'
                          : formatter.format(dateTime!),
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notification_add,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Remind me',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.repeat,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Repeat',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
