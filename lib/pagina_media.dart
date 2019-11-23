import 'package:flutter/material.dart';

class pagina_media extends StatefulWidget {
  @override
  _pagina_mediaState createState() => _pagina_mediaState();
}

class _pagina_mediaState extends State<pagina_media> {
  // CONTROLADORES PARA RECUPERAR O TEXTO DAS CAIXAS
  TextEditingController nota1controller = TextEditingController();
  TextEditingController nota2controller = TextEditingController();
  TextEditingController nota3controller = TextEditingController();

  String resultadofinal = "";

  // FUNÇÃO QUE FAZ TEXT FIELD PRA GENTE
  Widget buildTextFiled(String label, TextEditingController notas){

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
      controller: notas,
    );

  }

  void limpatexto(){
    setState(() {
      nota1controller.text = "";
      nota2controller.text = "";
      nota3controller.text = "";
      resultadofinal = "";
    });

  }

  void _calculomedia(){
    double nota1 = double.parse(nota1controller.text);
    double nota2 = double.parse(nota2controller.text);
    double nota3 = double.parse(nota3controller.text);
    double media;

    media = (nota1 + nota2 + nota3)/3;

    setState(() {
      if (media >= 7){
        resultadofinal = "Parabéns você foi aprovado na disciplina com média: " + (media.toStringAsPrecision(2));
      }
      else if (media < 7 && media > 3){
        resultadofinal = "Você ficou na final com média: " + (media.toStringAsPrecision(2));
      }
      else if (media < 3){
        resultadofinal = "Você foi reprovado na disciplina com média " + (media.toStringAsPrecision(2));
      }

    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("MÉDIA"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed:(){
            limpatexto();
          },)
          ],
        ),


        body: SingleChildScrollView(
          // ADICIONAR ESPAÇAMENTO NAS BORDAS DO TXT BOX
          padding: EdgeInsets.all(10.0),
          child: Column(
            // FILHO DO WIDGET
            children: <Widget>[

              // CHAMEI A FUNÇÃO DE CRIAR TXT BOX E PREENCHI O TEXTO DE FUNDO
              buildTextFiled("Primeira Nota", nota1controller),
              Divider(),
              buildTextFiled("Segunda Nota", nota2controller),
              Divider(),
              buildTextFiled("Terceira Nota", nota3controller),
              // CRIEI UM BOTÃO
              // O CONTAINER POSSIBILITA COLOCAR TAMANHO NO BOTÃO
              // RAIDESBUTTON = BOTÃO

              Padding(
                // PADDING = MARGEM
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(

                  height: 50.0,
                  child: RaisedButton(
                      child: Text("Calcule a média", style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'arial'),),
                      onPressed: (){
                        _calculomedia();
                      },
                      color: Colors.blue
                  ),
                ),
              ),

              Padding(
                // MARGEM
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(resultadofinal, style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'arial'),
                  textAlign: TextAlign.center,
                ),
              )





            ],

          ),
        )



    );
  }
}
