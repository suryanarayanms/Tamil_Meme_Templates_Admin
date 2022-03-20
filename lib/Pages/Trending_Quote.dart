import 'package:butterfly_effect_admin/Pages/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrendingQuote extends StatefulWidget {
  const TrendingQuote({Key? key}) : super(key: key);

  @override
  State<TrendingQuote> createState() => _TrendingQuoteState();
}

class _TrendingQuoteState extends State<TrendingQuote> {
  String _tquoteimageurl = '';
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
              'T R E N D I N G     Q U O T E',
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
              // top: 20.0,
              left: 30,
              bottom: 37,
              right: 30,
            ),
            child: TextField(
              autofocus: false,
              cursorColor: Colors.pink,
              onChanged: (imageurl) {
                _tquoteimageurl = imageurl;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
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
              cursorColor: Colors.pink[400],
              onChanged: (value) {
                _name = value;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
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
                      MaterialStateProperty.all<Color>(Colors.pink),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_tquoteimageurl != '' && _name != '') {
                    Map<String, dynamic> data = {
                      "imageurl": _tquoteimageurl,
                      "name": _name
                    };
                    FirebaseFirestore.instance
                        .collection("trending_quotes")
                        .doc(_name)
                        .set({"imageurl": _tquoteimageurl, "name": _name});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "Trending $_name Quote Uploaded");
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
                  if (_tquoteimageurl != '' && _name != '') {
                    Map<String, dynamic> data = {
                      "imageurl": _tquoteimageurl,
                      "name": _name
                    };
                    FirebaseFirestore.instance
                        .collection("trending_quotes")
                        .doc(_name)
                        .update({"imageurl": _tquoteimageurl, "name": _name});
                    return Snackbar().showFlushbar(
                        context: context,
                        message: "Trending $_name Template Updated");
                  } else {
                    return Snackbar().showFlushbar(
                        context: context, message: "Provide some credentials");
                  }
                },
                child: Text('U  P  D  A  T  E'),
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
                    "imageurl": _tquoteimageurl,
                    "name": _name
                  };
                  FirebaseFirestore.instance
                      .collection("trending_quotes")
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
              child: Text('D  E  L  E  T  E'),
            ),
          ),
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