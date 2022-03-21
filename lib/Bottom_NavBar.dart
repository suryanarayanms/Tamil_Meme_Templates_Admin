import 'package:butterfly_effect_admin/Pages/Trending_Frame.dart';
import 'package:butterfly_effect_admin/Pages/Trending_Template.dart';
import 'package:butterfly_effect_admin/Pages/frames.dart';
import 'package:butterfly_effect_admin/Pages/templates.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _pageIndex = 0;
  final List<Widget> _tabPage = [
    const TrendingTemplate(),
    const TrendingFrame(),
    const Templates(),
    const Frames()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _tabPage.elementAt(_pageIndex),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 7,
                        blurRadius: 15,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: BottomNavigationBar(
                    elevation: 5,
                    selectedItemColor: const Color(0xFF7B61FF),
                    unselectedItemColor: Colors.grey.shade400,
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    currentIndex: _pageIndex,
                    backgroundColor: Colors.white,
                    onTap: (int index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.workspaces_sharp,
                            color: Color(0xFF7B61FF),
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.account_tree_rounded,
                            color: Colors.pink,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.timeline_sharp,
                            color: Color(0xFF21BFBD),
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.mode_night,
                            color: Colors.blueAccent,
                          ),
                          label: ""),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
