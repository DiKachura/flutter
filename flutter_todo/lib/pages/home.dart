import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userToDO='';
  List todoList = [];

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
  
  @override
  void initState() {
    super.initState();

    initFirebase();
    
    todoList.addAll(['Купить молоко', 'Помыть посуду', 'Купить картошку']);
  }

  void _menuOpen(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
          return Scaffold(
            appBar: AppBar(title: Text('Меню'),),
            body: Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                }, child: Text('На главную')),
                Padding(padding: EdgeInsets.only(left: 15)),
                Text('Наше просте меню'),
              ],
            ),
          );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: _menuOpen,
          )
        ],
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
                  FirebaseFirestore.instance.collection('items').add({'item':_userToDO});
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
