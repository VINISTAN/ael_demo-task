/*
This dart file contains mobile controller page.
This page has list of widgets and its properties.
This page has 4 existing lists.
We can add item to this list using clicking + button
We can remove item from this list using left swipe
 */




import 'package:ael_task/view/screens/controller_tabs/reusable_widgets_controllertabs/alertdilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class FridgeController extends StatefulWidget {
  const FridgeController({Key? key}) : super(key: key);

  @override
  State<FridgeController> createState() => _FridgeControllerState();
}

class _FridgeControllerState extends State<FridgeController> {
  static List<String> fridge_name = ["Samsung","LG","ONIDA","Shine"];
  static List<String> fridge_price = ["34000","35000","36000","37000"];
  static List<String> fridge_model = ["S123","R123","O123","V123"];
  static List<String> details = ["2020 Manufacture","2021 Manufacture","2020 Manufacture","2018 Manufacture"];
  TextEditingController fridgename_controller = new TextEditingController();
  TextEditingController fridgeprice_controller = new TextEditingController();
  TextEditingController fridgemodel_controller = new TextEditingController();
  TextEditingController fridgedetails_controller = new TextEditingController();

  void addItemToList(){
    setState(() {
      fridge_name.insert(0,fridgename_controller.text);
      fridge_price.insert(0,fridgeprice_controller.text);
      fridge_model.insert(0, fridgemodel_controller.text);
      details.insert(0, fridgedetails_controller.text);
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
              itemCount: fridge_name.length,
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
                            fridge_name.removeAt(index);
                            fridge_model.removeAt(index);
                            fridge_price.removeAt(index);
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
                                Text('${fridge_name[index]}'),
                                Text('${fridge_price[index]}'),
                                Text('${fridge_model[index]}')
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
                  namehint: 'Fridge Name',
                  modelhint: 'Fridge Model',
                  pricehint: 'Fridge Price',
                  detailshint: 'Details',
                  nametextcontroller: fridgename_controller,
                  pricetextcontroller: fridgeprice_controller,
                  modeltextcontroller: fridgemodel_controller,
                  detailstextcontroller: fridgedetails_controller,
                );
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

