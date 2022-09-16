
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
  void Salvar(){

    setState((){

      criterio = int.parse(_criterio_controller.text);

      // if (criterio < 2 || criterio > 5) {
      //   aviso(context);
      // }

      alternativas = int.parse(_alternativas_controller.text);
      //
      // if (alternativas < 2 || alternativas > 5) {
      //   aviso(context);
      // }

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InputWeight(criterios: criterio,
            alternativas: alternativas,)));
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
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("Images/fundo.png"),
        //         fit: BoxFit.cover
        //     )
        // ),
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
         children: [
          const SizedBox(
            width: 20,
            height: 100,
          ),

           TextFormField(
             controller: _criterio_controller,
             keyboardType: TextInputType.phone,
             decoration: InputDecoration(
               labelText: "Número de Critérios",
               labelStyle: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w400,
                   fontSize: 20
               ),
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
                         TextButton(
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
             controller: _alternativas_controller,
             keyboardType: TextInputType.phone,
             decoration: InputDecoration(
               labelText: "Número de Alternativas",
               labelStyle: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w400,
                   fontSize: 20
               ),
               icon: IconButton(
                 onPressed: () {
                   showDialog(
                     context: context,
                     builder: (context) => AlertDialog(
                       title: const Text("Alternativas"),
                       content: Text("Aqui você deve entrar com a quantidade "
                           "de opções de escolha que você tem."),
                       actions: [
                         TextButton(
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
               onPressed: Salvar,
               child: const Text(
             "Próximo",
             style: TextStyle(
                 fontSize: 20,
                 color: Colors.white,
                 fontWeight: FontWeight.bold
             ),
           ),
           )
          ]
        ),
      ),

    );
  }
}

void aviso(BuildContext context) {
  // var alertDialog = AlertDialog(
  //   title: Text("Uma mensagem foi enviada com sucesso"),
  //
  // );

  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       Future.delayed(Duration(seconds: 2), () {
  //
  //       });
  //
  //       return Dialog(
  //         backgroundColor: Colors.white,
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20.0)
  //         ),
  //         insetAnimationDuration: Duration(seconds: 1),
  //         child: Container(
  //           height: 200.0,
  //           child: Padding(
  //             padding: EdgeInsets.all(25.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Text(
  //                     'Entre com uma nota de 1 a 10!',
  //                     style: AppTextStyles.heading15
  //                 ),
  //
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  // );

  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Atenção!!!"),
        content: const Text(
            "Entre com um valor entre 2 e 5."),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      )
  );

}
