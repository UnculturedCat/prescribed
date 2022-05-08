import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prescribed/Utility/Moment.dart';
import 'package:prescribed/Utility/constants.dart';
import 'package:prescribed/Visuals/MomentCardCreator.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<DateTime> days = [];

  DateTime? selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  void initializeValues() {
    days = [];
    for (int i = 0; i < 5; i++) {
      days.add(
        selectedDay!.add(
          Duration(days: i),
        ),
      );
    }
  }

  Widget createDayRow(DateTime date) {
    bool createCards = false;
    List<MomentCard> cards = [];

    if (moments.isNotEmpty) {
      moments.forEach((moment) {
        if (DateFormat.MMMMEEEEd().format(moment.date) ==
            DateFormat.MMMMEEEEd().format(date)) {
          createCards = true;
          cards.add(
            MomentCard(
              moment: moment,
              key: Key(moment.date.toString() +
                  convertMomentEnumToString(
                    moment.name,
                  )),
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
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
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

  void setDay() async {
    selectedDay = await showDatePicker(
      // builder: (context, child) => Theme(data: ThemeData().copyWith(colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface)), child: child!,),
      context: context,
      initialDate: selectedDay!,
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
    initializeValues();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Prescription",
          style: TextStyle(
              color: Color.fromRGBO(26, 176, 96, 1.0),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        shadowColor: Color.fromARGB(26, 255, 255, 255),
        actionsIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        actions: [
          Container(
            // padding: EdgeInsets.only(left: 100),
            child: IconButton(
              onPressed: () {
                setDay();
              },
              icon: Icon(CupertinoIcons.calendar),
            ),
          )
        ],
      ),
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
    );
  }
}
