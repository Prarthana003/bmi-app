import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Homepage(),

    );
  }
}




class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

double? bmi;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _currentValue=0;
  double counter=50;
  double bmi=0.0;

  double age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Row(
            children: [
              Text("                                                                                                        "),
              ElevatedButton(
                  child: (Icon(Icons.male,size: 100,)),
                  style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.0,150.0),
                    shape:new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)
                    ) ,

                    primary: Colors.blueGrey,
                  ),
                  onPressed: (){

    },
              ),
              Text("   "),
              ElevatedButton(
                child: (Icon(Icons.female,size: 100,)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.0,150.0),
                  shape:new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)
                  ) ,

                  primary: Colors.blueGrey,
                ),
                onPressed: (){

                },
              ),
/*
              Center(
                child: Container(
                  height: 100,
                  width: 200,
                  child:Image(image: AssetImage("assets/bmi.png"),),
                ),
              ),*/

              ],
          ),


          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
              ),
              height: 180,
              width: 300,
              //color: Colors.blueGrey,
              child: Column(
                  children:[



                    Center(child: Text("Height",style: TextStyle(fontSize: 40,color: Colors.grey),)),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_currentValue.toString(),style: TextStyle(fontSize: 40,color: Colors.grey),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slider(
                        value: _currentValue,
                        min: 0,
                        max: 250,
                        divisions: 250,
                        activeColor: Colors.black12,
                        inactiveColor: Colors.grey,
                        label: _currentValue.toString(),
                        onChanged: (value){
                          setState((){
                            _currentValue = value;
                          });
                        },
                      ),
                    )

                  ]//children
              ),



            ),
          ),



          Row(
            children:[
              Text("                                                                                                        "),

           Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(40.0),
               color: Colors.white
             ),

              height: 150,
              width: 150,



              child: Column(
                children: [


                  Column(
                    children:[
                       Text("Weight",style: TextStyle(fontSize: 20,color: Colors.grey),),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(counter.toString(),style: TextStyle(fontSize: 20,color: Colors.grey),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Column(
                            children: [
                              FloatingActionButton(
                                  child:
                                  Center(child: Icon(Icons.add)),
                                  backgroundColor: Colors.white,
                                  foregroundColor:Colors.grey,

                                  onPressed: (){
                                    setState(() {

                                    });
                                    counter++;

                                  }
                              ),
                            ],
                          ),
                          FloatingActionButton(
                              child: Center(child: Icon(Icons.remove)),
                              backgroundColor: Colors.white,
                              foregroundColor:Colors.grey ,
                              onPressed:(){
                                setState(() {

                                });
                                counter--;
                              }
                          ),
                        ],
                      ),
                    ],
                  ),


                ],
              ),
            ),
              Text("   "),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white,
                ),

                height: 150,
                width: 150,



                child: Column(
                  children: [


                    Center(child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text("Age",style: TextStyle(fontSize: 20,color: Colors.grey),),
                    )),

                    Column(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(age.toString(),style: TextStyle(fontSize: 20,color: Colors.grey),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Column(
                              children: [
                                FloatingActionButton(
                                    child:
                                    Center(child: Icon(Icons.add)),
                                    backgroundColor: Colors.white,
                                    foregroundColor:Colors.grey,

                                    onPressed: (){
                                      setState(() {

                                      });
                                      age++;

                                    }
                                ),
                              ],
                            ),
                            FloatingActionButton(
                                child: Center(child: Icon(Icons.remove)),
                                backgroundColor: Colors.white,
                                foregroundColor:Colors.grey ,
                                onPressed:(){
                                  setState(() {

                                  });
                                  counter--;
                                }
                            ),
                          ],
                        ),




                          ],
                        ),



                  ],
                ),
              ),

                ],
          ),
          Column(
            children: [
              FloatingActionButton.extended(
                  label: Text("               Calculate             ",style: TextStyle(fontSize: 20,color: Colors.white),),
                  backgroundColor: Colors.redAccent,
                  onPressed: (){
                    setState(() {

                    });

                    bmi=(counter*10000)/(_currentValue*_currentValue);
                    bmi=double.parse((bmi).toStringAsFixed(2));

                    Navigator.push(
                      context,MaterialPageRoute(builder: (context)=>  Result(bmi: bmi,)),
                    );

                  }),



            ],
          ),

        ],

      ),


    );
  }
}


class Result extends StatefulWidget {
   Result({Key? key,required this.bmi}) : super(key: key);
  double? bmi;
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
      ),

      body: Column(
        children:[
        Center(child: Text("Your Result",style: TextStyle(fontSize: 40,color: Colors.grey),)),

          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
              ),
              height:500,
              width: 300,
              child: Column(
                children: [
                  Text(" "),
                  Text(" "),
                  Text("Your Result",style: TextStyle(fontSize: 40,color: Colors.grey),),
                  Text(" "),
                  Center(child: Text(widget.bmi.toString(),style: TextStyle(fontSize: 40,color: Colors.grey),))
                ],
              ),

            ),

          ),
          Text(" "),
          FloatingActionButton.extended(
              label: Text("          Re-Calculate          ",style: TextStyle(fontSize: 20,color: Colors.white),),
              backgroundColor: Colors.redAccent,
              onPressed: (){
                Navigator.pop(context);

              }),

      ],

      ),




    );
  }
}


