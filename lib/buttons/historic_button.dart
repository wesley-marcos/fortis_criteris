import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/screens/historic.dart';
import 'package:fetin_2022/screens/home.dart';
import 'package:fetin_2022/screens/start_screen.dart';
import 'package:flutter/material.dart';

import '../api/resultData.dart';

class HistoricButton extends StatelessWidget {
  const HistoricButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

      ),

      width: 50,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppColors.steelBlue,
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
              MaterialPageRoute(builder: (context) => ResultData(value: 'value', option: 'option')));
        },
        child: const Text(
          "Histórico",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    );
  }
}
