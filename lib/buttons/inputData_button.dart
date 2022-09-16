import 'package:fetin_2022/api/resultData.dart';
import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/screens/home.dart';
import 'package:fetin_2022/screens/inputMxN.dart';
import 'package:fetin_2022/screens/inputNotes.dart';
import 'package:fetin_2022/screens/start_screen.dart';
import 'package:flutter/material.dart';

class InputDataButton extends StatelessWidget {
  const InputDataButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            colors: [
              //AppColors.cornflowerBlue,
              //AppColors.dodgerBlue,
              AppColors.DeepSkyBlue,
              AppColors.LightSkyBlue,
              AppColors.SkyBlue,

            ],
            //begin: Alignment.topCenter,
            //end: Alignment.bottomCenter,
          )


      ),

      width: 50,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppColors.cornflowerBlue,
            elevation: 10,
            fixedSize: Size(100, 50),
            side: BorderSide(color: Colors.black12),
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              //RoundedRectangleBorder
            )
        ),
        onPressed: (){
         Navigator.push(context,
             MaterialPageRoute(builder: (context) => InputMxN()));
        },
        child: const Text(
          "Entrada de Dados",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )


      // ElevatedButton(
      //   child: const Text(
      //     "Input Data",
      //     style: TextStyle(
      //         fontSize: 20,
      //         color: Colors.white,
      //         fontWeight: FontWeight.bold
      //     ),
      //   ),
      //   onPressed: (){
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => InputMxN()));
      //   },
      // ),

    );
  }
}
