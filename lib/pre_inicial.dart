import 'package:flutter/material.dart';
import 'package:onpalm_v1/tela_inicial.dart';

import './novo_grupo.dart';

class pre_inicial extends StatefulWidget {
  @override
  _pre_inicialState createState() => _pre_inicialState();
}

class _pre_inicialState extends State<pre_inicial> {
  // FUNÇÃO CAIXA DE DIÁLOGO

  Future<String> createAlertDialog(BuildContext context){
    TextEditingController codigo_grupo_controller = TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Codigo do grupo"),
        content: TextField(
          controller: codigo_grupo_controller,

        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("Entrar"),
            onPressed: (){
                Navigator.of(context).pop(
                  codigo_grupo_controller.text.toString()
                );
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Escolha uma das opções"),
          centerTitle: true,

          actions: <Widget>[


          ],
        ),

        // FAZER COM QUE A TELA ROLE COM O TECLADO ATIVO

        body:  SingleChildScrollView(

          // ADICIONAR ESPAÇAMENTO NAS BORDAS DO TXT BOX
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            // FILHO DO WIDGET
            children: <Widget>[
              IconButton(icon: Icon(Icons.group_add),
                iconSize: 80.0,
                onPressed:(){
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new novo_grupo()
                  )
                  );
                },
                //color: Colors.blue,
              ),
              Text("Criar grupo", style: TextStyle(color: Colors.black, fontSize: 20.0)),
              Divider(),

              // Ícone de usuário
              IconButton(icon: Icon(Icons.group),

                iconSize: 80.0,
                onPressed:(){
                    createAlertDialog(context).then((onValue){
                      if (onValue == "123456"){
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (BuildContext context) => new tela_inicial()
                        )
                        );
                      }


                    });
                },
                //color: Colors.blue,
              ),
              Text("Participar de grupo", style: TextStyle(color: Colors.black, fontSize: 20.0)),
              Divider(),



              IconButton(icon: Icon(Icons.watch_later),
                iconSize: 70.0,
                onPressed:(){
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new tela_inicial()
                  )
                  );
                },
                //color: Colors.blue,
              ),
              Text("Fazer isso depois", style: TextStyle(color: Colors.black, fontSize: 20.0)),
              Divider(),
            ],


          ),
        )
    );
  }



}
