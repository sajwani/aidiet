import 'package:ai_diet_firebase/get_info.dart';
import 'package:ai_diet_firebase/net/flutterfire.dart';
import 'package:ai_diet_firebase/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController _emailField= TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Image.asset('assets/logo1.png',scale: 2.5,),
              ),
              // SizedBox(
              //   //height: 150,
              // ),
              Container(
                  color: Colors.lightBlue,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              SizedBox(
                // height: 20,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 50, 10, 0),
                  child: Text(
                      "Please enter your name"
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 7),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'FirstName LastName',
                  ),
                ),
              ),
              SizedBox(
                // height: 20,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 10, 0),
                  child: Text(
                      "Please Enter your Email"
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 7),
                child: TextField(
                  obscureText: false,
                  controller: _emailField,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                // height: 20,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 10, 0),
                  child: Text(
                      "Please Enter your Password"
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 7),
                child: TextField(
                  obscureText: true,
                  controller: _passwordField,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                // height: 20,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 10, 0),
                  child: Text(
                      "Please Enter your Phone Number"
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 7),
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,40,0,40),
                child:SizedBox(
                  height: 10.0,
                  child: new Center(
                    child: new Container(
                      margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                      height: 2.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              Container(
                  height: 60,
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: ()async {
                      bool shouldNavigate =
                      await SignUp(
                          _emailField.text
                          ,_passwordField.text
                          ,nameController.text
                          ,phoneController.text);
                      if(shouldNavigate) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GetInfo(),
                          ),
                        );
                      }

                    } ,
                  )),

              SizedBox(
                height: 56,
              )
            ],
          )),
    );
  }






}
