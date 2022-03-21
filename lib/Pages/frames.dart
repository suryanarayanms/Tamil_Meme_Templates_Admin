import 'package:butterfly_effect_admin/Pages/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Frames extends StatefulWidget {
  const Frames({Key? key}) : super(key: key);

  @override
  State<Frames> createState() => _FramesState();
}

class _FramesState extends State<Frames> {
  String _frameimageurl = '';
  String _framename = '';
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
              'F R A M E S',
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
              cursorColor: Colors.blueAccent,
              onChanged: (value) {
                _frameimageurl = value;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
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
              cursorColor: Colors.blueAccent,
              onChanged: (tempname) {
                _framename = tempname;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
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
                'Frames Name',
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
              cursorColor: Colors.blueAccent,
              onChanged: (subtemp) {
                _subdoc = subtemp;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
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
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_frameimageurl != '' &&
                      _framename != '' &&
                      _subdoc == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _frameimageurl,
                      "name": _framename
                    };
                    FirebaseFirestore.instance
                        .collection("frame")
                        .doc(_framename)
                        .set({"imageurl": _frameimageurl, "name": _framename});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_framename Cover Pic Uploaded");
                  } else if (_frameimageurl != '' &&
                      _framename != '' &&
                      _subdoc != '') {
                    FirebaseFirestore.instance
                        .collection("frame")
                        .doc(_framename)
                        .collection("frames")
                        .doc(_subdoc)
                        .set({"imageurl": _frameimageurl, "name": _framename});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_framename $_subdoc Frames Uploaded");
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
                  if (_frameimageurl != '' &&
                      _framename != '' &&
                      _subdoc == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _frameimageurl,
                      "name": _framename
                    };
                    FirebaseFirestore.instance
                        .collection("frame")
                        .doc(_framename)
                        .update(
                            {"imageurl": _frameimageurl, "name": _framename});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_framename Cover Pic Updated");
                  } else if (_frameimageurl != '' &&
                      _framename != '' &&
                      _subdoc != '') {
                    FirebaseFirestore.instance
                        .collection("frame")
                        .doc(_framename)
                        .collection("frames")
                        .doc(_subdoc)
                        .update(
                            {"imageurl": _frameimageurl, "name": _framename});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_framename $_subdoc Frames Updated");
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
                if (_frameimageurl != '' && _framename != '' && _subdoc == '') {
                  Map<String, dynamic> data = {
                    "imageurl": _frameimageurl,
                    "name": _framename
                  };
                  FirebaseFirestore.instance
                      .collection("frame")
                      .doc(_framename)
                      .delete();
                  return Snackbar().showFlushbar(
                      context: context,
                      message: "$_framename Cover Pic Deleted");
                } else if (_frameimageurl != '' &&
                    _framename != '' &&
                    _subdoc != '') {
                  FirebaseFirestore.instance
                      .collection("frame")
                      .doc(_framename)
                      .collection("frames")
                      .doc(_subdoc)
                      .delete();
                  return Snackbar().showFlushbar(
                      context: context,
                      message: "$_framename $_subdoc Frame Deleted");
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
