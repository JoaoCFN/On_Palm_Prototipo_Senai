import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class pagina_sobre extends StatefulWidget {
  @override
  _pagina_sobreState createState() => _pagina_sobreState();
}

class _pagina_sobreState extends State<pagina_sobre> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("SOBRE"),
          centerTitle: true,


        ),

        // FAZER COM QUE A TELA ROLE COM O TECLADO ATIVO

        body:  SingleChildScrollView(
          // ADICIONAR ESPAÇAMENTO NAS BORDAS DO TXT BOX
          padding: EdgeInsets.all(10.0),
          child: Column(
            // FILHO DO WIDGET
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(

                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(

                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("imagens/logo.jpeg"),
                    ),
                  ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Text ("NOME: ON PALM", style: TextStyle(
                    fontSize: 24.0
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text ("VERSÃO: v0.1", style: TextStyle(
                    fontSize: 24.0
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text ("ESTADO: PROTÓTIPO", style: TextStyle(
                    fontSize: 24.0
                ),),
              ),


            ],


          ),
        )
    );
  }


}
