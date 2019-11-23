import 'package:flutter/material.dart';

class pagina_frequencia extends StatefulWidget {

  @override
  _pagina_frequenciaState createState() => _pagina_frequenciaState();
}

class _pagina_frequenciaState extends State<pagina_frequencia> {
  // CONTROLADORES PARA RECUPERAR O TEXTO DAS CAIXAS
  TextEditingController qts_horascontroller = TextEditingController();
  TextEditingController qts_faltascontroller = TextEditingController();


  String resultado_frequencia = "";

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
      qts_horascontroller.text = "";
      qts_faltascontroller.text = "";

      resultado_frequencia = "";
    });

  }

  void _calculomedia(){
    double horas = double.parse(qts_horascontroller.text);
    double faltas = double.parse(qts_faltascontroller.text);

    double tothoras, totaula, limfaltas, qtstotalfaltas, ps;

    /*converte horas em aulas */
    tothoras = horas * 60;
    /* Total de aulas */
    totaula = tothoras / 50;

    limfaltas = (totaula*75)/100;

    /* Calcula a quantidade total de faltas para a matéria */
    qtstotalfaltas = (totaula - limfaltas);


    setState(() {
      if (faltas <= qtstotalfaltas){
        /* Possibilidades de falta - PS */
        ps = qtstotalfaltas - faltas;
        int ps_format = ps.toInt();

        //print("Tá de boa ainda \n");
        resultado_frequencia = "Você faltou " + faltas.toString() + " e ainda pode faltar " + ps_format.toString() + " vezes";

      }
      else {
        int qtstotalfaltas_format = qtstotalfaltas.toInt();
        resultado_frequencia = "Você faltou " + faltas.toString() + " e o limite de faltas da matéria " + qtstotalfaltas_format.toString() + " vezes";

      }


    });

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("FREQUÊNCIA"),
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
              buildTextFiled("Quantidade de Horas da disciplina", qts_horascontroller),
              Divider(),
              buildTextFiled("Quantidade de faltas", qts_faltascontroller),
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
                      child: Text("Calcule a frequência", style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'arial'),),
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
                child: Text(resultado_frequencia, style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'arial'),
                  textAlign: TextAlign.center,
                ),
              )





            ],

          ),
        )

    );
  }
}
