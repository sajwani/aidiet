import 'package:ai_diet_firebase/progress_page.dart';
import 'package:ai_diet_firebase/step_tracker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ai_diet_firebase/net/flutterfire.dart';
import 'net/generatingdiet.dart';
import 'net/userinfo.dart';
import 'package:pedometer/pedometer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('Todays Progress',
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
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Text(
                                    "$consumedcalories / $caloriestarget "),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text("WATER CONSUMED",
                                  style: TextStyle(fontSize: 18)),
                              SizedBox(
                                width: 50,
                              ),
                              Text("$waterconsumed/$watertarget"),
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
                        child:
                            Text('Next Meal', style: TextStyle(fontSize: 20)),
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
                          if (breakfastcheckbox == false)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.0,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetBreakfast(false, false),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.0,
                                      child: Checkbox(
                                        value: breakfastcheckbox,
                                        activeColor: Colors.blueAccent,
                                        onChanged: (newBool) async {
                                          if (breakfastcheckbox == false) {
                                            // String calories=await getItem("breakfast", true);
                                            getItem("breakfast", true, false);
                                            breakfastcheckbox = true;
                                            setCheckbox(true, "breakfast");
                                            //consumedcalories=consumedcalories+int.parse(calories);
                                            consumedcalories =
                                                consumedcalories +
                                                    int.parse(checkboxItem);
                                            setConsumedCalories(
                                                false, consumedcalories, false);
                                          } else if (breakfastcheckbox ==
                                              true) {
                                            // String calories=await getItem("breakfast", true);
                                            getItem("breakfast", true, false);
                                            breakfastcheckbox = false;
                                            setCheckbox(false, "breakfast");
                                            // consumedcalories=consumedcalories-int.parse(calories);
                                            consumedcalories =
                                                consumedcalories -
                                                    int.parse(checkboxItem);
                                            setConsumedCalories(
                                                false, consumedcalories, false);
                                          }
                                          setState(() {});
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
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetBreakfast(true, true),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.0,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetBreakfast(true, false),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          if (breakfastcheckbox == true &&
                              lunchcheckbox == false)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.0,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetLunch(false, false),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.0,
                                      child: Checkbox(
                                        value: lunchcheckbox,
                                        activeColor: Colors.blueAccent,
                                        onChanged: (newBool) async {
                                          if (lunchcheckbox == false) {
                                            // String calories=await getItem("Lunch", true);
                                            getItem("Lunch", true, false);
                                            lunchcheckbox = true;
                                            setCheckbox(true, "Lunch");
                                            // consumedcalories=consumedcalories+int.parse(calories);
                                            consumedcalories =
                                                consumedcalories +
                                                    int.parse(checkboxItem);
                                            setConsumedCalories(
                                                false, consumedcalories, false);
                                          } else if (lunchcheckbox == true) {
                                            // String calories=await getItem("Lunch", true);
                                            getItem("Lunch", true, false);
                                            lunchcheckbox = false;
                                            setCheckbox(false, "Lunch");
                                            // consumedcalories=consumedcalories-int.parse(calories);
                                            consumedcalories =
                                                consumedcalories -
                                                    int.parse(checkboxItem);
                                            setConsumedCalories(
                                                false, consumedcalories, false);
                                          }
                                          setState(() {});
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
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetLunch(true, true),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.0,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetLunch(true, false),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          if (breakfastcheckbox == true &&
                              lunchcheckbox == true &&
                              dinnercheckbox == false)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.0,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetDinner(false, false),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.0,
                                      child: Checkbox(
                                        value: dinnercheckbox,
                                        activeColor: Colors.blueAccent,
                                        onChanged: (newBool) async {
                                          if (dinnercheckbox == false) {
                                            // String calories=await getItem("dinner", true);
                                            getItem("dinner", true, false);
                                            dinnercheckbox = true;
                                            setCheckbox(true, "dinner");
                                            // consumedcalories=consumedcalories+int.parse(calories);
                                            consumedcalories =
                                                consumedcalories +
                                                    int.parse(checkboxItem);
                                            setConsumedCalories(
                                                false, consumedcalories, false);
                                          } else if (dinnercheckbox == true) {
                                            // String calories=await getItem("dinner", true);
                                            getItem("dinner", true, false);
                                            dinnercheckbox = false;
                                            setCheckbox(false, "dinner");
                                            // consumedcalories=consumedcalories-int.parse(calories);
                                            consumedcalories =
                                                consumedcalories -
                                                    int.parse(checkboxItem);
                                            setConsumedCalories(
                                                false, consumedcalories, false);
                                          }
                                          setState(() {});
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
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetDinner(true, true),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.0,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetDinner(true, false),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          if (breakfastcheckbox == true &&
                              lunchcheckbox == true &&
                              dinnercheckbox == true)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.0,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetDinner(false, false),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.0,
                                      child: Checkbox(
                                        value: dinnercheckbox,
                                        activeColor: Colors.blueAccent,
                                        onChanged: (newBool) async {
                                          if (dinnercheckbox == false) {
                                            // String calories=await getItem("dinner", true);
                                            getItem("dinner", true, false);
                                            dinnercheckbox = true;
                                            setCheckbox(true, "dinner");
                                            // consumedcalories=consumedcalories+int.parse(calories);
                                            consumedcalories =
                                                consumedcalories +
                                                    int.parse(checkboxItem);
                                            setConsumedCalories(
                                                false, consumedcalories, false);
                                          } else if (dinnercheckbox == true) {
                                            //String calories=await getItem("dinner", true);
                                            getItem("dinner", true, false);
                                            dinnercheckbox = false;
                                            setCheckbox(false, "dinner");
                                            // consumedcalories=consumedcalories-int.parse(calories);
                                            consumedcalories =
                                                consumedcalories -
                                                    int.parse(checkboxItem);
                                            setConsumedCalories(
                                                false, consumedcalories, false);
                                          }
                                          setState(() {});
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
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetDinner(true, true),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.0,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 0, 0),
                                        child: GetDinner(true, false),
                                      ),
                                    ),
                                  ],
                                ),
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
                              Container(
                                child: Text(ssteps),
                              ),
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
