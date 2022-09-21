import 'package:fetin_2022/screens/home.dart';
import 'package:fetin_2022/screens/inputMxN.dart';
import 'package:flutter/material.dart';
import '../basic_templates/appColors.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ranking",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: AppColors.dodgerBlue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.DeepSkyBlue,
              AppColors.LightSkyBlue,
              AppColors.lightBlue,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.only(top: 5),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            //Scroll Principal
            padding: const EdgeInsets.all(8),
            children: [
              Center(
                child: Column(
                  //physics: NeverScrollableScrollPhysics(),
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),

                    cards(Image.asset("Images/first.png", alignment: Alignment
                        .center), "A"),
                    cards(Image.asset("Images/sec.png", alignment: Alignment
                        .center), "B"),
                    cards(Image.asset("Images/thi.png", alignment: Alignment
                        .center), "C"),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
                height: 30,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    //splashFactory: NoSplash.splashFactory,
                    elevation: 10,
                    fixedSize: Size(100, 50),
                    side: BorderSide(color: Colors.black12),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      //RoundedRectangleBorder
                    )
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputMxN()));
                },
                child: const Text(
                  "Calcular Novamente",
                  style: TextStyle(
                      fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),


              const SizedBox(
                width: 20,
                height: 20,
              ),

              TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Colors.black87,
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Sair"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

Container cards(img, alt) {
  return Container(
    decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE0FFFF),
              AppColors.DeepSkyBlue
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        borderRadius: BorderRadius.circular(10)
        ),

    //color: AppColors.darkBlue,
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
    margin: const EdgeInsets.all(10.0),
    child: Center(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: img
                ),

                Text("        $alt",
                style: TextStyle(
                  fontSize: 40
                ),
                ),
              ],
            )
          ),

        ],
      ),
    ),
  );
}
