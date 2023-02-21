import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  final List list;
  const ListScreen({Key? key, required this.list}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: heigth / 12,
          title: const Text(
            'RetriveData',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          centerTitle: false,
          backgroundColor: const Color(0xff0385BF),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  const Text(
                    "Restart",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  // SizedBox(
                  //   width: width / 70,
                  // ),
                  Image.asset(
                    'assets/images/ic-restart.png',
                    width: width / 15,
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xffF9F9F9),
        body: SingleChildScrollView(
            child: Column(
          children: List.generate(widget.list.length, (index) {
            List tempList = widget.list;
            dynamic item = tempList[index];
            return index % 2 == 0
                ? InkWell(
                    onTap: () => showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text(
                            'Are you sure you want to delete this data?'),
                        actions: <CupertinoDialogAction>[
                          CupertinoDialogAction(
                            
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ).copyWith(bottom: 0),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xffDFDFDF),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: heigth / 12,
                            width: heigth / 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffE6E6E6)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(item['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  item['address'],
                                  style: const TextStyle(
                                      color: Color(0xff858585),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffEBF6F1),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 29,
                                    vertical: 6,
                                  ),
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: Color(0xff03C560),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffF6EBEB),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 22,
                                    vertical: 6,
                                  ),
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                      color: Color(0xffC50303),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text(
                              'Are you sure you want to delete this data?'),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            ),
                            CupertinoDialogAction(
                              isDestructiveAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ).copyWith(bottom: 0),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xffDFDFDF),
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffEBF6F1),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 29,
                                    vertical: 6,
                                  ),
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: Color(0xff03C560),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffF6EBEB),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 22,
                                    vertical: 6,
                                  ),
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                      color: Color(0xffC50303),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  item['address'],
                                  style: const TextStyle(
                                      color: Color(0xff858585),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            height: heigth / 12,
                            width: heigth / 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffE6E6E6)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(item['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          }),
        )));
  }
}
