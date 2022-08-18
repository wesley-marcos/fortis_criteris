import'package:flutter/material.dart';
import 'basic_templates/appColors.dart';

class teste extends StatefulWidget {
  const teste({Key? key}) : super(key: key);

  @override
  State<teste> createState() => _testeState();
}

class _testeState extends State<teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.dodgerBlue,
      ),
    );
  }
}


