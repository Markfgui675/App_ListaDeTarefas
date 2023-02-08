import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Tarefas'),
        backgroundColor: Colors.purple,
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[

          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*floatingActionButton: FloatingActionButton(onPressed: (){print('Pressionado');}, backgroundColor: Colors.purple,
                            elevation: 6,
                            child: Icon(Icons.add),),

       */
      floatingActionButton: FloatingActionButton.extended(onPressed: (){print('Pressionado');}, backgroundColor: Colors.purple,
        elevation: 6,
        icon: Icon(Icons.add),
        label: Text('Adicionar Tarefa'),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),),

      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
