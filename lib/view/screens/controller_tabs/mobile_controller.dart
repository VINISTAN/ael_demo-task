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



class MobileController extends StatefulWidget {
  const MobileController({Key? key}) : super(key: key);

  @override
  State<MobileController> createState() => _MobileControllerState();
}

class _MobileControllerState extends State<MobileController> {
  static List<String> mobile_name = ["Samsung","Redmi","Oppo","Vivo"];
  static List<String> mobile_price = ["14000","15000","16000","17000"];
  static List<String> mobile_model = ["S123","R123","O123","V123"];
  static List<String> details = ["2020 Manufacture","2021 Manufacture","2020 Manufacture","2018 Manufacture"];
  TextEditingController mobilename_controller = new TextEditingController();
  TextEditingController mobileprice_controller = new TextEditingController();
  TextEditingController mobilemodel_controller = new TextEditingController();
  TextEditingController details_controller = new TextEditingController();

  void addItemToList(){
    setState(() {
      mobile_name.insert(0,mobilename_controller.text);
      mobile_price.insert(0,mobileprice_controller.text);
      mobile_model.insert(0, mobilemodel_controller.text);
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
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: mobile_name.length,
            itemBuilder: (BuildContext context, int index) {
              return ListView(
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                children: [
                  Slidable(
                  key: UniqueKey(),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {
                        setState((){
                          mobile_name.removeAt(index);
                          mobile_model.removeAt(index);
                          mobile_price.removeAt(index);
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
                    child:
                    ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          Text('${mobile_name[index]}'),
                          SizedBox(width: mywidth/8,),
                          Text('${mobile_price[index]}'),
                          SizedBox(width: mywidth/6,),
                          Text('${mobile_model[index]}')
                        ],
                      ),
                      children:  [
                        ListTile(
                          title: Text('${details[index]}'),
                        )
                      ],
                    )
              //       ListTile(
              //           leading: Text('${mobile_name[index]}',
              // style: TextStyle(fontSize: 18)),
              //           trailing:Text('${mobile_price[index]}',
              //               style: TextStyle(fontSize: 18)),
              //           title: Column(
              //             children: [
              //               Text('${mobile_name[index]}',
              //                   style: TextStyle(fontSize: 18)),
              //               Text('${mobile_model[index]}',
              //                   style: TextStyle(fontSize: 18)),
              //             ],
              //           )
              //       ),
                  ),
                ],
              );
            }),
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
                  namehint: 'Mobile Name',
                  modelhint: 'Mobile Model',
                  pricehint: 'Mobile Price',
                  detailshint: 'Details',
                  nametextcontroller: mobilename_controller,
                  pricetextcontroller: mobileprice_controller,
                  modeltextcontroller: mobilemodel_controller,
                  detailstextcontroller: details_controller,
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
void doNothing(BuildContext context) {

}

