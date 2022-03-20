import 'package:butterfly_effect_admin/Pages/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Templates extends StatefulWidget {
  const Templates({Key? key}) : super(key: key);

  @override
  State<Templates> createState() => _TemplatesState();
}

class _TemplatesState extends State<Templates> {
  String _tempimageurl = '';
  String _tempname = '';
  String _subdoc = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150.0, bottom: 50),
            child: Text(
              'T E M P L A T E S',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'AltonaSans-Regular',
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, right: 11),
            child: SizedBox(
              height: 32,
              width: 320,
              child: Text(
                'Image URL',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'AltonaSans-Regular',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              bottom: 20,
              right: 30,
            ),
            child: TextField(
              autofocus: false,
              cursorColor: Color(0xFF21BFBD),
              onChanged: (value) {
                _tempimageurl = value;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF21BFBD))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF21BFBD))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 11),
            child: SizedBox(
              height: 32,
              width: 320,
              child: Text(
                'Cover Pic Name',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'AltonaSans-Regular',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              bottom: 20,
              right: 30,
            ),
            child: TextField(
              autofocus: false,
              cursorColor: Color(0xFF21BFBD),
              onChanged: (tempname) {
                _tempname = tempname;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF21BFBD))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF21BFBD))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 11),
            child: SizedBox(
              height: 32,
              width: 320,
              child: Text(
                'Template Name',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'AltonaSans-Regular',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              bottom: 40,
              right: 30,
            ),
            child: TextField(
              autofocus: false,
              cursorColor: Color(0xFF21BFBD),
              onChanged: (subtemp) {
                _subdoc = subtemp;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF21BFBD))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF21BFBD))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF21BFBD)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_tempimageurl != '' && _tempname != '' && _subdoc == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _tempimageurl,
                      "name": _tempname
                    };
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_tempname)
                        .set({"imageurl": _tempimageurl, "name": _tempname});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_tempname Cover Pic Uploaded");
                  } else if (_tempimageurl != '' &&
                      _tempname != '' &&
                      _subdoc != '') {
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_tempname)
                        .collection("templates")
                        .doc(_subdoc)
                        .set({"imageurl": _tempimageurl, "name": _tempname});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_tempname $_subdoc Template Uploaded");
                  } else {
                    return Snackbar().showFlushbar(
                        context: context, message: "Provide some credentials");
                  }
                },
                child: Text('U   P   L   O   A   D'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_tempimageurl != '' && _tempname != '' && _subdoc == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _tempimageurl,
                      "name": _tempname
                    };
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_tempname)
                        .update({"imageurl": _tempimageurl, "name": _tempname});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_tempname Cover Pic Updated");
                  } else if (_tempimageurl != '' &&
                      _tempname != '' &&
                      _subdoc != '') {
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_tempname)
                        .collection("templates")
                        .doc(_subdoc)
                        .update({"imageurl": _tempimageurl, "name": _tempname});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_tempname $_subdoc Template Updated");
                  } else {
                    return Snackbar().showFlushbar(
                        context: context, message: "Provide some credentials");
                  }
                },
                child: Text('U   P   D   A   T   E'),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 330,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                if (_tempimageurl != '' && _tempname != '' && _subdoc == '') {
                  Map<String, dynamic> data = {
                    "imageurl": _tempimageurl,
                    "name": _tempname
                  };
                  FirebaseFirestore.instance
                      .collection("template")
                      .doc(_tempname)
                      .delete();
                  return Snackbar().showFlushbar(
                      context: context,
                      message: "$_tempname Cover Pic Deleted");
                } else if (_tempimageurl != '' &&
                    _tempname != '' &&
                    _subdoc != '') {
                  FirebaseFirestore.instance
                      .collection("template")
                      .doc(_tempname)
                      .collection("templates")
                      .doc(_subdoc)
                      .delete();
                  return Snackbar().showFlushbar(
                      context: context,
                      message: "$_tempname $_subdoc Template Deleted");
                } else {
                  return Snackbar().showFlushbar(
                      context: context, message: "Provide some credentials");
                }
              },
              child: Text('D   E   L   E   T   E'),
            ),
          )
        ],
      ),
    );
  }
}
