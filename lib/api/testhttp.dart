import 'package:flutter/material.dart';
import '../basic_templates/appColors.dart';
import '../basic_templates/app_text_styles.dart';
import '../screens/historic.dart';
import 'dataCard.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dataModel.dart';

final String url = "https://foris-criteris-apiv2.herokuapp.com";

class TestHttp extends StatefulWidget {

  final String value;
  final String option;

  TestHttp({Key? key, required this.value, required this.option})
      : super(key: key);

  @override
  TestHttpState createState() => TestHttpState();
}



class TestHttpState extends State<TestHttp> {
  @override

  void initState() {
    super.initState();
    this.submitData();
  }

  Future<void> submitData() async {
    var response  = await http.post(Uri.https('regres.in', '/criterios/create'),
        body: {'id': '6', 'nome': 'teste2'}
    );

    var data = response.body;
    print(data);

    if(response.statusCode == 200){
      String r = response.body;
      print('Deu bom');
    }
    else {
      print('Deu ruim');
      return null;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data Input",
            style: TextStyle(
                fontSize: 25
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.darkBlue,
        ),
        body: SizedBox.expand(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              // child: Column(
              //   children: [
              //     if (widget.data.length == 0)
              //       Padding(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 10, vertical: 50),
              //         child: Column(
              //           children: [
              //             Text(
              //               'Eita!',
              //               style: AppTextStyles.heading40,
              //               textAlign: TextAlign.center,
              //             ),
              //             Text(
              //               'Deu ruim.',
              //               style: AppTextStyles.body20,
              //               textAlign: TextAlign.center,
              //             ),
              //             SizedBox(
              //               height: 15,
              //             ),
              //             Icon(Icons.sentiment_dissatisfied_sharp,
              //                 size: 50, color: Colors.green),
              //           ],
              //         ),
              //       ),
              //     Expanded(
              //       child: GridView.count(
              //         crossAxisSpacing: 12,
              //         mainAxisSpacing: 12,
              //         crossAxisCount: 2,
              //         childAspectRatio: 0.85,
              //         children: widget.data
              //             .map((e) =>
              //             CardWidget(onTap: () {}, data: e,)).toList(),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        )
    );
  }
}