import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prescirbed/Utility/Moment.dart';
import 'package:prescirbed/Utility/constants.dart';
import 'package:prescirbed/Visuals/MomentCardCreator.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool loggedin = false;
  List<DateTime> days = [
    DateTime.parse("2019-01-07"),
    DateTime.parse("2019-01-08"),
    DateTime.parse("2019-01-09"),
    DateTime.parse("2019-01-10")
  ];

  Widget createDayRow(DateTime date) {
    bool createCards = false;
    List<MomentCard> cards = [];

    if (moments.isNotEmpty) {
      moments.forEach((moment) {
        if (moment.date == date) {
          createCards = true;
          cards.add(
            MomentCard(
              moment: moment,
              key: Key(moment.date.toString() +
                  convertMomentEnumToString(moment.name)),
            ),
          );

          //only sort if there are multiple moments to be created
          if (cards.length > 1)
            cards.sort(
              (a, b) => a.moment!.name.index.compareTo(b.moment!.name.index),
            );
        }
      });
    }

    return createCards
        ? Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    DateFormat.MMMMEEEEd().format(date),
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ),
                Container(
                  child: Column(
                    children: cards,
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return loggedin
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              color: Colors.white,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: Image.asset("Meal.jpeg").image,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: ListView(
                children: days.map((date) => createDayRow(date)).toList(),
              ),
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
                                  setState(() {
                                    loggedin = true;
                                  });
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
