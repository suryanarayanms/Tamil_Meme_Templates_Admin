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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150.0, bottom: 100),
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
            padding: EdgeInsets.only(top: 8.0, bottom: 1, right: 11),
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
              bottom: 80,
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
          SizedBox(
            height: 50,
            width: 330,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF21BFBD)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                if (_tempimageurl != '' && _tempname != '') {
                  Map<String, dynamic> data = {
                    "imageurl": _tempimageurl,
                    "name": _tempname
                  };
                  FirebaseFirestore.instance.collection("template").add(data);
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