import 'package:ai_diet_firebase/activitylevel.dart';
import 'package:ai_diet_firebase/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import 'net/flutterfire.dart';



class AddTargetWeight extends StatefulWidget {
  const AddTargetWeight({Key? key}) : super(key: key);
  @override
  _AddTargetWeightState createState() => _AddTargetWeightState();
}

class _AddTargetWeightState extends State<AddTargetWeight> {
  late WeightSliderController _controller;
  double _weight = 30.0;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: _weight, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Column(
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
                  'WHAT IS YOUR TARGET WEIGHT?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                height: 200.0,
                alignment: Alignment.center,
                child: Text(
                  "${_weight.toStringAsFixed(1)} kg",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
                ),
              ),
              VerticalWeightSlider(
                controller: _controller,
                decoration: const PointerDecoration(
                  width: 130.0,
                  height: 3.0,
                  largeColor: Color(0xFF898989),
                  mediumColor: Color(0xFFC5C5C5),
                  smallColor: Color(0xFFF0F0F0),
                  gap: 30.0,
                ),
                onChanged: (double value) {
                  setState(() {
                    _weight = value;
                  });
                },
                indicator: Container(
                  height: 3.0,
                  width: 200.0,
                  alignment: Alignment.centerLeft,
                  color: Colors.red[300],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(300, 0, 0, 0),
              child: IconButton(
                onPressed: () async{
                  bool shouldNavigate =
                  await addTarWe(
                     _weight);
                  if(shouldNavigate){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActvityLevell(),
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
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
