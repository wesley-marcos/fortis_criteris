import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:flutter/material.dart';
import '../basic_templates/app_text_styles.dart';

class InputNotes extends StatefulWidget {
  InputNotes({Key? key, required this.criterios, required this.alternativas}) : super(key: key);

  final int criterios;
  final int alternativas;
  List<Widget> opcoes = <Widget>[];
  List<int> colunas = [];

  @override
  State<InputNotes> createState() => _InputNotesState();
}

class _InputNotesState extends State<InputNotes> {

  final double borderRadius = 5;
  final double headerHeight = 85;
  InputNotes n = new InputNotes(criterios: 0, alternativas: 0,);

  final _nota = TextEditingController();
  //final _alternativas_controller = TextEditingController();
  int nota = 0;
  List<int> notas = [];
  int alternativas = 5;

  //Função que salvará a variável e a passará para a próxima tela
  void Salvar(){

    setState((){

      nota = int.parse(_nota.text);

      if(nota < 1 || nota > 10){
        aviso(context);
      }

      else{
        notas.add(nota);

      }

      //alternativas = int.parse(_alternativas_controller.text);

      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => InputNotes(criterios: criterio, alternativas: alternativas,)));
    });
  }


  Container cards(int q){

    return Container(
          color: Colors.green,
          padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Option 1",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),

              SizedBox(height: 20),

              TextFormField(
                onEditingComplete: Salvar,
                controller: _nota,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Note",
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),

              Text("Inputed note is ${notas}")
            ],
          )
      );


  }

  var _note;
  void _update_note(val){
    setState((){
      _note = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entrada de Notas",
          style: TextStyle(
            fontSize:25
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.dodgerBlue,
      ),
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [

                  Text("Critério ${widget.criterios}", style: AppTextStyles.title),

                  cards(widget.alternativas),

                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      children: widget.opcoes
                          .map((e) => cards(widget.alternativas)).toList(),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}

void aviso (BuildContext context){

  var alertDialog = AlertDialog(
    title: Text("Uma mensagem foi enviada com sucesso"),

  );

  showDialog(
      context: context,
      builder: (BuildContext context){

        Future.delayed(Duration(seconds: 2), () {

        });

        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          insetAnimationDuration: Duration(seconds: 1),
          child: Container(
            height: 200.0,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Entre com uma nota de 1 a 10!',
                      style: AppTextStyles.heading15
                  ),

                ],
              ),
            ),
          ),
        );
      }
  );
}

// void test(int q){
//
//   int i = 0;
//
//   while(i < q){
//     cards();
//   }
// }
