import 'package:ai_diet_firebase/net/generatingdiet.dart';
import 'package:ai_diet_firebase/net/userinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:intl/intl.dart';

final user= FirebaseAuth.instance.currentUser!;
String currentuser= user.email!.toString() ;
final idUsers= FirebaseFirestore.instance.collection("users").doc(currentuser);





Future<bool> SignUp(String email, String password, String name, String phonenumber) async {
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password:password);
    //add user details
    addUserDetails(
        name,
        int.parse(phonenumber),
        email,

    );
    return true;

  } on FirebaseAuthException catch (e) {
    if(e.code == 'weak-password') {
      print('The password provided is too weak.');
    }else if (e.code == 'email-already-in-use'){
      print('The account already exists for that email.');
    }
    return false;
  }catch (e){
    print(e.toString());
    return false;
  }
}

Future addUserDetails(String name, int phonenumber,String email) async{
  await idUsers.set({
    "email": email,
    "Name": name ,
    "phone number": phonenumber,
  });



}





Future <bool> addUserInfo(String dateOfBirth, String weight, String height, String gender) async{
  agecalc(dateOfBirth);
  double BMI =(double.parse(weight)/((double.parse(height)/100)*(double.parse(height)/100)));
  String temp= BMI.toStringAsPrecision(4);
  BMI=double.parse(temp);
  double BMR;
  if(gender=="male")
  {
    BMR=(10*double.parse(weight))+(6.25*double.parse(height))-(5*age)+5;
  }
  else{
    BMR=(10*double.parse(weight))+(6.25*double.parse(height))-(5*age)-161;
  }
  String temp1= BMR.toStringAsPrecision(4);
  BMR=double.parse(temp1);
  await idUsers.update({
    "date of birth": dateOfBirth,
    "age": age,
    "weight": double.parse(weight) ,
    "height": double.parse(height),
    "Gender":gender,
    "BMI":BMI,
    "BMR":BMR,
    "Date":formattedDate,
    "consumed calories":0,
  });
  return true;
}

String formattedDate='';
int age=0;
int agecalc (String DOB)
{
  var list=DOB.split('/');

  int month=int.parse(list[0]);
  int day=int.parse(list[1]);
  int year=int.parse(list[2]);

  var now = new DateTime.now();
  var formatter = new DateFormat('MM/dd/yyyy');
  formattedDate = formatter.format(now);

  var list1=formattedDate.split('/');

  int month1=int.parse(list1[0]);
  int day1=int.parse(list1[1]);
  int year1=int.parse(list1[2]);

  age=year1-year;
  age=age-1;

  if(month<month1 || month==month1 && day<=day1)
  {
    age=age+1;
  }

  return age;

}





Future <bool> addTarWe(double weight) async{
  await idUsers.update({
    "Target Weight": weight
  });
  return true;
}


Future <bool> addactivity(String activitylevel) async{
  final doc1 = await idUsers.get();
  final data1 = doc1.data() as Map<String, dynamic>;
  double weight=data1["weight"];
  double target=data1["Target Weight"];
  double bmr=data1["BMR"];
  double calories=0;
  double watertarget=0;

  if(activitylevel=="")
    {
      activitylevel=data1["Activity Level"];
    }
  
  if(activitylevel=="No Activity")
    {
      if(weight>target)
        {
          calories=bmr*1.2;
          calories=calories*0.76;
        }
      else if(weight<target)
        {
          calories=bmr*1.2+400;
        }
      else if(weight==target)
        {
          calories=bmr*1.2;
        }
      watertarget=weight/30;
      watertarget=watertarget*1000;
    }
  else if(activitylevel=="Once a Week")
    {
      if(weight>target)
      {
        calories=bmr*1.375;
        calories=calories*0.76;

      }
      else if(weight<target)
      {
        calories=bmr*1.375+400;
      }
      else if(weight==target)
      {
        calories=bmr*1.375;
      }
      watertarget=(weight/30);
      watertarget=watertarget*1000+350;

    }
  else if(activitylevel=="2 to 3 Times a Week")
  {
    if(weight>target)
    {
      calories=bmr*1.55;
      calories=calories*0.76;
    }
    else if(weight<target)
    {
      calories=bmr*1.55+400;
    }
    else if(weight==target)
    {
      calories=bmr*1.55;
    }
    watertarget=(weight/30);
    watertarget=watertarget*1000+1050;
  }
  else if(activitylevel=="4 to 5 Times a Week")
  {
    if(weight>target)
    {
      calories=bmr*1.725;
      calories=calories*0.76;
    }
    else if(weight<target)
    {
      calories=bmr*1.725+400;
    }
    else if(weight==target)
    {
      calories=bmr*1.725;
    }
    watertarget=(weight/30);
    watertarget=watertarget*1000+1750;
  }




    await idUsers.update({
    "Activity Level": activitylevel,
      "calories":calories.toInt(),
      "water target":watertarget.toInt(),
      "water consumed":0,
  });
  return true;
}


Future addDiet(String diet) async {
  await idUsers.update({
    "Diet Type": diet,
  });
  return true;

}
Future addAllergies(String dairy,String nuts) async {

  if(nuts=="Nut Allergy"&&dairy=="Dairy Allergy")
    {
      await idUsers.update({
        "allergy1":"nuts product",
        "allergy2":"dairy product",
        "Diet Set": false,
        "difference":0,
      });
    }
  else if(nuts=="Nut Allergy")
    {
      await idUsers.update({
        "allergy1":"nuts product",
        "Diet Set": false,
        "difference":0,
      });
    }
  else if(dairy=="Dairy Allergy")
    {
      await idUsers.update({
        "allergy2":"dairy product",
        "Diet Set": false,
        "difference":0,
      });
    }
  else
    {
      await idUsers.update({
        "Diet Set": false,
        "difference":0,
      });
    }

  GeneratingDiet();


  return true;

}