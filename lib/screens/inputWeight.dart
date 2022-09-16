import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/basic_templates/app_text_styles.dart';
import 'package:fetin_2022/screens/inputNotes.dart';
import 'package:flutter/material.dart';

class InputWeight extends StatefulWidget {
  InputWeight({Key? key,  required this.criterios, required this.alternativas}) : super(key: key);

  int criterios;
  int alternativas;



  @override
  State<InputWeight> createState() => _InputWeightState();
}

class _InputWeightState extends State<InputWeight> {

  final _nomes_controller = TextEditingController();
  List<String> nomes_criterios = <String>[];
  String nome = '';

  void Salvar(){

    setState((){

      nome = '${_nomes_controller.text}';
      nomes_criterios.add(nome);
      print(nomes_criterios);

      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => InputNotes(
      //       criterios: widget.criterios,
      //       alternativas: widget.alternativas,
      //       nomes: [],)));
    });
  }

  void TrocaTela(){

    setState((){

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InputNotes(
            criterios: widget.criterios,
            alternativas: widget.alternativas,
            nomes: nomes_criterios,)));
    });
  }

  Container cards() {

    int i = 1;

    return Container(
        color: AppColors.darkBlue,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [

              Text(
                "Option ${i}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),

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

              Text("Inputed note is ${nomes_criterios}")

            ],
          ),
        )
    );
  }

  int i = 1;
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
                  height: 100,
                ),

                ElevatedButton(
                  onPressed: TrocaTela,
                  child: const Text(
                    "Próximo",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                //()
              ],
            )
        ),
      ),

    );
  }
}
