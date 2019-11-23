import 'package:flutter/material.dart';

class pagina_passagens extends StatefulWidget {
  @override
  _pagina_passagensState createState() => _pagina_passagensState();
}

class _pagina_passagensState extends State<pagina_passagens> {
  // CONTROLADORES PARA RECUPERAR O TEXTO DAS CAIXAS
  TextEditingController reaiscontroller = TextEditingController();
  TextEditingController qts_passcontroller = TextEditingController();


  String resultado_passagens = "";

  // FUNÇÃO QUE FAZ TEXT FIELD PRA GENTE
  Widget buildTextFiled(String label, TextEditingController passagem){

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
      controller: passagem,
    );

  }

  void limpatexto(){
    setState(() {
      reaiscontroller.text = "";
      qts_passcontroller.text = "";

      resultado_passagens = "";
    });

  }

  void _calculopassagens(){
    double reais = double.parse(reaiscontroller.text);
    double qts_passagens_nodia = double.parse(qts_passcontroller.text);

    double qtstotal_passagens = reais / 1.80;

    double qtspassagens = qtstotal_passagens / qts_passagens_nodia;
    int qtspassagens_format = qtspassagens.toInt();

    setState(() {
      resultado_passagens = "Você tem passagens o suficiente para " + qtspassagens_format.toString() + " dias completos";

    });

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("PASSAGENS"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed:(){
              limpatexto();
            },)
          ],
        ),


        // FAZER COM QUE A TELA ROLE COM O TECLADO ATIVO
        body: SingleChildScrollView(
          // ADICIONAR ESPAÇAMENTO NAS BORDAS DO TXT BOX
          padding: EdgeInsets.all(10.0),
          child: Column(
            // FILHO DO WIDGET
            children: <Widget>[

              // CHAMEI A FUNÇÃO DE CRIAR TXT BOX E PREENCHI O TEXTO DE FUNDO
              buildTextFiled("Quantos reais você vai colocar", reaiscontroller),
              Divider(),
              buildTextFiled("Passagens gastas no dia a dia", qts_passcontroller),
              Divider(),

              // CRIEI UM BOTÃO
              // O CONTAINER POSSIBILITA COLOCAR TAMANHO NO BOTÃO
              // RAIDESBUTTON = BOTÃO

              Padding(
                // PADDING = MARGEM
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(

                  height: 50.0,
                  child: RaisedButton(
                      child: Text("Quantas de passagens", style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'arial'),),
                      onPressed: (){
                        _calculopassagens();
                      },
                      color: Colors.blue
                  ),
                ),
              ),

              Padding(
                // MARGEM
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(resultado_passagens, style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'arial'),
                  textAlign: TextAlign.center,
                ),
              )





            ],

          ),
        )

    );
  }
}
