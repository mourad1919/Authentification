import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_auth/component/authlogo.dart';
import 'package:flutter_application_auth/component/customButtonAuth.dart';
import 'package:flutter_application_auth/component/customTextfield.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   TextEditingController email= TextEditingController();
    TextEditingController password= TextEditingController();
    TextEditingController username = TextEditingController();


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
               Text("SignUp",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
               Container(height: 10,),
               Text("SignUp to create an account",style: TextStyle(fontSize: 20,color: Colors.grey),),
                Container(height: 20,),
               Text("Username",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 Container(height: 8,),

              CustomTextField(hinttext: "Username", mycontroller: username),
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
              CustomButtonAuth(title: "SignUp",
              onPressed:()async{
                try {
                 final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                 email: email.text,
                 password: password.text,
                  );
                  Navigator.of(context).pushReplacementNamed("homepage");
                } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
                 }
                } catch (e) {
                print(e);
                }

              }),
             
                Container(height: 10,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  child: Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: " have an account? ",style: TextStyle(fontSize: 18,color: Colors.black),),
                      TextSpan(text: "Login",style: TextStyle(fontSize: 18,color: Colors.orange),)
                    
                    ])),
                  ),
                )

          ],
        ),
      ),
    );
  }
}
