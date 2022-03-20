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
  String _subtemp = '';

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
                'Name',
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
                'Sub-Collection',
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
                _subtemp = subtemp;
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
                  if (_tempimageurl != '' &&
                      _tempname != '' &&
                      _subtemp == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _tempimageurl,
                      "name": _tempname
                    };
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_tempname)
                        .set({"imageurl": _tempimageurl, "name": _tempname});
                  } else if (_tempimageurl != '' &&
                      _tempname != '' &&
                      _subtemp == '') {
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_tempname)
                        .collection(_subtemp)
                        .doc("images")
                        .set({"imageurl": _tempimageurl, "name": _tempname});
                  } else {
                    print('data va enter pannu da');
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
                  if (_tempimageurl != '' &&
                      _tempname != '' &&
                      _subtemp == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _tempimageurl,
                      "name": _tempname
                    };
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_tempname)
                        .set({"imageurl": _tempimageurl, "name": _tempname});
                  } else if (_tempimageurl != '' &&
                      _tempname != '' &&
                      _subtemp == '') {
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_tempname)
                        .collection(_subtemp)
                        .doc("images")
                        .set({"imageurl": _tempimageurl, "name": _tempname});
                  } else {
                    print('data va enter pannu da');
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
                if (_tempimageurl != '' && _tempname != '' && _subtemp == '') {
                  Map<String, dynamic> data = {
                    "imageurl": _tempimageurl,
                    "name": _tempname
                  };
                  FirebaseFirestore.instance
                      .collection("template")
                      .doc(_tempname)
                      .delete();
                } else if (_tempimageurl != '' &&
                    _tempname != '' &&
                    _subtemp == '') {
                  FirebaseFirestore.instance
                      .collection("template")
                      .doc(_tempname)
                      .collection(_subtemp)
                      .doc("images")
                      .delete();
                } else {
                  print('data va enter pannu da');
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
