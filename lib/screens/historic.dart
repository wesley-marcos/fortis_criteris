import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:flutter/material.dart';

class Historic extends StatefulWidget {
  const Historic({Key? key, required data}) : super(key: key);

  @override
  State<Historic> createState() => _HistoricState();
}

class _HistoricState extends State<Historic> {
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.cornflowerBlue,);
  }
}
