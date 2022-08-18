import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/screens/start_screen.dart';
import 'package:fetin_2022/screens/login.dart';
import 'package:flutter/material.dart';

import '../basic_templates/app_text_styles.dart';

class SignUpButtonCompleted extends StatelessWidget {
  const SignUpButtonCompleted({Key? key}) : super(key: key);

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
          "Save",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: (){
          sign_up_alert(context);
        },
      ),

    );
  }
}

void sign_up_alert (BuildContext context){

  var alertDialog = AlertDialog(
    title: Text("Uma mensagem foi enviada com sucesso"),

  );

  showDialog(
      context: context,
      builder: (BuildContext context){

        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(
              context, MaterialPageRoute(
              builder: (BuildContext context) => Login()
          )
          );
        });

        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          insetAnimationDuration: Duration(seconds: 1),
          child: Container(
            height: 200.0,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Signed up successfully!',
                      style: AppTextStyles.heading15
                  ),
                ],
              ),
            ),
          ),
        );
      }
  );
}