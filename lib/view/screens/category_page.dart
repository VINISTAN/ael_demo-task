/*
This dart file is the root of controller tab
The control comes here directly after main function load.
It has 5 tabs and their controlls
This is the default tab to show the widgets
 */
import'package:flutter/material.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

import 'controller_tabs/ac_controller.dart';
import 'controller_tabs/fridge_controller.dart';
import 'controller_tabs/laptop_controller.dart';
import 'controller_tabs/mobile_controller.dart';
import 'controller_tabs/watch_controller.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vinistan"),
        leading: Row(
          children: [
            Flexible(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: DefaultTabController(length: 5,
        child:Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SegmentedTabControl(
                // Customization of widget
                radius: const Radius.circular(3),
                backgroundColor: Colors.grey.shade300,
                indicatorColor: Colors.orange.shade200,
                tabTextColor: Colors.black45,
                selectedTabTextColor: Colors.white,
                squeezeIntensity: 2,
                height: 45,
                tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                textStyle: Theme.of(context).textTheme.bodyText1,
                // Options for selection
                // All specified values will override the [SegmentedTabControl] setting
                tabs: [
                  SegmentTab(
                    label: 'Mobile',
                    // For example, this overrides [indicatorColor] from [SegmentedTabControl]
                    color: Colors.red.shade200,
                  ),
                  SegmentTab(
                    label: 'Laptop',
                    backgroundColor: Colors.blue.shade100,
                    selectedTextColor: Colors.black45,
                    textColor: Colors.black26,
                  ),
                  SegmentTab(
                    label: 'AC',
                    backgroundColor: Colors.blue.shade100,
                    selectedTextColor: Colors.black45,
                    textColor: Colors.black26,
                  ),
                  SegmentTab(
                    label: 'Fridge',
                    backgroundColor: Colors.blue.shade100,
                    selectedTextColor: Colors.black45,
                    textColor: Colors.black26,
                  ),
                  const SegmentTab(label: 'Watch'),
                ],
              ),
            ),
            // Sample pages
             const Padding(
              padding:  EdgeInsets.only(top: 70),
              child: TabBarView(
                physics:  BouncingScrollPhysics(),
                children: [
                  MobileController(),
                  LaptopController(),
                  ACController(),
                  FridgeController(),
                  WatchController()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
