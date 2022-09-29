/*
This dart file contains Laptop controller page.
This page has list of widgets and its properties.
This page has 4 existing lists.
We can add item to this list using clicking + button
We can remove item from this list using left swipe
 */
import 'package:ael_task/view/screens/controller_tabs/reusable_widgets_controllertabs/alertdilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LaptopController extends StatefulWidget {
  const LaptopController({Key? key}) : super(key: key);

  @override
  State<LaptopController> createState() => _LaptopControllerState();
}

class _LaptopControllerState extends State<LaptopController> {
  void addItemToList() {
    setState(() {
      laptop_name.insert(0, laptopname_controller.text);
      laptop_price.insert(0, laptopprice_controller.text);
      laptop_model.insert(0, laptopmodel_controller.text);
      details.insert(0, laptopdetails_controller.text);
    });
  }

  static List<String> laptop_name = ["Dell", "Hp", "Apple", "Acer"];
  static List<String> laptop_price = ["34000", "35000", "36000", "37000"];
  static List<String> laptop_model = ["i5", "i6", "i7", "i8"];
  static List<String> details = [
    "2020 Manufacture",
    "2021 Manufacture",
    "2020 Manufacture",
    "2018 Manufacture"
  ];

  TextEditingController laptopname_controller = new TextEditingController();
  TextEditingController laptopprice_controller = new TextEditingController();
  TextEditingController laptopmodel_controller = new TextEditingController();
  TextEditingController laptopdetails_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: myheight / 1.2,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: laptop_name.length,
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
                          setState(() {
                            laptop_name.removeAt(index);
                            laptop_model.removeAt(index);
                            laptop_price.removeAt(index);
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
                              children: [
                                Text('${laptop_name[index]}'),
                                Text('${laptop_price[index]}'),
                                Text('${laptop_model[index]}')
                              ],
                            ),
                          ],
                        ),
                        children: [
                          ListTile(
                            title: Text('${details[index]}'),
                          )
                        ],
                      )
                      // ListTile(
                      //     leading: Icon(Icons.list),
                      //     trailing: Text(
                      //       "GFG",
                      //       style: TextStyle(color: Colors.green, fontSize: 15),
                      //     ),
                      //     title: Text("Laptop Items")),
                      ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertbox(
                    onPressed: () {
                      addItemToList();
                      Navigator.pop(context);
                    },
                    namehint: 'Laptop Name',
                    modelhint: 'Laptop Model',
                    pricehint: 'Laptop Price',
                    detailshint: 'Details',
                  nametextcontroller: laptopname_controller,
                  pricetextcontroller: laptopprice_controller,
                  modeltextcontroller: laptopmodel_controller,
                  detailstextcontroller: laptopdetails_controller,
                );
              });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
