import 'package:flutter/material.dart';

import 'package:onpalm_v1/novo_usuario.dart';

import 'package:onpalm_v1/tela_inicial.dart';

import './pagina_frequencia.dart';

import './pagina_passagens.dart';

import './pagina_media.dart';

import './pre_inicial.dart';

class novo_usuario extends StatefulWidget {
  @override
  _novo_usuarioState createState() => _novo_usuarioState();
}

class _novo_usuarioState extends State<novo_usuario> {
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
      //label == "Senha"? true: keyboardType: TextInputType.number,
      controller: login,
      // DEIXAR A PARTE DE SENHA INVISÍVEL
      obscureText: label == "Digite sua senha" ? true: false,
    );

  }

  void limpatexto(){
    setState(() {
      logincontroller.text = "";
      senhacontroller.text = "";
      resultadologin = "";
    });

  }

  void testelogin(){
    String email = logincontroller.text;
    double senha = double.parse(senhacontroller.text);


    setState(() {

      if (email == "joaoneto@hotmail.com" && senha == 123456){
        Navigator.push(context, new MaterialPageRoute(
            builder: (BuildContext context) => new tela_inicial()
        )
        );

      }
      else if (email == "henriquebisneto@hotmail.com" && senha == 123456789){
        Navigator.push(context, new MaterialPageRoute(
            builder: (BuildContext context) => new pre_inicial()
        )
        );
      }
      else {

        Navigator.push(context, new MaterialPageRoute(
            builder: (BuildContext context) => new pre_inicial()
        )
        );


      }
    });
  }

  void cria_usuario(){
    Navigator.push(context, new MaterialPageRoute(
        builder : (BuildContext context) => new novo_usuario())
    );

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Crie uma conta"),
          centerTitle: true,

          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed:(){
              limpatexto();
            },),


          ],
        ),

        // FAZER COM QUE A TELA ROLE COM O TECLADO ATIVO

        body:  SingleChildScrollView(

          // ADICIONAR ESPAÇAMENTO NAS BORDAS DO TXT BOX
          padding: EdgeInsets.all(10.0),
          child: Column(
            // FILHO DO WIDGET
            children: <Widget>[
              // Ícone de usuário
              Icon(Icons.group_add, color: Colors.blue, size: 100.0,),
              Divider(),
              // CHAMEI A FUNÇÃO DE CRIAR TXT BOX E PREENCHI O TEXTO DE FUNDO
              buildTextFiled("Digite seu email", logincontroller),
              Divider(),
              buildTextFiled("Digite sua senha", senhacontroller),

              // CRIEI UM BOTÃO
              // O CONTAINER POSSIBILITA COLOCAR TAMANHO NO BOTÃO
              // RAIDESBUTTON = BOTÃO

              Padding(
                // PADDING = MARGEM
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(

                  height: 50.0,
                  child: RaisedButton(
                      child: Text("Criar Conta", style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'arial'),),
                      onPressed: (){

                        testelogin();
                      },
                      color: Colors.blue
                  ),
                ),
              ),

              Padding(
                // MARGEM
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(resultadologin, style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'arial'),
                  textAlign: TextAlign.center,
                ),
              ),

            ],


          ),
        )
    );
  }



}
