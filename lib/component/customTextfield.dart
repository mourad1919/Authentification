import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;

  const CustomTextField({super.key, required this.hinttext, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return  TextField(
                controller: mycontroller,
                decoration: InputDecoration(
                 hintText: hinttext,
                 hintStyle: TextStyle(color: Colors.grey),
                 filled: true,
                 fillColor: Colors.grey.shade200,
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 132)),
                 ),
                 enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.orange),
                 )
               ),);
  }
}