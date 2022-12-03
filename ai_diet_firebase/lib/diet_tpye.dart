
import 'package:ai_diet_firebase/profilescreen.dart';
import 'package:ai_diet_firebase/showoptions.dart';
import 'package:ai_diet_firebase/userallergy.dart';
import 'package:flutter/material.dart';

import 'net/flutterfire.dart';

const List<Widget> activty = <Widget>[
  Text(
    'Normal',
    style: TextStyle(fontSize: 25),
  ),
  Text(
    'Keto',
    style: TextStyle(fontSize: 25),
  ),
  Text(
    'Vegan',
    style: TextStyle(fontSize: 25),
  ),
];

class DietType extends StatefulWidget {
  const DietType({
    super.key,
  });

  @override
  State<DietType> createState() => _DietType();
}

class _DietType extends State<DietType> {
  final List<bool> _selectedFruits = <bool>[false, false, false];
  String dietType = "";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
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
            child: Text(
              'CHOOSE YOUR DIET PLAN TYPE!..',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // ToggleButtons with a single selection.

                ToggleButtons(
                  direction: Axis.vertical,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedFruits.length; i++) {
                        _selectedFruits[i] = i == index;
                      }
                      if (index == 0) {
                        dietType = "Normal Diet";
                      } else if (index == 1) {
                        dietType = "Keto Diet";
                      } else if (index == 2) {
                        dietType = "Vegan Diet";
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.blueAccent,
                  selectedColor: Colors.white,
                  fillColor: Colors.blueAccent,
                  color: Colors.black,
                  constraints: const BoxConstraints(
                    minHeight: 70.0,
                    minWidth: 300.0,
                  ),
                  isSelected: _selectedFruits,
                  children: activty,
                ),
                const SizedBox(height: 0),
                // ToggleButtons with a multiple selection.
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(300, 0, 0, 0),
            child: IconButton(
              alignment: Alignment.bottomRight,
              onPressed: () async {
                bool shouldNavigate =
               await addDiet(dietType);
                if (shouldNavigate) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserAllergy(),
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
        ],
      ),
    );
  }
}
