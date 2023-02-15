import 'package:flutter/material.dart';
import 'package:interview_project/person_detail_screen.dart';
import 'package:interview_project/utils/constant.dart';

import 'list_screen.dart';

class BottomNavigation extends StatefulWidget {
  final int intialIndex;
  final List list;

  const BottomNavigation(
      {Key? key, required this.intialIndex, required this.list})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  late List<Widget> _widgetOptions;
  @override
  void initState() {
    selectedIndex = widget.intialIndex;
    _widgetOptions = <Widget>[
      const FormScreen(),
      ListScreen(
        list: widget.list,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  height: 20,
                  child: Image.asset(formIcon,
                      color:
                          selectedIndex == 0 ? primaryColor : secondaryColor),
                ),
              ),
              label: 'Form'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  height: 20,
                  child: Image.asset(listIcon,
                      color:
                          selectedIndex == 1 ? primaryColor : secondaryColor),
                ),
              ),
              label: 'List'),
        ],
        onTap: (int index) {
          setState(() => selectedIndex = index);
        },
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      body: _widgetOptions.elementAt(selectedIndex),
    );
  }
}
