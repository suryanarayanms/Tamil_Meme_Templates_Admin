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
  String _subquote = '';

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
              cursorColor: Colors.blueAccent[400],
              onChanged: (quotename) {
                _quotename = quotename;
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
              cursorColor: Colors.blueAccent,
              onChanged: (subquote) {
                _subquote = subquote;
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
                      _subquote == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _quoteimageurl,
                      "name": _quotename
                    };
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_quotename)
                        .set({"imageurl": _quoteimageurl, "name": _quotename});
                  } else if (_quoteimageurl != '' &&
                      _quotename != '' &&
                      _subquote == '') {
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_quotename)
                        .collection(_subquote)
                        .doc("images")
                        .set({"imageurl": _quoteimageurl, "name": _quotename});
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
                  if (_quoteimageurl != '' &&
                      _quotename != '' &&
                      _subquote == '') {
                    Map<String, dynamic> data = {
                      "imageurl": _quoteimageurl,
                      "name": _quotename
                    };
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_quotename)
                        .set({"imageurl": _quoteimageurl, "name": _quotename});
                  } else if (_quoteimageurl != '' &&
                      _quotename != '' &&
                      _subquote == '') {
                    FirebaseFirestore.instance
                        .collection("template")
                        .doc(_quotename)
                        .collection(_subquote)
                        .doc("images")
                        .set({"imageurl": _quoteimageurl, "name": _quotename});
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
                if (_quoteimageurl != '' &&
                    _quotename != '' &&
                    _subquote == '') {
                  Map<String, dynamic> data = {
                    "imageurl": _quoteimageurl,
                    "name": _quotename
                  };
                  FirebaseFirestore.instance
                      .collection("template")
                      .doc(_quotename)
                      .delete();
                } else if (_quoteimageurl != '' &&
                    _quotename != '' &&
                    _subquote == '') {
                  FirebaseFirestore.instance
                      .collection("template")
                      .doc(_quotename)
                      .collection(_subquote)
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


// body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: Center(
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'KindaCode.com',
//                 contentPadding: const EdgeInsets.all(15),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10))),
//             onChanged: (value) {
//               // do something
//             },
//           ),
//         ),
//       ),