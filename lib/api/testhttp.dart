import 'dart:convert';

import 'package:flutter/material.dart';
import '../basic_templates/appColors.dart';
import '../basic_templates/app_text_styles.dart';
import '../screens/historic.dart';
import 'dataCard.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dataModel.dart';
import 'dart:convert';

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

  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection" : "Keep-Alive",
    "Keep-Alive" : "timeout = 5, max = 1000"
  };

  Future<void> submitData() async {
    var response  = await http.post(
        Uri.parse('https://foris-criteris-apiv2.herokuapp.com/criterios/create/'),
        body: jsonEncode({'nome': 'teste_12.09', 'peso': 1.5,
          'valores': [1, 2, 9]}),
        headers: TestHttpState.httpHeaders);

    var data = response.body;
    print(data);

    FlutterError.onError = (FlutterErrorDetails details) {
      print("=================== CAUGHT FLUTTER ERROR");
      // Send report
    };

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