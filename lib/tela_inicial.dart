import 'package:flutter/material.dart';

import './pagina_frequencia.dart';

import './pagina_passagens.dart';

import './pagina_media.dart';

import './pagina_sobre.dart';


class tela_inicial extends StatefulWidget {
  @override
  _tela_inicialState createState() => _tela_inicialState();
}

class _tela_inicialState extends State<tela_inicial> {
  // CONTROLADORES PARA RECUPERAR O TEXTO DAS CAIXAS
  TextEditingController logincontroller = TextEditingController();
  TextEditingController senhacontroller = TextEditingController();
  String resultadologin = "";

  // FUNÇÃO QUE FAZ TEXT FIELD PRA GENTE
  Widget buildTextFiled(String label, TextEditingController login){

    return TextField(
      decoration: InputDecoration(
        // TEXTO PADRÃO QUE FICA DENTRO DA TEXTBOX
          labelText: label, labelStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'arial'),
          border: OutlineInputBorder()
      ),
      // ESTILO DO TEXTO QUE SERÁ DIGITADO
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      // MUDAR ESTILO DO TECLADO PARA NÚMERO
      keyboardType: TextInputType.number,
      controller: login,
    );

  }

  void limpatexto(){
    setState(() {
      logincontroller.text = "";
      senhacontroller.text = "";
      resultadologin = "";
    });

  }

  void _testelogin(){
    double nota1 = double.parse(logincontroller.text);
    double nota2 = double.parse(senhacontroller.text);


    setState(() {


    });

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Seja Bem Vindo"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed:(){
              limpatexto();
            },)
          ],
        ),

        // CRIAR MENU LATERAL
        drawer: new Drawer(
          child: new ListView(
              children: <Widget>[
                // Área do usuário dentro de menu
                new UserAccountsDrawerHeader(
                    accountName: new Text("Olá! Use as funções do nosso APP"),
                    accountEmail: new Text("On Palm"),
                    currentAccountPicture: new GestureDetector(
                      child: new CircleAvatar(
                        backgroundImage: AssetImage("imagens/logo.jpeg"),
                      ),
                    ),
                ),
                new ListTile(
                  title: new Text("FREQUÊNCIA"),
                  // trailing coloca um icone na função do app
                  trailing: new Icon(Icons.functions),
                  // On tap faz com que ao clicar uma função seja realizada
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder : (BuildContext context) => new pagina_frequencia())
                    );
                  },
                ),
                Divider(),
                new ListTile(
                  title: new Text("PASSAGENS"),
                  trailing: new Icon(Icons.directions_bus),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => new pagina_passagens()
                    )
                    );
                  },
                ),
                Divider(),
                new ListTile(
                  title: new Text("MÉDIA"),
                  // trailing coloca um icone na função do app
                  trailing: new Icon(Icons.bookmark),
                  // On tap faz com que ao clicar uma função seja realizada
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => new pagina_media()
                    )
                    );
                  },
                ),
                Divider(),
                new ListTile(
                  title: new Text("SOBRE"),
                  // trailing coloca um icone na função do app
                  trailing: new Icon(Icons.info),
                  // On tap faz com que ao clicar uma função seja realizada
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => new pagina_sobre()
                    )
                    );
                  },
                ),
                Divider(),
                new ListTile(
                  title: new Text("FECHAR MENU"),
                  // trailing coloca um icone na função do app
                  trailing: new Icon(Icons.cancel),
                  // On tap faz com que ao clicar uma função seja realizada
                  onTap: () => Navigator.of(context).pop(),
                ),

              ]
          ),
        ),
        // FAZER COM QUE A TELA ROLE COM O TECLADO ATIVO

        body: SingleChildScrollView(

          child: Column(
            // FILHO DO WIDGET
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Container(

                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(

                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("imagens/senai.png"),
                    ),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text ("PROJETO:", style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,



                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                child: Text ("INOVAÇÃO E EMPREENDORISMO", style: TextStyle(
                    fontSize: 19.0

                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                child: Text ("DESENVOLVIMENTO DE SISTEMAS", style: TextStyle(

                    fontSize: 19.0
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                child: Text ("SENAI 2019.2", style: TextStyle(
                    fontSize: 19.0,


                ),),
              ),


            ],

          ),
        )
    );
  }


}
