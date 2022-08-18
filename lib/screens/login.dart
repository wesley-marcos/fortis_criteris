import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/basic_templates/app_text_styles.dart';
import 'package:fetin_2022/screens/signUp.dart';
import 'package:fetin_2022/buttons/login_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Images/fundo.png"),
            fit: BoxFit.cover
          )
        ),
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
                "Login",
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
                suffixIcon: Icon(Icons.email, color: Colors.black),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                ),

              suffixIcon: Icon(Icons.lock, color: Colors.black),
              ),

            ),

            const SizedBox(
              height: 40,
            ),

            const SizedBox(
              child: LoginButton(),
            ),

            const SizedBox(
              height: 30,
            ),

            SizedBox(
              child: Container(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Text("Don't have an account?",
                      style: AppTextStyles.text1
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                    },
                        child: Text("Sign Up",
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
