import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/basic_templates/app_text_styles.dart';
import 'package:fetin_2022/buttons/inputData_button.dart';
import 'package:fetin_2022/widgets/language_selector.dart';
import 'package:flutter/material.dart';

import '../buttons/historic_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage("Images/fundo.png"),
            //     fit: BoxFit.cover
            // )
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
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          alignment: Alignment.center,
        child: ListView(
          children: [
            //Language(),

            const SizedBox(
              width: 20,
              height: 20,
            ),


            Container(
              alignment: Alignment.center,
              child: Text("Bem vindo!",
                style: AppTextStyles.title,
              ),
            ),

            const SizedBox(
              width: 20,
              height: 20,
            ),

            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("Images/man_profile.png", alignment: Alignment.center),
            ),

            const SizedBox(
              width: 20,
              height: 100,
            ),

            InputDataButton(),

            const SizedBox(
              width: 20,
              height: 40,
            ),

            HistoricButton(),
          ],
        ),
      )
    );
  }
}
