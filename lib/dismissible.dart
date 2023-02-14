import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dism extends StatefulWidget {
  const Dism({Key? key}) : super(key: key);

  @override
  State<Dism> createState() => _DismState();
}

class _DismState extends State<Dism> {

  List _lista = ["Jamilton","Maria","João","Carla"];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Widgets'),
        centerTitle: true,
      ),
      
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Expanded(child: ListView.builder(
                itemCount: _lista.length,
                itemBuilder: (context, index){

                  final item = _lista[index];

                  return Dismissible(
                      direction: DismissDirection.horizontal,
                      background: Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.train, color: Colors.white,)
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        color: Colors.green,
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.edit, color: Colors.white,)
                          ],
                        ),
                      ),
                      onDismissed: (direction){
                        if(direction == DismissDirection.startToEnd){

                        } else if(direction == DismissDirection.endToStart){

                        }
                      },
                      key: Key(item),
                      child: ListTile(
                        title: Text(item),
                      )
                  );
                }
            )),
          ],
        ),
      ),
    );
  }
}

