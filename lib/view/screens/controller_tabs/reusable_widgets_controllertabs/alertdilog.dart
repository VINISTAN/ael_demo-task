import'package:flutter/material.dart';

import 'alertbox_textfield.dart';

class CustomAlertbox extends StatefulWidget {
  final GestureTapCallback onPressed;
  final TextEditingController nametextcontroller;
  final TextEditingController modeltextcontroller;
  final TextEditingController pricetextcontroller;
  final TextEditingController detailstextcontroller;



  final String namehint;
  final String modelhint;
  final String pricehint;
  final String detailshint;

  const CustomAlertbox({Key? key, required this.onPressed,
    required this.nametextcontroller,
    required this.namehint,
    required this.modelhint,
    required this.pricehint,
    required this.detailshint,
    required this.modeltextcontroller,
    required this.pricetextcontroller,
    required this.detailstextcontroller}) : super(key: key);

  @override
  State<CustomAlertbox> createState() => _CustomAlertboxState();
}

class _CustomAlertboxState extends State<CustomAlertbox> {
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              height: myheight/2,
              width: mywidth/1.1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add Item")
                      ],
                    ),
                    SizedBox(height: 10,),
                    MytextField(label: widget.namehint, hint: widget.namehint,textcontroller: widget.nametextcontroller,),
                    // TextField(
                    //   controller: widget.textcontroller,
                    //   decoration: InputDecoration(
                    //       hintText: widget.hint,
                    //
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20)
                    //       )
                    //   ),
                    // ),
                    SizedBox(height: 10,),
                    MytextField(label: widget.modelhint, hint: widget.modelhint,textcontroller: widget.modeltextcontroller,),
                    // TextField(
                    //   controller: widget.textcontroller,
                    //   decoration: InputDecoration(
                    //       hintText: widget.hint,
                    //
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20)
                    //       )
                    //   ),
                    // ),
                    SizedBox(height: 10,),
                    MytextField(label: widget.pricehint, hint: widget.pricehint,textcontroller: widget.pricetextcontroller,),
                    // TextField(
                    //   controller: widget.textcontroller,
                    //   decoration: InputDecoration(
                    //       hintText: 'Laptop Price',
                    //
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20)
                    //       )
                    //   ),
                    // ),
                    SizedBox(height: 10,),
                    MytextField(label: widget.detailshint, hint: widget.detailshint,textcontroller: widget.detailstextcontroller,),
                    // TextField(
                    //   controller: widget.textcontroller,
                    //   //controller: laptopdetails_controller,
                    //   decoration: InputDecoration(
                    //       hintText: 'Details',
                    //
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20)
                    //       )
                    //   ),
                    // ),
                    SizedBox(height: 10,),
                    Container(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: widget.onPressed,
                        //     onPressed: (){
                        //   addItemToList();
                        //   Navigator.pop(context);
                        // },
                            child: Text("Add")))
                  ],
                ),

              ),
            ),
          );
          }


  }

