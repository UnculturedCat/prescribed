import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prescribed/Utility/appManager.dart';
import 'package:prescribed/Visuals/AddPrescription.dart';
import 'package:prescribed/Visuals/IntroPage.dart';
import 'package:prescribed/Visuals/Profile.dart';
import 'package:prescribed/Visuals/Schedule.dart';
import 'package:prescribed/Visuals/SignIn.dart';
import 'package:provider/provider.dart';
import 'package:onboarding/onboarding.dart';

class NavigatorClass extends StatefulWidget {
  const NavigatorClass({Key? key}) : super(key: key);

  @override
  State<NavigatorClass> createState() => NavigatorClassState();
}

class NavigatorClassState extends State<NavigatorClass> {
  bool userSignedIn = false;
  int _currentIndex = 0;
  int onboardIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _pages = [
    SchedulePage(),
    AddPrescriptionPage(),
    ProfilePage()
    //LibraryPage()
  ];
  final onboardingPages = [
    PageModel(widget: IntroPage()),
    PageModel(
      widget: SignInPage(),
    ),
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
            body: Onboarding(
              pages: onboardingPages,
              onPageChange: (pageIndex) {
                onboardIndex = pageIndex;
              },
              startPageIndex: 0,
              footerBuilder: (context, dragDistance, pageslength, setIndex) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.0,
                      color: background,
                    ),
                  ),
                  child: ColoredBox(
                    color: background,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIndicator(
                            netDragPercent: dragDistance,
                            indicator: Indicator(
                              indicatorDesign: IndicatorDesign.line(
                                lineDesign: LineDesign(
                                  lineType: DesignType.line_uniform,
                                ),
                              ),
                            ),
                            pagesLength: pageslength,
                          ),
                          onboardIndex == pageslength - 1
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromRGBO(26, 176, 96, 1.0),
                                      ),
                                      onPressed: () {
                                        setIndex(onboardIndex - 1);
                                        onboardIndex -= 1;
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                      ),
                                      label: Text(
                                        "Back",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromRGBO(26, 176, 96, 1.0),
                                      ),
                                      onPressed: () {
                                        setIndex(onboardIndex + 1);
                                        onboardIndex += 1;
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      ),
                                      label: Text(
                                        "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
