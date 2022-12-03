import 'package:ai_diet_firebase/diet_tpye.dart';
import 'package:ai_diet_firebase/profilescreen.dart';
import 'package:ai_diet_firebase/showoptions.dart';
import 'package:flutter/material.dart';

import 'net/flutterfire.dart';

const List<Widget> activty = <Widget>[
  Text('No Activity',
    style: TextStyle(
        fontSize: 25
    ),),
  Text('Once a Week',
    style: TextStyle(
        fontSize: 25
    ),),
  Text('2 to 3 Times a Week',
    style: TextStyle(
        fontSize: 25
    ),),
  Text("4 to 5 Times a Week",
    style: TextStyle(
        fontSize: 25
    ),)
];



class ActvityLevell extends StatefulWidget {
  const ActvityLevell({super.key, });



  @override
  State<ActvityLevell> createState() => _ActvityLevellState();
}

class _ActvityLevellState extends State<ActvityLevell> {
  final List<bool> _selectedFruits = <bool>[false, false, false,false];
  String activitylevel="";

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
          Container(
            child: Text(
              'WHAT ARE YOUR PHYSICAL ACTIVITY LEVELS PER WEEK?..',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),


          SizedBox(
            height: 30,
          ),

          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ToggleButtons with a single selection.

              ToggleButtons(
                direction:  Axis.vertical ,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedFruits.length; i++) {
                      _selectedFruits[i] = i == index;


                    }
                    if(index==0)
                    {
                      activitylevel="No Activity";
                    }
                    else if(index==1)
                    {
                      activitylevel="Once a Week";
                    }
                    else if(index==2)
                    {
                      activitylevel="2 to 3 Times a Week";
                    }
                    else if(index==3)
                    {
                      activitylevel="4 to 5 Times a Week";
                    };


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


          Container(
            padding: EdgeInsets.fromLTRB(300, 0, 0, 0),
            child: IconButton(
              onPressed: () async{
                bool shouldNavigate =
                await addactivity(
                    activitylevel);
                if(shouldNavigate){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DietType(),
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
