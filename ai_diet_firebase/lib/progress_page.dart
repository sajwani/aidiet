import 'package:ai_diet_firebase/step_tracker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ai_diet_firebase/net/flutterfire.dart';
import 'net/generatingdiet.dart';
import 'net/userinfo.dart';
import 'package:pedometer/pedometer.dart';



String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}



String  ssteps = '0';
class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {


  //String  ssteps = '?';
  //late Stream<StepCount> _stepCountStream;
  void initState() {
    super.initState();
    //initPlatformState();
  }
  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      ssteps = event.steps.toString();
    });
  }
  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      ssteps = 'Step Count not available';
    });
  }
  // void initPlatformState() {
  //   _stepCountStream = Pedometer.stepCountStream;
  //   _stepCountStream.listen(onStepCount).onError(onStepCountError);
  //
  //   if (!mounted) return;
  // }




  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: w * 0.7,
                  height: h * 0.2,
                  child: Image.asset('assets/logo1.png'),
                ),
                Divider(),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.orangeAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('Meal Progress',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.orangeAccent,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0,

                  color: Colors.white,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      primary: Colors.orangeAccent,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      )),
                                  onPressed: () {},
                                  child: Text('Breakfast:',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Row(
                            children: [
                            SizedBox(
                            height: 45.0,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                              child: GetBreakfast(false,false),
                            ),
                          ),

                              SizedBox(
                                height: 45.0,
                                child: Checkbox(
                                  value:  breakfastcheckbox,
                                  activeColor: Colors.blueAccent,
                                  onChanged: (newBool)async{
                                    if(breakfastcheckbox==false)
                                    {
                                       String calories=await getItem("breakfast", true,false);
                                      //getItem("breakfast", true);
                                      breakfastcheckbox=true;
                                      setCheckbox(true,"breakfast");
                                      // consumedcalories=consumedcalories+int.parse(calories);


                                      // double mealpergram=data["breakfast"][randomnumber.toString()]["kcal"]/100;
                                      // double mealpergram2=data["Lunch"][randomnumber.toString()]["kcal"]/100;
                                      // double mealpergram3=data["dinner"][randomnumber.toString()]["kcal"]/100;
                                      // double targetgram=calories/mealpergram;
                                      // double targetgram2=calories/mealpergram2;
                                      // double targetgram3=calories/mealpergram3;y



                                      consumedcalories=consumedcalories+int.parse(calories/*checkboxItem*/);
                                      setConsumedCalories(false, consumedcalories,false);
                                    print("true");
                                    }
                                    else if(breakfastcheckbox==true)
                                    {
                                      print("false");
                                       String calories=await getItem("breakfast", true,false);
                                      //getItem("breakfast", true);
                                      breakfastcheckbox=false;
                                      setCheckbox(false,"breakfast");
                                      consumedcalories=consumedcalories-int.parse(calories/*checkboxItem*/);
                                      setConsumedCalories(false, consumedcalories/*checkboxItem*/,false);
                                    }
                                    setState(()
                                    {
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetBreakfast(true,true),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetBreakfast(true,false),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      primary: Colors.orangeAccent,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      )),
                                  onPressed: () {},
                                  child: Text('Lunch:',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                            SizedBox(
                            height: 45.0,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                              child: GetLunch(false,false),
                            ),
                          ),

                              SizedBox(
                                height: 45.0,
                                child: Checkbox(
                                  value:  lunchcheckbox,
                                  activeColor: Colors.blueAccent,
                                  onChanged: (newBool)async{
                                    if(lunchcheckbox==false)
                                    {
                                       String calories=await getItem("Lunch", true,false);
                                      //getItem("Lunch", true);
                                      lunchcheckbox=true;
                                      setCheckbox(true,"Lunch");
                                      // consumedcalories=consumedcalories+int.parse(calories);
                                      consumedcalories=consumedcalories+int.parse(calories/*checkboxItem*/);
                                      setConsumedCalories(false, consumedcalories/*checkboxItem*/,false);
                                      print("true");
                                    }
                                    else if(lunchcheckbox==true)
                                    {
                                      print("flase");
                                       String calories=await getItem("Lunch", true,false);
                                      //getItem("Lunch", true);
                                      lunchcheckbox=false;
                                      setCheckbox(false,"Lunch");
                                      // consumedcalories=consumedcalories-int.parse(calories);
                                       consumedcalories=consumedcalories-int.parse(calories/*checkboxItem*/);
                                       setConsumedCalories(false, consumedcalories/*checkboxItem*/,false);
                                    }
                                    setState(()
                                    {
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetLunch(true,true),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetLunch(true,false),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      primary: Colors.orangeAccent,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      )),
                                  onPressed: () {},
                                  child: Text('Dinner:',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                            SizedBox(
                            height: 45.0,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                              child: GetDinner(false,false),
                            ),
                          ),

                              SizedBox(
                                height: 45.0,
                                child: Checkbox(
                                  value:  dinnercheckbox,
                                  activeColor: Colors.blueAccent,
                                  onChanged: (newBool)async{
                                    if(dinnercheckbox==false)
                                    {
                                       String calories=await getItem("dinner", true,false);
                                      //getItem("dinner", true);
                                      dinnercheckbox=true;
                                      setCheckbox(true,"dinner");
                                      // consumedcalories=consumedcalories+int.parse(calories);
                                       consumedcalories=consumedcalories+int.parse(calories/*checkboxItem*/);
                                       setConsumedCalories(false, consumedcalories/*checkboxItem*/,false);
                                    }
                                    else if(dinnercheckbox==true)
                                    {
                                      String calories=await getItem("dinner", true,false);
                                      //getItem("dinner", true);
                                      dinnercheckbox=false;
                                      setCheckbox(false,"dinner");
                                      consumedcalories=consumedcalories-int.parse(calories/*checkboxItem*/);
                                      setConsumedCalories(false, consumedcalories/*checkboxItem*/,false);
                                    }
                                    setState(()
                                    {

                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDinner(true,true),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDinner(true,false),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ), //Card
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('Calorie Progress',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.green,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0,

                  color: Colors.white,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("CALORIES CONSUMED",
                                  style: TextStyle(fontSize: 18)),
                              SizedBox(width: 20,),
                              Container(
                                child: Text("$consumedcalories / $caloriestarget"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,

                          ),

                          const SizedBox(
                            height: 3,
                          ),
                          //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ),

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('Water Consumption',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.blueAccent,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0,

                  color: Colors.white,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text("WATER CONSUMED",
                                  style: TextStyle(fontSize: 18)),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: (){
                                          waterconsumed=waterconsumed+200;
                                          setConsumedWater(false, waterconsumed, false);

                                          setState(()
                                          {
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add
                                        ),
                                    ),
                                    Text(
                                      "$waterconsumed / $watertarget"
                                    ),
                                    IconButton(
                                      onPressed: (){
                                        if(waterconsumed>=200)
                                          {
                                            waterconsumed=waterconsumed-200;
                                            setConsumedWater(false, waterconsumed, false);
                                          }

                                        setState(()
                                        {
                                        });
                                      },
                                      icon: Icon(
                                          Icons.remove
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ), //Card
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.purpleAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('Step Tracker',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.purpleAccent,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0,

                  color: Colors.white,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(child: Text(ssteps)),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ), //Card
              ],
            ),
          ],
        ),
      ),
    );
  }
}
