import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:ai_diet_firebase/step_tracker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ai_diet_firebase/net/flutterfire.dart';
import 'net/generatingdiet.dart';
import 'net/userinfo.dart';
import 'package:pedometer/pedometer.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({super.key});

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
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
                Divider(
                  height: 6,
                ),
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
                            primary: Colors.purpleAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('Day 1', style: TextStyle(fontSize: 20)),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Breakfast:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(0,"breakfast");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),

                                ],
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
                                  child: GetDayBreakfast(0,false,false),
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
                                      child: GetDayBreakfast(0,true,true),
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
                                  child: GetDayBreakfast(0,true,false),
                                ),
                              ),
                            ],
                          ),


                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Lunch:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed:() async{
                                        await changeMeal(0,"Lunch");
                                        setState(()
                                        {

                                        });
                                      },
                                      icon: Icon(
                                        Icons.change_circle,
                                      ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayLunch(0,false,false),
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
                                      child: GetDayLunch(0,true,true),
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
                                  child: GetDayLunch(0,true,false),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 0,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Dinner:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(0,"dinner");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayDinner(0,false,false),
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
                                      child: GetDayDinner(0,true,true),
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
                                  child: GetDayDinner(0,true,false),
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
                ),
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
                        child: Text('Day 2', style: TextStyle(fontSize: 20)),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Breakfast:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(1,"breakfast");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
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
                                  child: GetDayBreakfast(1,false,false),
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
                                      child: GetDayBreakfast(1,true,true),
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
                                  child: GetDayBreakfast(1,true,false),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Lunch:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(1,"Lunch");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayLunch(1,false,false),
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
                                      child: GetDayLunch(1,true,true),
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
                                  child: GetDayLunch(1,true,false),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 0,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Dinner:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(1,"dinner");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayDinner(1,false,false),
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
                                      child: GetDayDinner(1,true,true),
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
                                  child: GetDayDinner(1,true,false),
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
                ), //Card //Card
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
                        child: Text('Day 3', style: TextStyle(fontSize: 20)),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Breakfast:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(2,"breakfast");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
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
                                  child: GetDayBreakfast(2,false,false),
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
                                      child: GetDayBreakfast(2,true,true),
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
                                  child: GetDayBreakfast(2,true,false),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Lunch:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                    await changeMeal(2,"Lunch");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayLunch(2,false,false),
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
                                      child: GetDayLunch(2,true,true),
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
                                  child: GetDayLunch(2,true,false),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Dinner:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(2,"dinner");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayDinner(2,false,false),
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
                                      child: GetDayDinner(2,true,true),
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
                                  child: GetDayDinner(2,true,false),
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
                        child:
                        Text('Day 4', style: TextStyle(fontSize: 20)),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Breakfast:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(3,"breakfast");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
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
                                  child: GetDayBreakfast(3,false,false),
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
                                      child: GetDayBreakfast(3,true,true),
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
                                  child: GetDayBreakfast(3,true,false),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Lunch:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(3,"Lunch");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayLunch(3,false,false),
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
                                      child: GetDayLunch(3,true,true),
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
                                  child: GetDayLunch(3,true,false),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 0,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Dinner:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(3,"dinner");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayDinner(3,false,false),
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
                                      child: GetDayDinner(3,true,true),
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
                                  child: GetDayDinner(3,true,false),
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
                        child: Text('Day 5', style: TextStyle(fontSize: 20)),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Breakfast:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(4,"breakfast");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
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
                                  child: GetDayBreakfast(4,false,false),
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
                                      child: GetDayBreakfast(4,true,true),
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
                                  child: GetDayBreakfast(4,true,false),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Lunch:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(4,"Lunch");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayLunch(4,false,false),
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
                                      child: GetDayLunch(4,true,true),
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
                                  child: GetDayLunch(4,true,false),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 0,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Dinner:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(4,"dinner");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayDinner(4,false,false),
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
                                      child: GetDayDinner(4,true,true),
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
                                  child: GetDayDinner(4,true,false),
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
                        child: Text('Day 6', style: TextStyle(fontSize: 20)),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Breakfast:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(5,"breakfast");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
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
                                  child: GetDayBreakfast(5,false,false),
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
                                      child: GetDayBreakfast(5,true,true),
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
                                  child: GetDayBreakfast(5,true,false),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Lunch:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(5,"Lunch");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayLunch(5,false,false),
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
                                      child: GetDayLunch(5,true,true),
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
                                  child: GetDayLunch(5,true,false),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 0,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Dinner:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(5,"dinner");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayDinner(5,false,false),
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
                                      child: GetDayDinner(5,true,true),
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
                                  child: GetDayDinner(5,true,false),
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
                        child: Text('Day 7', style: TextStyle(fontSize: 20)),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Breakfast:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(6,"breakfast");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
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
                                  child: GetDayBreakfast(6,false,false),
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
                                      child: GetDayBreakfast(6,true,true),
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
                                  child: GetDayBreakfast(6,true,false),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Lunch:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(6,"Lunch");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayLunch(6,false,false),
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
                                      child: GetDayLunch(6,true,true),
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
                                  child: GetDayLunch(6,true,false),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 0,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      child: Text('Dinner:',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:() async{
                                      await changeMeal(6,"dinner");
                                      setState(()
                                      {

                                      });
                                    },
                                    icon: Icon(
                                      Icons.change_circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: GetDayDinner(6,false,false),
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
                                      child: GetDayDinner(6,true,true),
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
                                  child: GetDayDinner(6,true,false),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
