import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ai_diet_firebase/net/flutterfire.dart';
import 'net/generatingdiet.dart';
import 'net/userinfo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _weight = TextEditingController();
  TextEditingController _height = TextEditingController();

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
                  width: w * 0.8,
                  height: h * 0.22,
                  child: Image.asset('assets/logo1.png'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        color: Colors.green,
                        child: Text(
                          'User Information',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 2.0,
                            fontSize: 26.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton(
                        icon: Icon(Icons.settings),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem<int>(
                              value: 1,
                              child: Text("Settings"),
                            ),
                            PopupMenuItem<int>(
                              value: 2,
                              child: Text("Logout"),
                            ),
                          ];
                        },
                        onSelected: (value) {
                          if (value == 0) {
                            print("Settings menu is selected.");
                          } else if (value == 1) {
                            print("Logout menu is selected.");
                          }
                        }),
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.lightBlue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('NAME', style: TextStyle(fontSize: 29)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45.0,
                      // width: w/1.5,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: GetName(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.lightBlue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () async {},
                        child: Text('AGE', style: TextStyle(fontSize: 29)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45.0,
                      // width: w/1.5,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: GetAge(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.lightBlue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('WEIGHT', style: TextStyle(fontSize: 29)),
                      ),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 45.0,
                    width: w / 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: GetW(),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              openDialogueBox(context);
                            },
                            icon: Icon(
                              Icons.edit,
                            ))
                      ],
                    ),
                  )
                ]),
                Row(
                  children: [
                    Container(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.lightBlue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('HEIGHT', style: TextStyle(fontSize: 29)),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  SizedBox(
                    height: 45.0,
                    width: w / 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: GetH(),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              openDialogueBox1(context);
                            },
                            icon: Icon(
                              Icons.edit,
                            ))
                      ],
                    ),
                  )
                ]),
                Row(
                  children: [
                    Container(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.lightBlue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('BMI', style: TextStyle(fontSize: 29)),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  SizedBox(
                    height: 45.0,
                    width: w / 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: GetBMI(),
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Container(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.lightBlue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: () {},
                        child: Text('BMR', style: TextStyle(fontSize: 29)),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  SizedBox(
                    height: 45.0,
                    width: w / 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: GetBMR(),
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Container(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(height: 7.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit User Details'),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Weight'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  submitAction(context);
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  submitAction(BuildContext context) async {
    // updatedData(_weight.text);
    idUsers.update({
      "weight": double.parse(_weight.text),
      "Diet Set": false,
    });
    await calcBMI();
    await calcBMR();
    await getw();
    await addactivity("");
    await GeneratingDiet();

// print("$BMI in submit acttion");
    setState(() {});
    _weight.clear();
  }

  openDialogueBox1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit User Details'),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Height'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  submitAction1(context);
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  submitAction1(BuildContext context) async {
    // updatedData(_weight.text);
    idUsers.update({
      "height": double.parse(_height.text),
      "Diet Set": false,
    });
    await calcBMI();
    await calcBMR();
    await geth();
    await addactivity("");
    await GeneratingDiet();
// print("$BMI in submit acttion");
    setState(() {});
    _height.clear();
  }
}
