import 'dart:io';

import 'package:fetin_2022/api/dataModel.dart';
import 'package:fetin_2022/screens/historic.dart';
import 'package:flutter/material.dart';
import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:fetin_2022/basic_templates/app_text_styles.dart';
//import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// Estrutura basica das requisições
// BaseOptions options = new BaseOptions(
//   baseUrl: "https://foris-criteris-apiv2.herokuapp.com",
//   connectTimeout: 5000,
// );

var url = 'https://foris-criteris-apiv2.herokuapp.com/criterios/';

class ResultData extends StatefulWidget {

  final String value;
  final String option;
  List<DataModel> data = <DataModel>[];

  ResultData({Key? key, required this.value, required this.option})
      : super(key: key);

  @override
  ResultDataState createState() => ResultDataState();
}

class ResultDataState extends State<ResultData> {
  @override

  void initState() {
    super.initState();
    this.getData();
  }

  // Métodos
  void navigate(e) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Historic(data: e)));

  Future<void> getData() async {
    List<DataModel> auxData =
    <DataModel>[]; // Recebe os valores da requisição

    // Realiza a requisição
    // Response response = await Dio(options)
    //     .get("/criterios");

    final client = HttpClient();
    final request = await client.openUrl('get', Uri.parse(url));
    request.headers.set('content-type', '/criterios/');

    final response = await request.close();

    // Pesquisa seja válida
    // if (response.statusCode == 200) {
    //
    //   for (var item in response.headers) {
    //     //print(item);
    //     auxData.add(new DataModel.fromMap(item)); // Varrendo o array da resposta
    //
    //     setState(
    //             () => widget.data = auxData); // Setando os valores no estado
    //   }
    // }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Critérios",
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
              child: Column(
                children: [
                  if (widget.data.length == 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 50),
                      child: Column(
                        children: [
                          Text(
                            'Eita!',
                            style: AppTextStyles.heading40,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Deu ruim.',
                            style: AppTextStyles.body20,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Icon(Icons.sentiment_dissatisfied_sharp,
                              size: 50, color: Colors.green),
                        ],
                      ),
                    ),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      // children: widget.data
                      //     .map((e) =>
                      //     CardWidget(onTap: () => navigate(e), plans: e))
                      //     .toList(),
                      // //onTap: () => navigate(e),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
