
import 'package:fetin_2022/screens/inputNotes.dart';
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
      alternativas = int.parse(_alternativas_controller.text);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InputNotes(criterios: criterio, alternativas: alternativas,)));
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
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
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
             decoration: const InputDecoration(
               labelText: "Número de Critérios",
               labelStyle: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w400,
                   fontSize: 20
               ),
               suffixIcon: Icon(Icons.info_outline_rounded, color: Colors.black),
             ),
           ),

           const SizedBox(
             width: 20,
             height: 100,
           ),

           TextFormField(
             controller: _alternativas_controller,
             keyboardType: TextInputType.phone,
             decoration: const InputDecoration(
               labelText: "Número de Alternativas",
               labelStyle: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w400,
                   fontSize: 20
               ),
               suffixIcon: Icon(Icons.info_outline_rounded, color: Colors.black),
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

 // OutlinedButton mxnButton (BuildContext context){
 //   return OutlinedButton(
 //     style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
 //       onPressed: (){
 //         Navigator.push(context,
 //             MaterialPageRoute(builder: (context){
 //           return const InputNotes(criterios: _criterio_controller.text, alternativas: 'alternativas',)));
 //       },
 //     child: child)
 // }

// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
//
// ),
//
// width: 50,
// height: 50,
// child: ElevatedButton(
// child: const Text(
// "Historic",
// style: TextStyle(
// fontSize: 20,
// color: Colors.white,
// fontWeight: FontWeight.bold
// ),
// ),
// onPressed: (){
// Navigator.push(context,
// MaterialPageRoute(builder: (context){
// return const InputNotes(criterios: _criterio_controller.text, alternativas: 'alternativas',)));
// },
// ),
//
// );
