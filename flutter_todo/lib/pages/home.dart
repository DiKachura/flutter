import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userToDO='';
  List todoList = [];
  
  @override
  void initState() {
    super.initState();
    
    todoList.addAll(['Купить молоко', 'Помыть посуду', 'Купить картошку']);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
                key: Key(todoList[index]), 
                child: Card(
                  child: ListTile(title: Text(todoList[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.deepOrangeAccent,
                    ), onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                  ),),
                ),
                onDismissed: (direction){
                  //if(direction == DismissDirection.endToStart)
                    setState(() {
                      todoList.removeAt(index);
                    });
            },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value){
                  _userToDO = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    todoList.add(_userToDO);
                  });
                  Navigator.of(context).pop();
                },
                    child: Text('Добавить'))
              ],
            );
          });
        },
        child: Icon(Icons.add_box, color: Colors.white,),
      ),
    );
  }
}