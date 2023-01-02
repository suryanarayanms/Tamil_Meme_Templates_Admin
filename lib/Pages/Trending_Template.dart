import 'package:butterfly_effect_admin/Pages/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class TrendingTemplate extends StatefulWidget {
  const TrendingTemplate({Key? key}) : super(key: key);

  @override
  State<TrendingTemplate> createState() => _TrendingTemplateState();
}

class _TrendingTemplateState extends State<TrendingTemplate> {
  String _name = '';
  File? imageFile;
  XFile? imagePath;
  File? imagepicked;
  var uploadPath = '';
  final ImagePicker _picker = ImagePicker();
  FirebaseStorage storageRef = FirebaseStorage.instance;
  String collectionName = "trendingtemplates";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 70.0, bottom: 50),
            child: Text(
              'T R E N D I N G     T E M P L A T E',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'AltonaSans-Regular',
                fontSize: 20,
              ),
            ),
          ),
          gallery(),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              bottom: 20,
              right: 30,
            ),
            child: TextField(
              autofocus: false,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              onChanged: (value) {
                _name = value;
              },
              decoration: InputDecoration(
                  hintText: 'Template name',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                  child: SizedBox(
                    height: 50,
                    // width: 330,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF7B61FF)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // print(imagepicked + " " + _name);
                        if (imagepicked != null && _name != '') {
                          String uploadFileName =
                              DateTime.now().millisecondsSinceEpoch.toString() +
                                  '.jpg';
                          Reference reference = storageRef
                              .ref()
                              .child(collectionName)
                              .child(uploadFileName);
                          UploadTask uploadTask =
                              reference.putFile(File(imagePath!.path));

                          setState(() {
                            imageFile = File(imagePath!.path);
                          });

                          uploadTask.whenComplete(() async {
                            uploadPath =
                                await uploadTask.snapshot.ref.getDownloadURL();
                            FirebaseFirestore.instance
                                .collection("trending_templates")
                                .doc(_name)
                                .set({"imageurl": uploadPath, "name": _name});
                          });

                          return Snackbar().showFlushbar(
                              context: context,
                              message: "Trending $_name Template Uploaded");
                        } else {
                          return Snackbar().showFlushbar(
                              context: context,
                              message: "Provide some credentials");
                        }
                      },
                      child: const Text('U   P   L   O   A   D'),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, right: 10),
                  child: SizedBox(
                    height: 50,
                    // width: 330,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (imagepicked != null && _name != '') {
                          String uploadFileName =
                              DateTime.now().millisecondsSinceEpoch.toString() +
                                  '.jpg';
                          Reference reference = storageRef
                              .ref()
                              .child(collectionName)
                              .child(uploadFileName);
                          UploadTask uploadTask =
                              reference.putFile(File(imagePath!.path));

                          setState(() {
                            imageFile = File(imagePath!.path);
                          });

                          uploadTask.whenComplete(() async {
                            uploadPath =
                                await uploadTask.snapshot.ref.getDownloadURL();
                            FirebaseFirestore.instance
                                .collection("trending_templates")
                                .doc(_name)
                                .update(
                                    {"imageurl": uploadPath, "name": _name});
                          });

                          return Snackbar().showFlushbar(
                              context: context,
                              message: "Trending $_name Template Updated");
                        } else {
                          return Snackbar().showFlushbar(
                              context: context,
                              message: "Provide some credentials");
                        }
                      },
                      child: const Text('U  P  D  A  T  E'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 10),
            child: SizedBox(
              height: 50,
              // width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_name != '') {
                    FirebaseFirestore.instance
                        .collection("trending_templates")
                        .doc(_name)
                        .delete();
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "Trending $_name Template Deleted");
                  } else {
                    return Snackbar().showFlushbar(
                        context: context, message: "Provide some credentials");
                  }
                },
                child: const Text('D  E  L  E  T  E'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  gallery() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(5, 5)),
                BoxShadow(
                    color: Color.fromARGB(255, 37, 39, 61).withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(-5, -5)),
              ],
              color: Color(0xff181A28),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Card(
                    color: Color(0xff181A28),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    clipBehavior: Clip.antiAlias,
                    child: imagepicked != null
                        ? GestureDetector(
                            onTap: (() => {imagepicker()}),
                            child: Image.file(
                              imagepicked!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : GestureDetector(
                            onTap: (() => {imagepicker()}),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: Offset(5, 5)),
                                  BoxShadow(
                                      color: Color.fromARGB(255, 37, 39, 61)
                                          .withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: Offset(-5, -5)),
                                ],
                                color: Color(0xff181A28),
                              ),
                              child: const Center(
                                child: Text(
                                  'G A L L E R Y',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: (() => {imagepicker()}),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              CupertinoIcons.photo,
                              color: Colors.white,
                            ),
                          )),
                      const Spacer(),
                      GestureDetector(
                          onTap: (() => {imagedeleter()}),
                          child: const Icon(
                            CupertinoIcons.delete,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  imagedeleter() {
    setState(() {
      imagepicked = null;
      uploadPath = '';
    });
  }

  imagepicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      try {
        final imageFile = File(image.path);
        setState(() {
          imagepicked = imageFile;
        });
      } finally {}

      setState(() {
        imagePath = image;
        imgname = image.name.toString();
      });
    }
  }

  String? imgname = '';
}
