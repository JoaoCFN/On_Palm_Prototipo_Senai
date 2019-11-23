import 'package:flutter/material.dart';
import 'package:onpalm_v1/tela_inicial.dart';

class novo_grupo extends StatefulWidget {
  @override
  _novo_grupoState createState() => _novo_grupoState();
}

class _novo_grupoState extends State<novo_grupo> {

  Future<String> createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Preencha os dados"),

        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("OK"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }

  // CONTROLADORES PARA RECUPERAR O TEXTO DAS CAIXAS
  // INST É INSTITUIÇÃO
  TextEditingController instcontroller = TextEditingController();
  TextEditingController cursocontroller = TextEditingController();
  TextEditingController modalidadecontroller = TextEditingController();
  TextEditingController duracaocontroller = TextEditingController();


  // FUNÇÃO QUE FAZ TEXT FIELD PRA GENTE
  Widget buildTextFiled(String label, TextEditingController grupo){

    return TextField(
      decoration: InputDecoration(
        // TEXTO PADRÃO QUE FICA DENTRO DA TEXTBOX
          labelText: label, labelStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'arial'),
          border: OutlineInputBorder()
      ),
      // ESTILO DO TEXTO QUE SERÁ DIGITADO
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      // MUDAR ESTILO DO TECLADO PARA NÚMERO

      controller: grupo,
      // DEIXAR A PARTE DE SENHA INVISÍVEL
    );

  }

  void limpatexto(){
    setState(() {
      instcontroller.text = "";
      cursocontroller.text = "";
      modalidadecontroller.text = "";
      duracaocontroller.text = "";

    });

  }


  void criar_grupo(){
    String inst = instcontroller.text;
    String curso = cursocontroller.text;
    String modalidade = modalidadecontroller.text;
    String duracao = duracaocontroller.text;

    if (instcontroller.text.isNotEmpty && cursocontroller.text.isNotEmpty && modalidadecontroller.text.isNotEmpty && duracaocontroller.text.isNotEmpty) {
      Navigator.push(context, new MaterialPageRoute(
          builder: (BuildContext context) => new tela_inicial())
      );
    }
    else{
        createAlertDialog(context);
    }


  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Novo grupo"),
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
              //Icon(Icons.people_outline, color: Colors.blue, size: 100.0,),
              Divider(),
              // CHAMEI A FUNÇÃO DE CRIAR TXT BOX E PREENCHI O TEXTO DE FUNDO
              buildTextFiled("Instituição", instcontroller),
              Divider(),
              buildTextFiled("Curso", cursocontroller),
              Divider(),
              buildTextFiled("Modalidade", modalidadecontroller),
              Divider(),
              buildTextFiled("Duração", duracaocontroller),

              // CRIEI UM BOTÃO
              // O CONTAINER POSSIBILITA COLOCAR TAMANHO NO BOTÃO
              // RAIDESBUTTON = BOTÃO

              Padding(
                // PADDING = MARGEM
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(

                  height: 50.0,
                  child: RaisedButton(
                      child: Text("Criar grupo", style: TextStyle(color: Colors.black, fontSize: 25.0, fontFamily: 'arial'),),
                      onPressed: (){
                          criar_grupo();
                      },
                      color: Colors.blue
                  ),
                ),
              ),



            ],


          ),
        )
    );
  }



}
