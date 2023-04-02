import 'package:fetin_2022/api/inputData.dart';
import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/screens/home.dart';
import 'package:fetin_2022/screens/inputNotes.dart';
import 'package:fetin_2022/screens/ranking.dart';
import 'package:fetin_2022/screens/start_screen.dart';
import 'package:fetin_2022/screens/login.dart';
import 'package:fetin_2022/screens/signUp.dart';
import 'package:fetin_2022/teste.dart';
import 'package:flutter/material.dart';

import 'api/resultData.dart';
import 'api/testhttp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //color: AppColors.purple,
        home: Home()
    );
  }
}