import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'bottom_navigation.dart';
import 'common_textfild/common_text_fild.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

List _addedUser = [];

class _FormScreenState extends State<FormScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? imageFile;
  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            const SizedBox(height: 70),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: heigth / 8,
                      width: heigth / 8,
                      color: Colors.grey,
                      child: imageFile == null
                          ? const SizedBox()
                          : Image.file(
                              File(imageFile!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                    InkWell(
                      onTap: () async {
                        imageFile =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {});
                        debugPrint(
                            "imageFile!.path ------------>>> ${imageFile!.path}");
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff0385BF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/pen_icon.png",
                            height: heigth / 40,
                            width: width / 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: heigth / 20),
            CommonTextFild(
              hintText: "Name",
              controller: _nameController,
            ),
            SizedBox(
              height: heigth / 30,
            ),
            CommonTextFild(
              hintText: "Address",
              controller: _addressController,
              maxLines: 4,
            ),
            SizedBox(
              height: heigth / 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.trim().isNotEmpty &&
                    _addressController.text.trim().isNotEmpty &&
                    imageFile != null) {
                  _addedUser.add({
                    'image': imageFile!.path,
                    'name': _nameController.text.trim(),
                    'address': _addressController.text.trim(),
                  });
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigation(
                          intialIndex: 1,
                          list: _addedUser,
                          // name: _nameController.text.trim(),
                          // address: _addressController.text.trim(),
                          // file: imageFile,
                        ),
                      ));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xff0385BF),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
