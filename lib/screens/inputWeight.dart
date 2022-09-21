import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/basic_templates/app_text_styles.dart';
import 'package:fetin_2022/screens/inputNotes.dart';
import 'package:flutter/material.dart';

class InputWeight extends StatefulWidget {
  InputWeight({Key? key, required this.criterios, required this.alternativas})
      : super(key: key);

  int criterios;
  int alternativas;


  @override
  State<InputWeight> createState() => _InputWeightState();
}

class _InputWeightState extends State<InputWeight> {

  final _nomes_controller = TextEditingController();
  final _pesos_controller = TextEditingController();
  List<String> nomes_criterios = <String>[];
  List<double> pesos_criterios = <double>[];
  String nome = '';
  double peso = 0;

  void Salvar() {
    setState(() {
      nome = '${_nomes_controller.text}';
      peso = double.parse(_pesos_controller.text);

      nomes_criterios.add(nome);
      pesos_criterios.add(peso);
    });
  }

  void TrocaTela() {
    setState(() {
      if (nomes_criterios.length < widget.criterios &&
          pesos_criterios.length < widget.criterios) {
        aviso(context);
      }

      else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                InputNotes(
                  criterios: widget.criterios,
                  alternativas: widget.alternativas,
                  nomes: nomes_criterios,
                  pesos: pesos_criterios,)));
      }
    });
  }

  Container cards() {
    int i = 1;

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE0FFFF),
                AppColors.DeepSkyBlue
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        //color: AppColors.darkBlue,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 20),

              TextFormField(
                onEditingComplete: Salvar,
                controller: _nomes_controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Nome do critério ",
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20
                  ),
                ),
              ),

              SizedBox(height: 20),

              TextFormField(
                onEditingComplete: Salvar,
                controller: _pesos_controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso",
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Future<bool?> confirmarVoltar() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Atenção!!!"),
          content: const Text("Se você sair desta tela todos os nomes inseridos"
              " serão perdidos!"),
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

  int i = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Entrada de Dados",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: AppColors.dodgerBlue,
        ),
        body: Container( //Tela grande
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.DeepSkyBlue,
                  AppColors.LightSkyBlue,
                  AppColors.lightBlue,

                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
          ),
          padding: EdgeInsets.only(top: 5),
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView( //Scroll Principal
                padding: EdgeInsets.all(8),
                children: [
                  for(i = 1; i <= widget.criterios; i++)
                    Container( //Caixa maldita
                      //height: height,
                        child: Center(
                          child: Column(
                            //physics: NeverScrollableScrollPhysics(),
                            //mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(height: 30,),
                              Text("Critério ${i}",
                                  style: AppTextStyles.title),

                              cards()
                            ],
                          ),
                        )
                    ),

                  const SizedBox(
                    width: 20,
                    height: 50,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        //splashFactory: NoSplash.splashFactory,
                        elevation: 10,
                        fixedSize: Size(100, 50),
                        side: BorderSide(color: Colors.black12),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          //RoundedRectangleBorder
                        )
                    ),
                    onPressed: TrocaTela,
                    child: const Text(
                      "Próximo",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                  //()
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

Future aviso(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Atenção!!!"),
        content: const Text("Você deve entrar com todos os valores"),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("ok"),
          ),
        ],
      );
    },
  );
}