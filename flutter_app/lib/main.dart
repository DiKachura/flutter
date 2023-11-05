import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserPanel(),
  ));
}

class UserPanel extends StatefulWidget {
  const UserPanel({super.key});

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('User'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('Diana Kachura', style: TextStyle(
                fontSize: 25,
                color: Colors.white
              ),),
              Padding(padding: EdgeInsets.only(top: 20)),
              CircleAvatar(
                backgroundImage: AssetImage('assets/Altai-.jpg'),
                radius: 50,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Icon(Icons.mail_outline, size: 25, color: Colors.white,),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text('d1.princess@ya.ru', style: TextStyle(
                    color: Colors.white
                  ),)
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('Count: $_count', style: TextStyle(
                  color: Colors.white
              ),)

            ],
          )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
          backgroundColor: Colors.amber,
          onPressed: (){
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}
