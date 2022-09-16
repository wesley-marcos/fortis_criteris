import 'package:fetin_2022/basic_templates/app_text_styles.dart';
import 'package:fetin_2022/screens/inputNotes.dart';
import 'package:fetin_2022/screens/inputWeight.dart';
import 'package:flutter/material.dart';

import '../basic_templates/appColors.dart';

class InputMxN extends StatefulWidget {
  const InputMxN({Key? key}) : super(key: key);

  @override
  State<InputMxN> createState() => _InputMxNState();
}

class _InputMxNState extends State<InputMxN> {
  final _criterio_controller = TextEditingController();
  final _alternativas_controller = TextEditingController();
  int criterio = 0;
  int alternativas = 0;

  //Função que salvará a variável e a passará para a próxima tela
  void Salvar() {
    setState(() {
      criterio = int.parse(_criterio_controller.text);

      // if (criterio < 2 || criterio > 5) {
      //   aviso(context);
      // }

      alternativas = int.parse(_alternativas_controller.text);

      if ((criterio & alternativas < 2) || (criterio & alternativas > 10))
        aviso(context);
      else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InputWeight(
                      criterios: criterio,
                      alternativas: alternativas,
                    )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entrada de Dados",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: AppColors.dodgerBlue,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //AppColors.cornflowerBlue,
                //AppColors.dodgerBlue,
                AppColors.DeepSkyBlue,
                AppColors.LightSkyBlue,
                AppColors.SkyBlue,

              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )
        ),
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        alignment: Alignment.center,
        //color: Colors.white,
        child: ListView(children: [
          const SizedBox(
            width: 20,
            height: 100,
          ),
          TextFormField(
            onEditingComplete: Salvar,
            controller: _criterio_controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Número de Critérios",
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              icon: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Critérios"),
                      content: Text("Aqui você entra com o número de "
                          "critérios que você leva em consideração na hora "
                          "de tomar sua decisão."),
                      actions: [
                        OutlinedButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon:
                    const Icon(Icons.info_outline_rounded, color: Colors.black),
              ),

              //Icon(Icons.info_outline_rounded, color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 20,
            height: 100,
          ),
          TextFormField(
            onEditingComplete: Salvar,
            controller: _alternativas_controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Número de Alternativas",
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              icon: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Alternativas"),
                      content: Text("Aqui você deve entrar com a quantidade "
                          "de opções de escolha que você tem."),
                      actions: [
                        OutlinedButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon:
                    const Icon(Icons.info_outline_rounded, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.steelBlue,
              //splashFactory: NoSplash.splashFactory,
              elevation: 10,
              fixedSize: Size(100, 50),
              side: BorderSide(color: Colors.black12),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                    //RoundedRectangleBorder
                )
            ),
            onPressed: Salvar,
            child: const Text(
              "Próximo",
              style: TextStyle(
                  fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}

void aviso(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Atenção!!!"),
            content:
                const Text("Entre com um valor entre 2 e 5 nos DOIS CAMPOS."),
            actions: [
              OutlinedButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}
