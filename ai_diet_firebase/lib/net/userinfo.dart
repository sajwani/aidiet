import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'flutterfire.dart';
import 'generatingdiet.dart';

Future<DocumentSnapshot<Map<String, dynamic>>> futuredoc=GeteName();


Future<DocumentSnapshot<Map<String, dynamic>>> GeteName() async{
   final doc = await idUsers.get();
   return doc;
//   final data = doc.data() as Map<String, dynamic>;
//   //userName=(data["Name"]).toString()+"";
//   return data["Name"].toString();
 }




Widget GetName(){
  return FutureBuilder<DocumentSnapshot>(
    future: futuredoc,
    builder: (context,snapshot){
      if(snapshot.hasError){
        return Text("${snapshot.error}");
      }else if(snapshot.hasData){
        final doc = snapshot.data!;
        final data = doc.data() as Map?;
        final lll=data!["Name"] as String;
        //String nnn=lll;
        return Text(
          //nnn, or
          lll,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        );
      }

      return const CircularProgressIndicator();
    },
  );
}


Widget GetH(){
  return FutureBuilder<double>(
    future: geth(),
    builder: (context,snapshot){
      if(snapshot.hasError){
        return Text("${snapshot.error}");
      }else if(snapshot.hasData){

        double height=snapshot.data!;
        return Text(
          height.toString(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        );
      }

      return const CircularProgressIndicator();
    },
  );
}

Future<double> geth()async{
  final doc1 = await idUsers.get();
  final data1 = doc1.data() as Map<String, dynamic>;

  return data1["height"];
}

Widget GetW(){
  return FutureBuilder<double>(
    future: getw(),
    builder: (context,snapshot){
      if(snapshot.hasError){
        return Text("${snapshot.error}");
      }else if(snapshot.hasData){
        double weight=snapshot.data!;
        return Text(
          weight.toString(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        );
      }

      return const CircularProgressIndicator();
    },
  );
}

Future<double> getw()async{
  final doc1 = await idUsers.get();
  final data1 = doc1.data() as Map<String, dynamic>;

  return data1["weight"];
}


int age=1;
Widget GetAge(){
  return FutureBuilder<int>(
    future: setage(),
    builder: (context,snapshot){
      if(snapshot.hasError){
        return Text("${snapshot.error}");
      }else if(snapshot.hasData){
        int age=snapshot.data!;
        return Text(
          age.toString(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        );
      }

      return const CircularProgressIndicator();
    },
  );
}

Future<int> setage()async{
  final doc1 = await idUsers.get();
  final data1 = doc1.data() as Map<String, dynamic>;
  final DOB=data1["date of birth"] as String;
  age=agecalc(DOB);

  if(data1["age"]!=age)
  {
    await idUsers.update({
      "age": age,
      "Diet Set":false,
    });
    await calcBMI();
    await calcBMR();
    await addactivity("");
    await GeneratingDiet();
    return age;
  }
  else
  {
    return age;
  }



  //print(age.toString()+"this in set age");
}


double BMI=0.0;
Widget GetBMI(){
  return FutureBuilder<double>(
    future: calcBMI(),
    builder: (context,snapshot){
      if(snapshot.hasError){
        return Text("${snapshot.error}");
      }else if(snapshot.hasData){


        return Text(
          BMI.toStringAsPrecision(4),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        );
      }

      return const CircularProgressIndicator();
    },
  );
}

Future<double> calcBMI()async{

  final doc1 = await idUsers.get();
  final data1 = doc1.data() as Map<String, dynamic>;

  final height=data1["height"] as double;
  final weight=data1["weight"] as double;
  BMI=(weight/((height/100)*(height/100)));
  String temp= BMI.toStringAsPrecision(4);
  BMI=double.parse(temp);
  await idUsers.update({
    "BMI": BMI,
  });
  return BMI;
}


double BMR=0.0;
Widget GetBMR(){
  return FutureBuilder<double>(
    future: calcBMR(),
    builder: (context,snapshot){
      if(snapshot.hasError){
        return Text("${snapshot.error}");
      }else if(snapshot.hasData){


        return Text(
          BMR.toStringAsPrecision(4),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        );
      }

      return const CircularProgressIndicator();
    },
  );
}

Future<double> calcBMR()async{
  final doc1 = await idUsers.get();
  final data1 = doc1.data() as Map<String, dynamic>;

  final height=data1["height"] as double;
  final weight=data1["weight"] as double;
  final gender=data1["Gender"] as String;
  if(gender=="male")
  {
    BMR=(10*weight)+(6.25*height)-(5*age)+5;
  }
  else{
    BMR=(10*weight)+(6.25*height)-(5*age)-161;
  }
  String temp= BMR.toStringAsPrecision(4);
  BMR=double.parse(temp);
  await idUsers.update({
    "BMR": BMR,
  });
  return BMR;
}
