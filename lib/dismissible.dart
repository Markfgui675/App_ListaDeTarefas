import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dism extends StatefulWidget {
  const Dism({Key? key}) : super(key: key);

  @override
  State<Dism> createState() => _DismState();
}

class _DismState extends State<Dism> {
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
            CheckboxListTile(value: null, onChanged: (bool? valor){}, )
          ],
        ),
      ),
    );
  }
}

