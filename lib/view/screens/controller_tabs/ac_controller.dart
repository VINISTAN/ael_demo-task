/*
This dart file contains AC controller page.
This page has list of widgets and its properties.
This page has 4 existing lists.
We can add item to this list using clicking + button
We can remove item from this list using left swipe
 */



import 'package:ael_task/view/screens/controller_tabs/reusable_widgets_controllertabs/alertdilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ACController extends StatefulWidget {
  const ACController({Key? key}) : super(key: key);

  @override
  State<ACController> createState() => _ACControllerState();
}

class _ACControllerState extends State<ACController> {

  static List<String> ac_name = ["ONIDA","LG","Haier","shine"];
  static List<String> ac_price = ["14000","15000","16000","17000"];
  static List<String> ac_model = ["S123","R123","O123","V123"];
  static List<String> details = ["2020 Manufacture","2021 Manufacture","2020 Manufacture","2018 Manufacture"];
  TextEditingController acname_controller = new TextEditingController();
  TextEditingController acprice_controller = new TextEditingController();
  TextEditingController acmodel_controller = new TextEditingController();
  TextEditingController details_controller = new TextEditingController();

  void addItemToList(){
    setState(() {
      ac_name.insert(0,acname_controller.text);
      ac_price.insert(0,acprice_controller.text);
      ac_model.insert(0, acmodel_controller.text);
      details.insert(0, details_controller.text);
    });
  }


  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Container(
        height: myheight/1.2,
        child: SingleChildScrollView(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: ac_name.length,
              itemBuilder: (BuildContext context, int index) {
                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Slidable(
                      key: UniqueKey(),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {
                          setState((){
                            ac_name.removeAt(index);
                            ac_model.removeAt(index);
                            ac_price.removeAt(index);
                            details.removeAt(index);
                          });
                        }),
                        children: const [
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ExpansionTile(
                        title: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                Text('${ac_name[index]}'),
                                Text('${ac_price[index]}'),
                                Text('${ac_model[index]}')
                              ],
                            ),


                          ],
                        ),
                        children:  [
                          ListTile(
                            title: Text('${details[index]}'),
                          )
                        ],
                      )
                    ),
                  ],
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          showDialog(
              context: context,
              builder: (BuildContext context){
                 return CustomAlertbox(
                  onPressed: () {
                    addItemToList();
                    Navigator.pop(context);
                  },
                  namehint: 'Ac Name',
                  modelhint: 'Ac Model',
                  pricehint: 'Ac Price',
                  detailshint: 'Details',
                  nametextcontroller: acname_controller,
                  pricetextcontroller: acprice_controller,
                  modeltextcontroller: acmodel_controller,
                  detailstextcontroller: details_controller,
                );
                // return  Dialog(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20)
                //   ),
                //   child: Container(
                //     height: myheight/2,
                //     width: mywidth/1.1,
                //     child: Padding(
                //       padding: const EdgeInsets.all(12.0),
                //       child: Column(
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text("Add Item")
                //             ],
                //           ),
                //           SizedBox(height: 10,),
                //           TextField(
                //             controller: acname_controller,
                //             decoration: InputDecoration(
                //                 hintText: 'AC Name',
                //
                //                 enabledBorder: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(20)
                //                 )
                //             ),
                //           ),
                //           SizedBox(height: 10,),
                //           TextField(
                //             controller: acmodel_controller,
                //             decoration: InputDecoration(
                //                 hintText: 'AC Model',
                //
                //                 enabledBorder: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(20)
                //                 )
                //             ),
                //           ),
                //           SizedBox(height: 10,),
                //           TextField(
                //             controller: acprice_controller,
                //             decoration: InputDecoration(
                //                 hintText: 'AC Price',
                //
                //                 enabledBorder: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(20)
                //                 )
                //             ),
                //           ),
                //           SizedBox(height: 10,),
                //           TextField(
                //             controller: details_controller,
                //             decoration: InputDecoration(
                //                 hintText: 'Details',
                //
                //                 enabledBorder: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(20)
                //                 )
                //             ),
                //           ),
                //           SizedBox(height: 10,),
                //           Container(
                //               height: 30,
                //               width: 100,
                //               child: ElevatedButton(onPressed: (){
                //                 addItemToList();
                //                 Navigator.pop(context);
                //               }, child: Text("Add")))
                //         ],
                //       ),
                //
                //     ),
                //   ),
                // );
              }
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

void doNothing(BuildContext context) {}

