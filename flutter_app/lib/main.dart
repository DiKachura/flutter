import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text('DiKachura App'),
          centerTitle: true,
        ),
        body: Center(
          child: Image(
            image: AssetImage('assets/Altai-.jpg'),
          ),
          //child: Icon(Icons.settings_rounded, size: 45,)
          // child: ElevatedButton.icon(
          //   onPressed: () {},
          //   icon: Icon(Icons.access_alarm),
          //     label: Text('Press'),
          // )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { print('clicked'); },
          child: Text('Нажми'),
          backgroundColor: Colors.deepOrangeAccent,

        ),
      )
    );
  }
}

