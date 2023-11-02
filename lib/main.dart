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
  String status = '';
  String suggestion = '';


  TextEditingController controllerAge = TextEditingController();
  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerFeet = TextEditingController();
  TextEditingController controllerInch = TextEditingController();

  getBmi(){

    setState(() {
      var intAge = int.parse(controllerAge.text);
      var weight = int.parse(controllerWeight.text);
      var intFeet = int.parse(controllerFeet.text);
      var intInch = int.parse(controllerInch.text);

      var doubleFeet = intFeet*30.48;
      var doubleInch = intInch * 2.54 ;

      var height = (doubleFeet+doubleInch)/100 ;
       height = height*height ;


      var getBmi = weight/height ;
      bmi = getBmi ;

      if(30 < getBmi) {
        status = "BMI Status: Obesity";
        suggestion = "suggestion: try to decrease your Over weight" ;
      } else if(getBmi > 25) {
        status = "BMI Status: Overweight " ;
        suggestion = "suggestion: try to decrease your weight" ;
      } else if(getBmi > 18.5) {
        status = "BMI Status: Normal weight " ;
        suggestion = "suggestion: your are perfect now" ;
      } else {
        status = "BMI Status: Underweight" ;
        suggestion = "suggestion: try to increase your weight" ;
      }



    });

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
            title: const Text('BMI Calculator'),
          leading: const Icon(Icons.menu),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Age : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ) ,),

                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TextField(
                          controller: controllerAge,
                          decoration: InputDecoration(
                              labelText: "Age",
                              labelStyle: const TextStyle(fontSize: 20,),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Weight : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ) ,),

                    Expanded(
                    flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),                        child: TextField(
                          controller: controllerWeight,
                          decoration: InputDecoration(
                              labelText: "Weight",
                              labelStyle: const TextStyle(fontSize: 20,),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Height : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ) ,),

                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),                        child: TextField(
                          controller: controllerFeet,
                          decoration: InputDecoration(
                              labelText: "feet",
                              labelStyle: const TextStyle(fontSize: 20,),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),                        child: TextField(
                          controller: controllerInch,
                          decoration: InputDecoration(
                              labelText: "inch",
                              labelStyle: const TextStyle(fontSize: 20),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                const SizedBox(height: 16,),

                ElevatedButton(onPressed: getBmi, child: const Text("Get BMI")),
                const SizedBox(height: 16,),
                Text('BMI: $bmi', style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 16, ),
                Text(status, style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 16, ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(suggestion, style: const TextStyle(fontWeight: FontWeight.bold),),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}




