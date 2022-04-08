import 'package:butterfly_effect_admin/Pages/flushbar.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class TrendingTemplate extends StatefulWidget {
  const TrendingTemplate({Key? key}) : super(key: key);

  @override
  State<TrendingTemplate> createState() => _TrendingTemplateState();
}

class _TrendingTemplateState extends State<TrendingTemplate> {
  String _ttempimageurl = '';
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150.0, bottom: 70),
            child: Text(
              'T R E N D I N G     T E M P L A T E',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'AltonaSans-Regular',
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 1, right: 11),
            child: SizedBox(
              height: 40,
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
              bottom: 37,
              right: 30,
            ),
            child: TextField(
              autofocus: false,
              cursorColor: const Color(0xFF7B61FF),
              onChanged: (value) {
                _ttempimageurl = value;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7B61FF))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7B61FF))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 11),
            child: SizedBox(
              height: 40,
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
              bottom: 70,
              right: 30,
            ),
            child: TextField(
              autofocus: false,
              cursorColor: const Color(0xFF7B61FF),
              onChanged: (value) {
                _name = value;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7B61FF))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7B61FF))),
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
                      MaterialStateProperty.all<Color>(const Color(0xFF7B61FF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_ttempimageurl != '' && _name != '') {
                    Map<String, dynamic> data = {
                      "imageurl": _ttempimageurl,
                      "name": _name
                    };
                    FirebaseFirestore.instance
                        .collection("trending_templates")
                        .doc(_name)
                        .set({"imageurl": _ttempimageurl, "name": _name});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "Trending $_name Template Uploaded");
                  } else {
                    return Snackbar().showFlushbar(
                        context: context, message: "Provide some credentials");
                  }
                },
                child: const Text('U   P   L   O   A   D'),
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
                  if (_ttempimageurl != '' && _name != '') {
                    Map<String, dynamic> data = {
                      "imageurl": _ttempimageurl,
                      "name": _name
                    };
                    FirebaseFirestore.instance
                        .collection("trending_templates")
                        .doc(_name)
                        .update({"imageurl": _ttempimageurl, "name": _name});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "Trending $_name Template Updated");
                  } else {
                    return Snackbar().showFlushbar(
                        context: context, message: "Provide some credentials");
                  }
                },
                child: const Text('U  P  D  A  T  E'),
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
                if (_name != '') {
                  Map<String, dynamic> data = {
                    "imageurl": _ttempimageurl,
                    "name": _name
                  };
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