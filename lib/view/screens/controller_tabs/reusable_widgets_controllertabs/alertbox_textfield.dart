/*
This dart file contains reusable widget called Textfield
It has required properties like hint and label name and controller

*/


import'package:flutter/material.dart';

class MytextField extends StatefulWidget {
  final String label;
  final String hint;
  final bool? obscureText;
  final TextEditingController? textcontroller;
  MytextField({Key? key, required this.label, required this.hint,  this.textcontroller,this.obscureText}) : super(key: key);

  @override
  State<MytextField> createState() => _MytextFieldState();
}

class _MytextFieldState extends State<MytextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/16,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.label,
          hintText: widget.hint,
        ),
        controller: widget.textcontroller,
        style: TextStyle(color: Colors.black),


      ),
    );
  }
}
