import 'package:ai_diet_firebase/password_reset.dart';
import 'package:ai_diet_firebase/showoptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:ai_diet_firebase/profilescreen.dart';
import 'package:ai_diet_firebase/register.dart';

import 'net/generatingdiet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return LoginScreen();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginusingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                width: w,
                height: h * 0.48,
                child: Image.asset('assets/logo.png'),
              ),
              Container(
                child: Text(
                  'Ready to be healthy?',
                  style: TextStyle(
                    fontSize: 38.5,
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    hintText: 'Name.Last@gmail.com',
                    border: UnderlineInputBorder(),
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Icon(Icons.mail),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    hintText: 'password',
                    border: UnderlineInputBorder(),
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgotPasswordPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 27),
                ),
                onPressed: () async {
                  User? user = await loginusingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    await setCheckbox1();
                    await setConsumedCalories(true, 0, false);
                    await setConsumedWater(
                        true, 0, false); //we are tying without await
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ShowOptions()));
                  }
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Sign in With Google',
                        style: TextStyle(fontSize: 21)), // <-- Text
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      // <-- Icon
                      Icons.android, //Google.g1,
                      size: 25.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: w * 0.763,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  icon: Icon(Icons.apple, size: 30),
                  label: Text(
                    "Sign in With Apple",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
