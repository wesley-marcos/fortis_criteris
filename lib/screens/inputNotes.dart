import 'package:fetin_2022/api/dataModel.dart';
import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/screens/inputMxN.dart';
import 'package:flutter/material.dart';
import '../basic_templates/app_text_styles.dart';

class InputNotes extends StatefulWidget {
  InputNotes({Key? key, required this.criterios, required this.alternativas,
    required this.nomes}) : super(key: key);

  int criterios;
  int alternativas;
  List<String> nomes = <String>[];

  List<String> colunas = [];

  @override
  State<InputNotes> createState() => _InputNotesState();
}

class _InputNotesState extends State<InputNotes> {

  final double borderRadius = 5;
  final double headerHeight = 85;
  //InputNotes n = new InputNotes(criterios: 0, alternativas: 0,);

  final _nota = TextEditingController();

  //final _alternativas_controller = TextEditingController();
  int nota = 0;
  List<int> notas = [];
  List<int> notas_aux = [];
  int alternativas = 3;

  //Função que salvará a variável e a passará para a próxima tela
  void Salvar() {
    setState(() {
      nota = int.parse(_nota.text);

      if (nota < 1 || nota > 10) {
        aviso(context);
      }

      else {
        notas_aux.add(nota);
      }

      //alternativas = int.parse(_alternativas_controller.text);

      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => InputNotes(criterios: criterio, alternativas: alternativas,)));
    });
  }

  Container cards(int q) {

    int i = 1;
    int val = widget.nomes.length;

    return Container(
        color: AppColors.darkBlue,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            //for(i = 0; i <= val - 1; i++)
            Container(
              //height: 700,
              child: Center(
                child: Column(
                  children: [

                    Text(
                      "Opção ${q+1}",
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
                        labelText: "  Nota",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),

                    Text("Entrada é ${notas}")

                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  // var _note;
  //
  // void _update_note(val) {
  //   setState(() {
  //     _note = val;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    var opcoes = new List<int>.generate(widget.alternativas, (i) => i + 1);
    int i = 1;

    Expanded inputCounter() {
      return Expanded(
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          children: opcoes.map((e) => cards(i)).toList(),
        ),
      );
    }

    Future<bool?> confirmarVoltar() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Atenção!!!"),
            content: const Text("Se você sair desta tela todos os dados inseridos"
                "serão perdidos"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Ficar"),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Sair"),
              ),
            ],
          );
        },
      );
    }

    //double height_1 = String(widget.alternativas);
    var height = double.parse('${widget.alternativas}');
    height = height * 130;

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Entrada de Notas",
              style: TextStyle(
                  fontSize: 25
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColors.dodgerBlue,

          ),
          body: Container( //Tela grande
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Images/fundo.png"),
                    fit: BoxFit.cover
                )
            ),
            padding: EdgeInsets.only(top: 5),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView( //Scroll Principal
                  children: [
                    for(i = 0; i < widget.criterios; i++)
                      Container( //Caixa maldita
                          height: height,
                          child: Center(
                            child: Column(
                              //physics: NeverScrollableScrollPhysics(),
                              //mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(height: 30,),
                                Text("Critério: ${widget.nomes[i]}",
                                    style: AppTextStyles.title2),

                                inputCounter(),
                              ],
                            ),
                          )
                      ),
                  ],
                )
            ),
          ),
        ),

        onWillPop: () async {
        final voltar = await confirmarVoltar();

        return voltar ?? false;
      },
    );
  }
}

void aviso(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("Uma mensagem foi enviada com sucesso"),

  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
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