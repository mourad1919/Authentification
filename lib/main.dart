import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_auth/auth/login.dart';
import 'package:flutter_application_auth/auth/signup.dart';
import 'package:flutter_application_auth/homepage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 FirebaseOptions firebaseOptions = const FirebaseOptions(
    apiKey: "AIzaSyDXU_BObFA4MnC4Z55XkkJVs2SRMC4m8js",
    appId: "1:520251107187:android:ac40eea7df9afe1746c706",
    messagingSenderId: "520251107187",
    projectId: "authcourse-f928c",
    storageBucket: "authcourse-f928c.appspot.com",
  );

  await Firebase.initializeApp(options: firebaseOptions);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
 @override
  void initState(){
    FirebaseAuth.instance
  .idTokenChanges()
  .listen((User? user) {
    if (user == null) {
      print('=====User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
    super.initState();
  }
 
  @override
 
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home: login(),
      routes: {"signup":(context) => SignUp(),
      "login":(context) => login(),
      "homepage":(context) => Homepage(),
      },
     
    );
  }
}