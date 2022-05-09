import 'package:flutter/material.dart';
import 'package:prescribed/Utility/Moment.dart';
import 'package:prescribed/Utility/constants.dart';

class MomentCard extends StatefulWidget {
  final List<Moment>? moments;

  const MomentCard({required this.moments, Key? key}) : super(key: key);
  @override
  _MomentCardState createState() => _MomentCardState();
}

class _MomentCardState extends State<MomentCard> {
  late MomentName name;
  bool showMedicines = false;
  //late Widget currentlyDisplayedMedicines;

  late Moment selectedMoment;

  _MomentCardState();

  @override
  void initState() {
    super.initState();
    //currentlyDisplayedMedicines = createMedicineView(widget.moment![0]);
    selectedMoment = widget.moments![0];
  }

  Widget createMomentIcon(Moment moment) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(
          getIconFromMoment(moment.name),
          color: moment == selectedMoment
              ? Color.fromRGBO(26, 176, 96, 1.0)
              : Colors.grey,
        ),
        color: /* selectedMoment.allMedicinesTaken ? Colors.white : Colors.black,*/ Colors
            .white,
        onPressed: () {
          setState(
            () {
              selectedMoment = moment;
            },
          );
        },
      ),
    );
  }

  Widget createMedicineView(Moment moment) {
    return Column(
      children: moment.medicines
          .map(
            (medicine) => ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    medicine.dosage,
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    medicine.taken
                        ? medicine.setToTaken(false)
                        : medicine.setToTaken(true);
                    moment.checkIfAllAreTaken();
                  });
                },
                icon: medicine.taken
                    ? Icon(
                        Icons.check_box,
                        color: Colors.greenAccent,
                      )
                    : Icon(Icons.check_box_outline_blank),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          elevation: 5,
          color: Color.fromARGB(255, 242, 242, 242),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                  // color: selectedMoment.allMedicinesTaken
                  //     ? Color.fromRGBO(26, 176, 96, 1.0)
                  //     : Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // children: [
                          //   Expanded(
                          //     child: Container(
                          //       height: 50,
                          //       child: ListView(
                          //         scrollDirection: Axis.horizontal,
                          //         children: widget.moments!
                          //             .map((moment) => createMomentIcon(moment))
                          //             .toList(),
                          //       ),
                          //     ),
                          //   )
                          // ],
                          children: widget.moments!
                              .map((moment) => createMomentIcon(moment))
                              .toList(),
                        ),
                      ),
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                convertMomentEnumToString(selectedMoment.name),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: selectedMoment.allMedicinesTaken
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                getTimeStringFromMoment(selectedMoment.name),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: selectedMoment.allMedicinesTaken
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        // trailing: IconButton(
                        //   onPressed: () {
                        //     setState(() {
                        //       selectedMoment.allMedicinesTaken
                        //           ? selectedMoment.setAllMedcinesToTaken(false)
                        //           : selectedMoment.setAllMedcinesToTaken(true);
                        //     });
                        //   },
                        //   icon: selectedMoment.allMedicinesTaken
                        //       ? Icon(
                        //           Icons.check_box,
                        //           color: Colors.white,
                        //         )
                        //       : Icon(Icons.check_box_outline_blank),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 20,
                ),
                child: createMedicineView(selectedMoment),
              )
            ],
          ),
        ),
        onTap: () {
          setState(() {
            showMedicines = !showMedicines;
          });
        });
  }
}
