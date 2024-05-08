import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_auth/component/authlogo.dart';
import 'package:flutter_application_auth/component/customButtonAuth.dart';
import 'package:flutter_application_auth/component/customTextfield.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email= TextEditingController();
    TextEditingController password= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50,),
               AuthLogo(),
               Container(height: 20,),
               Text("LOGIN",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
               Container(height: 10,),
               Text("Login to use the app",style: TextStyle(fontSize: 20,color: Colors.grey),),
                Container(height: 20,),
               Text("Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 Container(height: 8,),

              CustomTextField(hinttext: "Enter your email", mycontroller: email),
                Container(height: 8,),
               Text("Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
               Container(height: 8,),
                 CustomTextField(hinttext: "Enter your Password", mycontroller: password),
               Container(
                margin: EdgeInsets.only(top: 10,bottom: 20),
                alignment: Alignment.topRight,
                child: Text("Forgot your password?")),
              ],
               ),
              CustomButtonAuth(title: "LOGIN",onPressed: () async {
try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email.text,
    password: password.text,
  );
  Navigator.of(context).pushNamed("homepage");
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}
,),
                Container(height: 10,),
                Center(child: Text("OR LOGIN WITH")),
                Container(height: 10,),
              MaterialButton(
                height: 40,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
                color: Colors.red[700],
                onPressed: (){},child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LOGIN ",style: TextStyle(fontSize: 20),),
                    Image.asset("images/g.jpg",width: 30,),
                  ],
                ),),
                Container(height: 10,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("signup");
                  },
                  child: Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: "Don't have an account? ",style: TextStyle(fontSize: 18,color: Colors.black),),
                      TextSpan(text: "Register ",style: TextStyle(fontSize: 18,color: Colors.orange),)
                    
                    ])),
                  ),
                )

          ],
        ),
      ),
    );
  }
}