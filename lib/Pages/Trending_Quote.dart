import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrendingQuote extends StatefulWidget {
  const TrendingQuote({Key? key}) : super(key: key);

  @override
  State<TrendingQuote> createState() => _TrendingQuoteState();
}

class _TrendingQuoteState extends State<TrendingQuote> {
  String _tquoteimageurl = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150.0, bottom: 150),
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
          SizedBox(
            height: 50,
            width: 330,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                if (_tquoteimageurl != '') {
                  Map<String, dynamic> data = {
                    "imageurl": _tquoteimageurl,
                  };
                  FirebaseFirestore.instance
                      .collection("trending_quotes")
                      .add(data);
                } else {
                  print('data va enter pannu da');
                }
              },
              child: Text('U   P   L   O   A   D'),
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