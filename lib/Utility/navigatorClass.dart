import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prescribed/Utility/appManager.dart';
import 'package:prescribed/Visuals/AddPrescription.dart';
import 'package:prescribed/Visuals/Profile.dart';
import 'package:prescribed/Visuals/Schedule.dart';
import 'package:provider/provider.dart';

class NavigatorClass extends StatefulWidget {
  const NavigatorClass({Key? key}) : super(key: key);

  @override
  State<NavigatorClass> createState() => _NavigatorClassState();
}

class _NavigatorClassState extends State<NavigatorClass> {
  bool userSignedIn = false;
  int _currentIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _pages = [
    SchedulePage(),
    AddPrescriptionPage(),
    ProfilePage()
    //LibraryPage()
  ];

  @override
  void initState() {
    context.read<AppManager>().addListener(() {
      userSignedIn = context.read<AppManager>().userSignedIn;
      setState(() {});
    });
    super.initState();
  }

  void _pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    // DatabaseReference _testRef =
    //     FirebaseDatabase.instance.reference().child("Navigation");
    // _testRef.set(_pageNames[_currentIndex]);
  }

  void _itemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return userSignedIn
        ? Scaffold(
            body: PageView(
              controller: _pageController,
              children: _pages,
              onPageChanged: _pageChanged,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              selectedItemColor: Color.fromRGBO(26, 176, 96, 1.0),
              iconSize: 30,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              //elevation: 8,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.medication),
                  label: "Add",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_alt_circle),
                  label: "Profile",
                ),
              ],
              onTap: _itemTapped,
            ),
          )
        : Scaffold(
            body: Container(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: Image.asset("Medicine.jpeg").image,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              color: Colors.white,
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.35,
                          bottom: 20,
                        ),
                        child: Image.asset(
                          "IconNoBG.png",
                          height: 35,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .2,
                          right: MediaQuery.of(context).size.width * .2,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          CupertinoIcons.mail,
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(240, 240, 240, 1.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Password",
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(240, 240, 240, 1.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  primary: Color.fromRGBO(26, 176, 96, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  context
                                      .read<AppManager>()
                                      .setUserSignedIn(true);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                    10,
                                  ),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 150, bottom: 50),
                              child: Text(
                                "Created by Daniel Dickson Dillimono",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
