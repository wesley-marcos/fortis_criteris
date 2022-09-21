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
    setState(
      () {
        criterio = int.parse(_criterio_controller.text);

        // if (criterio < 2 || criterio > 5) {
        //   aviso(context);
        // }

        alternativas = int.parse(_alternativas_controller.text);

        if ((criterio & alternativas < 2) || (criterio & alternativas > 5)) {
          aviso(context);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InputWeight(
                criterios: criterio,
                alternativas: alternativas,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
              AppColors.DeepSkyBlue,
              AppColors.LightSkyBlue,
              AppColors.lightBlue,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
          padding: EdgeInsets.only(top: 30, left: 30, right: 30),
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          //color: Colors.white,
          child: LayoutBuilder(
            builder: (_, constraints) {
              return ListView(children: [
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
                      icon: const Icon(Icons.info_outline_rounded,
                          color: Colors.black),
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
                            content:
                                Text("Aqui você deve entrar com a quantidade "
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
                      icon: const Icon(Icons.info_outline_rounded,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                  height: 100,
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
                          )),
                  onPressed: Salvar,
                  child: const Text(
                    "Próximo",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.black87,
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        child: AlertDialog(
                          title: const Text("Critérios e Alternativas"),
                          content: const Text(""
                              "Critério é toda informação que você acha "
                              "necessária na sua tomada de decisão. \n"
                              "Exemplo: ao comprar um computador, peças "
                              "como placa-mãe, CPU, RAM e SDD, são os "
                              "critério de compra, pois definem qual você "
                              "comprará, baseado nessas peças.\n\n"
                              "Alternativa é toda opção de compra que você "
                              "tem.\n"
                              "Exemplo: ao comprar um computador, você tem "
                              "3 opções, um da marca Acer, um da marca "
                              "Dell e outro da marca Apple. Essas são as "
                              "alterntivas de compra."),
                          //s: const Text(""),
                          actions: [
                            OutlinedButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Mais informações"),
                ),
              ]);
            },
          )),
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

Future aviso2(BuildContext context) {
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
