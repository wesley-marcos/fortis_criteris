import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/screens/start_screen.dart';
import 'package:fetin_2022/screens/login.dart';
import 'package:flutter/material.dart';

class LoginButtonHome extends StatelessWidget {
  const LoginButtonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

      ),

      width: 50,
      height: 50,
      child: ElevatedButton(
        child: const Text(
          "Login",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Login()));
        },
      ),

    );
  }
}
