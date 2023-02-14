import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:app_listadetarefas/dismissible.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _tarefaUsuario = TextEditingController();
  List _listaTarefas = [];

  Future<File> _getFile() async {

    final diretorio = await getApplicationDocumentsDirectory();
    //print(diretorio.path.toString());
    return File('${diretorio.path}/dados.json');

  }

  _salvarTarefa() async {

    String textoDigitado = _tarefaUsuario.text;

    //Criar dados
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;

    setState((){
      _listaTarefas.add(tarefa);
    });
    _salvarArquivo();

    _tarefaUsuario.text = "";

  }

  _salvarArquivo() async {

    var arquivo = await _getFile();
    print(arquivo.toString());

    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);

  }

  _lerArquivo() async {

    try{
      final arquivo = await _getFile();
      return arquivo.readAsString();
    }catch(e){
      return null;
    }

  }

  Widget criarItemLista(contex, index){

    final item = _listaTarefas[index]['titulo'];

    return Dismissible(key: Key(item),
        onDismissed: (direction){
          _listaTarefas.removeAt(index);
          _salvarArquivo();
        },
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.all(16),
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.delete, color: Colors.white,)
            ],
          ),
        ),

        child: CheckboxListTile(value: _listaTarefas[index]["realizada"],
            activeColor: Colors.purpleAccent,
            title: Text(_listaTarefas[index]["titulo"]),
            onChanged: (bool? valor){
              setState(() {
                _listaTarefas[index]["realizada"] = valor!;
              });
              _salvarArquivo();
            })
    );
  }

  @override
  void initState() {
    _lerArquivo().then((dados){
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //print("itens: "+_listaTarefas.toString());
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
            Expanded(child: ListView.builder(
              itemBuilder: criarItemLista,
              itemCount: _listaTarefas.length,
            )),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*floatingActionButton: FloatingActionButton(onPressed: (){print('Pressionado');}, backgroundColor: Colors.purple,
                            elevation: 6,
                            child: Icon(Icons.add),),

       */
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showDialog(context: context,
              builder: (context){
                return AlertDialog(
                  title: Text('Adicionar tarefa'),
                  content: TextField(
                    decoration: InputDecoration( labelText: "Digite sua tarefa"),
                    controller: _tarefaUsuario,
                    onChanged: (text){},
                  ),
                  actions: <Widget>[
                    FloatingActionButton.large(
                      backgroundColor: Colors.purple,
                        onPressed: (){Navigator.pop(context);},
                        child: Text('Cancelar'),

                        shape: CircleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.purpleAccent
                          )
                        )
                    ),
                    FloatingActionButton.large(
                        backgroundColor: Colors.purple,
                        onPressed: (){
                          //salvar
                          _salvarTarefa();
                          Navigator.pop(context);
                        },
                        child: Text('Salvar'),

                        shape: CircleBorder(
                            side: BorderSide(
                                width: 1,
                                color: Colors.purpleAccent
                            )
                        )
                    )
                  ],
                );
              });
        },
        backgroundColor: Colors.purple,
        elevation: 6,
        icon: Icon(Icons.add),
        label: Text('Adicionar Tarefa'),
        /*
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        )*/


      ),

      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.add, color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
