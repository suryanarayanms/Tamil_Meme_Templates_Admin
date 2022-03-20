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
  // String _ttempname = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150.0, bottom: 150),
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
              cursorColor: Color(0xFF7B61FF),
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
          SizedBox(
            height: 50,
            width: 330,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF7B61FF)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                if (_ttempimageurl != '') {
                  Map<String, dynamic> data = {
                    "imageurl": _ttempimageurl,
                  };
                  FirebaseFirestore.instance
                      .collection("trending_templates")
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