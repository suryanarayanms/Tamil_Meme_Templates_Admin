import 'package:butterfly_effect_admin/Pages/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  String _quoteimageurl = '';
  String _quotename = '';
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
              'Q U O T E S',
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
                _quoteimageurl = value;
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
                _quotename = tempname;
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
                'Quotes Name',
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
                  if (_quoteimageurl != '' &&
                      _quotename != '' &&
                      _subdoc == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _quoteimageurl,
                      "name": _quotename
                    };
                    FirebaseFirestore.instance
                        .collection("quote")
                        .doc(_quotename)
                        .set({"imageurl": _quoteimageurl, "name": _quotename});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_quotename Cover Pic Uploaded");
                  } else if (_quoteimageurl != '' &&
                      _quotename != '' &&
                      _subdoc != '') {
                    FirebaseFirestore.instance
                        .collection("quote")
                        .doc(_quotename)
                        .collection("quotes")
                        .doc(_subdoc)
                        .set({"imageurl": _quoteimageurl, "name": _quotename});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_quotename $_subdoc quotes Uploaded");
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
                  if (_quoteimageurl != '' &&
                      _quotename != '' &&
                      _subdoc == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _quoteimageurl,
                      "name": _quotename
                    };
                    FirebaseFirestore.instance
                        .collection("quote")
                        .doc(_quotename)
                        .update(
                            {"imageurl": _quoteimageurl, "name": _quotename});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_quotename Cover Pic Updated");
                  } else if (_quoteimageurl != '' &&
                      _quotename != '' &&
                      _subdoc != '') {
                    FirebaseFirestore.instance
                        .collection("quote")
                        .doc(_quotename)
                        .collection("quotes")
                        .doc(_subdoc)
                        .update(
                            {"imageurl": _quoteimageurl, "name": _quotename});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "$_quotename $_subdoc Quotes Updated");
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
                if (_quoteimageurl != '' && _quotename != '' && _subdoc == '') {
                  Map<String, dynamic> data = {
                    "imageurl": _quoteimageurl,
                    "name": _quotename
                  };
                  FirebaseFirestore.instance
                      .collection("quote")
                      .doc(_quotename)
                      .delete();
                  return Snackbar().showFlushbar(
                      context: context,
                      message: "$_quotename Cover Pic Deleted");
                } else if (_quoteimageurl != '' &&
                    _quotename != '' &&
                    _subdoc != '') {
                  FirebaseFirestore.instance
                      .collection("quote")
                      .doc(_quotename)
                      .collection("quotes")
                      .doc(_subdoc)
                      .delete();
                  return Snackbar().showFlushbar(
                      context: context,
                      message: "$_quotename $_subdoc Quote Deleted");
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
