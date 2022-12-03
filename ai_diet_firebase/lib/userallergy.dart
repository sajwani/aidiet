import 'package:ai_diet_firebase/net/flutterfire.dart';
import 'package:ai_diet_firebase/showoptions.dart';
import 'package:flutter/material.dart';

import 'net/generatingdiet.dart';

class UserAllergy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Checkbox Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, bool?> allergee = {
    'Dairy Allergy': false,
    'Nut Allergy': false,
  };

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: w,
            height: h * 0.28,
            child: Image.asset('assets/logo.png'),
          ),
          Divider(
            height: 6,
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text('do you have any of the following allergies?..',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.black)),
          ),
          Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: allergee.keys
                      .map((allergyName) => CheckboxListTile(
                    title: Text(allergyName),
                    value: allergee[allergyName],
                    onChanged: (bool? value) {
                      setState(() {
                        allergee[allergyName] = value;
                      });
                      //print(allergee["Dairy Allergy"]);
                    },
                  ))
                      .toList(),
                ),
              ),
              flex: 1),
          Container(
            padding: EdgeInsets.fromLTRB(300, 0, 0, 25),
            child: IconButton(
              alignment: Alignment.bottomRight,
              onPressed: () async {
                if(allergee["Dairy Allergy"]==true&&allergee["Nut Allergy"]==true)
                {
                  await addAllergies("Dairy Allergy", "Nut Allergy");
                }
                else if(allergee["Nut Allergy"]==true)
                {
                  await addAllergies("", "Nut Allergy");
                }
                else if(allergee["Dairy Allergy"]==true)
                {
                  await addAllergies("Dairy Allergy", "");
                }
                else
                {
                  await addAllergies("", "");
                }

                await setConsumedCalories(true,0,false);
                await setConsumedWater(true,0,false);

                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowOptions(),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.arrow_forward_outlined,
                size: 50,
              ),
            ),
          ),
        ]));
  }
}