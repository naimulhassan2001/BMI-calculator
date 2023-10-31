import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double bmi = 0;
  String result = '';
  String stats = '';


  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController feet = TextEditingController();
  TextEditingController inch = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: age,

                    decoration: InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: weight,
                    decoration: InputDecoration(
                        labelText: "Weight",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: feet,
                    decoration: InputDecoration(
                        labelText: "feet",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: inch,
                    decoration: InputDecoration(
                        labelText: "inch",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(height: 16,),

                ElevatedButton(onPressed: (){

                  setState(() {
                    var iAge = int.parse(age.text);
                    var iWeight = int.parse(weight.text);
                    var iFeet = int.parse(feet.text);
                    var iInch = int.parse(inch.text);

                    var dFeet = iFeet*30.48;
                    var dinch = iInch * 2.54 ;

                    var hight = dFeet+dinch ;
                    var dhight = hight/100;

                    var qhight = dhight*dhight ;


                    var bm = iWeight/qhight ;

                    if(30 < bm) {
                      result = "Obesity";
                      stats = "try to decrease your Over weight" ;
                    } else if(bm > 25) {
                      result = "Overweight " ;
                      stats = "try to decrease your weight" ;
                    } else if(bm > 18.5) {
                      result = "Normal weight " ;
                      stats = "your are perfect now" ;
                    } else {
                      result = "Underweight" ;
                      stats = "try to increase your weight" ;
                    }

                    bmi = bm ;


                  });

                }, child: const Text("BMi")),
                const SizedBox(height: 16,),
                Text('$bmi', style: const TextStyle(fontSize: 26),),
                const SizedBox(height: 16, ),
                Text('$result', style: const TextStyle(fontSize: 26),),
                const SizedBox(height: 10, ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('$stats', style: const TextStyle(fontSize: 26),),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
