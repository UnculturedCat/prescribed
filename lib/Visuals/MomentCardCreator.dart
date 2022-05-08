import 'package:flutter/material.dart';
import 'package:prescribed/Utility/Moment.dart';
import 'package:prescribed/Utility/constants.dart';

class MomentCard extends StatefulWidget {
  final Moment? moment;

  const MomentCard({required this.moment, Key? key}) : super(key: key);
  @override
  _MomentCardState createState() => _MomentCardState(this.moment!.name);
}

class _MomentCardState extends State<MomentCard> {
  MomentName name;
  bool showMedicines = false;

  _MomentCardState(this.name);

  Widget createMedicineView() {
    return Column(
      children: widget.moment!.medicines
          .map(
            (medicine) => ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
                    widget.moment!.checkIfAllAreTaken();
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: showMedicines
                    ? BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      )
                    : BorderRadius.all(Radius.circular(5)),
                child: Container(
                  color: widget.moment!.allMedicinesTaken
                      ? Color.fromRGBO(82, 135, 143, 1)
                      : Colors.white,
                  child: ListTile(
                    leading: Icon(
                      getIconFromMoment(widget.moment!.name),
                      color: widget.moment!.allMedicinesTaken
                          ? Colors.white
                          : Colors.black,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            convertMomentEnumToString(widget.moment!.name),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: widget.moment!.allMedicinesTaken
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            getTimeStringFromMoment(widget.moment!.name),
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.moment!.allMedicinesTaken
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.moment!.allMedicinesTaken
                              ? widget.moment!.setAllMedcinesToTaken(false)
                              : widget.moment!.setAllMedcinesToTaken(true);
                        });
                      },
                      icon: widget.moment!.allMedicinesTaken
                          ? Icon(
                              Icons.check_box,
                              color: Colors.white,
                            )
                          : Icon(Icons.check_box_outline_blank),
                    ),
                  ),
                ),
              ),
              showMedicines
                  ? Container(
                      child: createMedicineView(),
                    )
                  : SizedBox(),
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
