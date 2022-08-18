import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/buttons/signup_button.dart';
import 'package:fetin_2022/buttons/signup_button_home.dart';
import 'package:flutter/material.dart';

import '../basic_templates/app_text_styles.dart';
import '../buttons/login_button.dart';
import '../buttons/login_button_home.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        alignment: Alignment.center,
        child: ListView(
          children: [
            const SizedBox(
              width: 20,
              height: 20,
            ),

            Container(
              alignment: Alignment.center,
              child: Text(
                  "Welcome",
                  style: AppTextStyles.title
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
              height: 120,
            ),


            const SizedBox(
              child: LoginButtonHome(),
            ),

            const SizedBox(
              height: 40,
            ),

            const SizedBox(
              child: SignUpButtonHome(),
            ),
          ],
        ),
      ),
    );
  }
}
