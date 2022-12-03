import 'package:ai_diet_firebase/profilescreen.dart';
import 'package:ai_diet_firebase/target_weight.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';

import 'net/flutterfire.dart';



class GetInfo extends StatefulWidget {
  const GetInfo({Key? key}) : super(key: key);

  @override
  State<GetInfo> createState() => _HomeState();
}

class _HomeState extends State<GetInfo> {
  TextEditingController _date = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _height = TextEditingController();
   String Gender1="male";



  @override
  Widget build(BuildContext context) {
    String sex = "";
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
//to here
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              //logo
              Container(
                width: w,
                height: h * 0.35,
                child: Image.asset('assets/logo.png'),
              ),

              //text under logo
              Container(
                child: Text(
                  'LET US GET TO KNOW YOU A BIT .....',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),

              //size box for space decoration
              SizedBox(
                height: 20,
              ),

              //Date OF BIRTH button
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  onPressed: () {},
                  child: Text('DATE OF BIRTH', style: TextStyle(fontSize: 21)),
                ),
              ),

              //DOB text field and ICon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 230,
                    padding: EdgeInsets.fromLTRB(29, 0, 0, 0),
                    child: TextFormField(
                      controller: _date,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        hintText: ' 02/28/1998',
                        border: UnderlineInputBorder(),
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        DateTime? pickedate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (pickedate != null) {
                          setState(() {
                            _date.text =
                                DateFormat("MM/dd/yyyy").format(pickedate);
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 50,
                  )
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //WEIGHT button
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 262, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  onPressed: () {},
                  child: Text('WEIGHT', style: TextStyle(fontSize: 21)),
                ),
              ),

              //WEIGHT text field and ICon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    padding: EdgeInsets.fromLTRB(29, 0, 0, 0),
                    child: TextFormField(
                      controller: _weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        hintText: ' 97 Kg',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.monitor_weight_sharp,
                    size: 50,
                  )
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //HEIGHT button
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 262, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  onPressed: () {},
                  child: Text('HEIGHT', style: TextStyle(fontSize: 21)),
                ),
              ),

              //HEIGHT text field and ICon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    padding: EdgeInsets.fromLTRB(29, 0, 0, 0),
                    child: TextFormField(
                      controller: _height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        hintText: ' 177 cm',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.height,
                    size: 50,
                  )
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //GEMDER button
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 262, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  onPressed: () {},
                  child: Text('GENDER', style: TextStyle(fontSize: 21)),
                ),
              ),

              //GENDER icons

              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                alignment: Alignment.center,
                child: GenderPickerWithImage(
                  showOtherGender: false,
                  verticalAlignedText: false,

                  // to show what's selected on app opens, but by default it's Male
                  selectedGender: Gender.Male,
                  selectedGenderTextStyle:
                  TextStyle(color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
                  unSelectedGenderTextStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                  onChanged: (Gender? gender) {
                    if(gender==Gender.Female)
                      {
                        Gender1="female";
                      }
                    else{
                      Gender1="Male";
                    }

                  },
                  //Alignment between icons
                  equallyAligned: true,

                  animationDuration: Duration(milliseconds: 300),
                  isCircular: true,
                  // default : true,
                  opacityOfGradient: 0.4,
                  padding: const EdgeInsets.all(3),
                  size: 50, //default : 40
                ),
              ),
              Divider(),
              Divider(
                thickness: 8.0,
              ),

              Container(
                padding: EdgeInsets.fromLTRB(300, 0, 0, 0),
                 child: IconButton(
                    onPressed: () async{
                      bool shouldNavigate =
                      await addUserInfo(
                          _date.text, _weight.text, _height.text,Gender1);
                      if(shouldNavigate){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTargetWeight(),
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward_outlined,
                      size: 50,
                    ),
                  )
              ),
              SizedBox(height: 10,)
            ],
          )
        ],
      ),
    );
  }
}








