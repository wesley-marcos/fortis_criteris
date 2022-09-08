import 'package:flutter/material.dart';
import '../basic_templates/appColors.dart';
import '../basic_templates/app_text_styles.dart';
import '../screens/historic.dart';
import 'dataCard.dart';
import 'package:dio/dio.dart';
import 'dart:async';

import 'dataModel.dart';

final String url = "https://foris-criteris-apiv2.herokuapp.com";

// Estrutura basica das requisições
BaseOptions options = new BaseOptions(
  baseUrl: "https://foris-criteris-apiv2.herokuapp.com",
  connectTimeout: 5000,
);

class InputDataTest extends StatefulWidget {

  final String value;
  final String option;
  List<DataModel> data = <DataModel>[];

  InputDataTest({Key? key, required this.value, required this.option})
      : super(key: key);

  @override
  InputDataTestState createState() => InputDataTestState();
}

class InputDataTestState extends State<InputDataTest> {
  @override

  void initState() {
    super.initState();
    this.postData();
  }

  Future<void> postData() async {
    List<DataModel> auxData =
    <DataModel>[]; // Recebe os valores da requisição

    // Realiza a requisição
    Response response = await Dio(options)
        .post("/criterios/create");

    var dio = Dio();
    var data = {'id': 6, 'nome': 'teste2', 'peso': 6.5, 'valores': [2.5, 4.8, 9.6]};
    response = await dio.post("/criterios/create", data: {}, options: Options(headers: data));

    //var data = {'city-id': '371000000000'};
    //var response1 = await dio.post(url, data: {}, options: Options(headers: data));
    // final res = await dio.delete(
    //   url,
    //   data: response,
    //   options: Options(
    //
    //     followRedirects: false,
    //     // will not throw errors
    //     validateStatus: (status) => true,
    //   ),
    // );
    //Pesquisa seja válida
    // if (response.statusCode == 200) {
    //
    //   for (var item in response.data.toList()) {
    //     print(item);
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
                      children: widget.data
                          .map((e) =>
                          CardWidget(onTap: () {}, data: e,)).toList(),
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
