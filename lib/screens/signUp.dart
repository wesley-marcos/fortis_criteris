import 'package:fetin_2022/basic_templates/app_text_styles.dart';
import 'package:fetin_2022/screens/login.dart';
import 'package:fetin_2022/widgets/gender.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import '../basic_templates/appColors.dart';
import '../buttons/signup_button_completed.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override

  var sex = 'male';
  final sexList = <String>['Male', 'Female', 'Other'];
  final email_c = TextEditingController();
  final nome_c = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          children: [
            const SizedBox(
              width: 20,
              height: 20,
            ),

            Container(
              alignment: Alignment.center,
              child: Text(
                  "Sign Up",
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
              child: Image.asset("Images/man_profile.png",
                  alignment: Alignment.center),
            ),

            const SizedBox(
              width: 20,
              height: 20,
            ),

            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Fully Name",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "E-mail",
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Number",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Text("Gender:", style: AppTextStyles.text1),

            GenderSelection(),

            const SizedBox(
              height: 20,
            ),

            SignUpButtonCompleted(),

            const SizedBox(
              height: 20,
            ),

            SizedBox(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Text("Already have an account?",
                          style: AppTextStyles.text1
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                          child: Text("Sign In",
                              style: AppTextStyles.signup_text
                          )
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}