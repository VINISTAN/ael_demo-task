/*
This dart file contains watch controller page.
This page has list of widgets and its properties.
This page has 4 existing lists.
We can add item to this list using clicking + button
We can remove item from this list using left swipe
 */




import 'package:ael_task/view/screens/controller_tabs/reusable_widgets_controllertabs/alertdilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class WatchController extends StatefulWidget {
  const WatchController({Key? key}) : super(key: key);

  @override
  State<WatchController> createState() => _WatchControllerState();
}

class _WatchControllerState extends State<WatchController> {

  static List<String> watch_name = ["Rolex","avlon","Tissot","brace"];
  static List<String> watch_price = ["14000","15000","16000","17000"];
  static List<String> watch_model = ["S123","R123","O123","V123"];
  static List<String> details = ["2020 Manufacture","2021 Manufacture","2020 Manufacture","2018 Manufacture"];
  TextEditingController watchname_controller = new TextEditingController();
  TextEditingController watchprice_controller = new TextEditingController();
  TextEditingController watchmodel_controller = new TextEditingController();
  TextEditingController watchdetails_controller = new TextEditingController();

  void addItemToList(){
    setState(() {
      watch_name.insert(0,watchname_controller.text);
      watch_price.insert(0,watchprice_controller.text);
      watch_model.insert(0, watchmodel_controller.text);
      details.insert(0, watchdetails_controller.text);
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
              itemCount: watch_name.length,
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
                            watch_name.removeAt(index);
                            watch_model.removeAt(index);
                            watch_price.removeAt(index);
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
                      child:  ExpansionTile(
                        title: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                Text('${watch_name[index]}'),
                                Text('${watch_price[index]}'),
                                Text('${watch_model[index]}')
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
                  namehint: 'Watch Name',
                  modelhint: 'Watch Model',
                  pricehint: 'Watch Price',
                  detailshint: 'Details',
                  nametextcontroller: watchname_controller,
                  pricetextcontroller: watchprice_controller,
                  modeltextcontroller: watchmodel_controller,
                  detailstextcontroller: watchdetails_controller,
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

