import 'package:flutter/material.dart';

import '../basic_templates/appColors.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String _selected = '1';
  List<Map> _myJson = [
    {
      'id': '1',
      'image': 'assets/Images/brazil_flag.png'
    },
    {
      'id' : '2',
      'image' : 'assets/Images/usa_flag.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topRight,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),

            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.dodgerBlue),
                  borderRadius: BorderRadius.circular(10)

              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          hint: const Text(
                            "Language"
                          ),
                          value: _selected,
                          onChanged: (newValue){
                            setState((){
                          _selected = newValue as String;

                            }
                          );
                        },
                          items: _myJson.map((bankitem){
                            return DropdownMenuItem(
                              value: bankitem['id'].toString(),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      bankitem["image"],
                                      width: 25,
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(bankitem['name'])
                                    )
                                  ],
                                )
                              );
                            }
                          ).toList(),
                        ),
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
