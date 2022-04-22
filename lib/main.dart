import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: AddTodo(),
    );
  }
}

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  List<String> _todoItems = [];

  void _addTodoItem(String event) {
    if(event.length > 0) {
      setState(() => _todoItems.add(event));
    }
  }


  Widget _buildTodoList() {
    return ListView.builder(
      // ignore: missing_return
      itemBuilder: (context, index) {
        // ignore: missing_return
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }


  Widget _buildTodoItem(String todoText, int index) {
    return ListTile(
      title: Text(todoText),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 75,left: 28),
        child: _buildTodoList(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(35,68,0,0),
        child: ListView(
          children:[ Row(
            children: [
              Text("Todo Lists",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                ),),
              // ignore: deprecated_member_use
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: FlatButton(
                  onPressed: _pushAddTodo,
                  // tooltip: 'Add task',
                  child: Icon(Icons.edit)),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void _pushAddTodo() {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Text("Tasks",
                        style: TextStyle(
                          fontSize: 30,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: new TextField(
                        autofocus: true,
                        onSubmitted: (val) {
                          _addTodoItem(val);
                          Navigator.pop(context);
                        },
                        decoration: new InputDecoration(
                            hintText: 'Add Task',
                            contentPadding: const EdgeInsets.all(16.0)
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
    );
  }
}
