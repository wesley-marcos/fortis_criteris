import 'package:fetin_2022/basic_templates/appColors.dart';
import 'package:flutter/material.dart';

import '../basic_templates/app_text_styles.dart';

class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);
  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {

  final double borderRadius = 5;
  final double headerHeight = 85;
  //final Color borderColor = AppColors.border;
  //final Color headerColor = AppColors.darkBlue;
  //final Color backColor = AppColors.white;
  //final VoidCallback onTap;

  var _note;
  void _update_note(val){
    setState((){
      _note = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input of data",
          style: TextStyle(
            fontSize:25
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.dodgerBlue,
      ),
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [

                  Text("Criteria #", style: AppTextStyles.title),

                  Expanded(
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      children: <Widget>[
                        Container(
                            color: Colors.green,
                            padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                            margin: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  "Option 1",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),

                                SizedBox(height: 20),

                                TextFormField(
                                  onChanged: (val){
                                    _update_note(val);
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: "Note",
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                                
                                Text("Inputed note is $_note")
                              ],
                            )
                        ),

                        Container(
                          color: Colors.red,
                          padding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                          margin: EdgeInsets.all(10.0),
                          child: Text(
                            "Option 2",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),),

                        Container(
                          color: Colors.purple,
                          padding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                          margin: EdgeInsets.all(10.0),
                          child: Text(
                            "Option 3",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),),

                        Container(
                          color: Colors.yellow,
                          padding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                          margin: EdgeInsets.all(10.0),
                          child: Text(
                            "Option 4",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),),

                        Container(
                          color: Colors.blueAccent,
                          padding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                          margin: EdgeInsets.all(10.0),
                          child: Text(
                            "Option 5",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),),

                        Container(
                          color: Colors.black,
                          padding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                "Option 6",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),),

                              TextFormField(
                                keyboardType: TextInputType.number,
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
                            ],
                          )
                        ),

                        Container(
                          color: Colors.brown,
                          padding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                          margin: EdgeInsets.all(10.0),
                          child: Text(
                            "Option 7",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),),

                        Container(
                          color: Colors.blueGrey,
                          padding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                          margin: EdgeInsets.all(10.0),
                          child: Text(
                            "Option 8",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),),
                      ],
                    )
                    // GridView.count(
                    //   crossAxisSpacing: 12,
                    //   mainAxisSpacing: 12,
                    //   crossAxisCount: 2,
                    //   childAspectRatio: 0.85,
                    //   //children:
                    //   //onTap: () => navigate(e),
                    // ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}



