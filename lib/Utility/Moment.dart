import 'package:prescribed/Utility/Medicine.dart';
import 'package:prescribed/Utility/constants.dart';

import 'Medicine.dart';

class Moment {
  MomentName name;
  DateTime date;
  List<Medicine> medicines;
  bool allMedicinesTaken = false;
  Moment({required this.name, required this.date, required this.medicines});

  void setAllMedcinesToTaken(bool allTaken) {
    allMedicinesTaken = allTaken;
    medicines.forEach((medicine) {
      medicine.taken = allTaken;
    });
  }

  void checkIfAllAreTaken() {
    allMedicinesTaken = true;
    medicines.forEach((medicine) {
      if (!medicine.taken) allMedicinesTaken = false;
    });
  }
}

//this data should be fetched instead of manually created
List<Moment> moments = [
  Moment(
    name: MomentName.Ontbijt,
    date: DateTime.parse("2022-05-07"),
    medicines: [
      Medicine(name: "Paracetamol", taken: false, dosage: "2 stuks, 40mg"),
      Medicine(name: "Acebutol", taken: false, dosage: "2 stuks, 40mg")
    ],
  ),
  Moment(
    name: MomentName.Werk,
    date: DateTime.parse("2022-05-07"),
    medicines: [
      Medicine(name: "Paracetamol", taken: false, dosage: "2 stuks, 40mg"),
      Medicine(name: "Acebutol", taken: false, dosage: "2 stuks, 40mg")
    ],
  ),
  Moment(
      name: MomentName.Lunch,
      date: DateTime.parse("2022-05-07"),
      medicines: [
        Medicine(name: "Paracetamol", taken: false, dosage: "2 stuks, 40mg"),
        Medicine(name: "Melatonin", taken: false, dosage: "2 stuks, 40mg")
      ]),
  Moment(
      name: MomentName.Ontbijt,
      date: DateTime.parse("2022-05-09"),
      medicines: [
        Medicine(name: "Paracetamol", taken: false, dosage: "2 stuks, 40mg"),
        Medicine(name: "Melatonin", taken: false, dosage: "2 stuks, 40mg")
      ]),
  Moment(
      name: MomentName.Ontbijt,
      date: DateTime.parse("2022-05-10"),
      medicines: [
        Medicine(name: "Paracetamol", taken: false, dosage: "2 stuks, 40mg"),
        Medicine(name: "Melatonin", taken: false, dosage: "2 stuks, 40mg")
      ]),
  Moment(
      name: MomentName.Lunch,
      date: DateTime.parse("2022-06-01"),
      medicines: [
        Medicine(name: "Paracetamol", taken: false, dosage: "2 stuks, 40mg"),
        Medicine(name: "Melatonin", taken: false, dosage: "2 stuks, 40mg")
      ]),
  Moment(
    name: MomentName.Slapen,
    date: DateTime.parse("2022-06-02"),
    medicines: [
      Medicine(name: "Melatonin", taken: false, dosage: "2 stuks, 40mg"),
    ],
  ),
  Moment(
      name: MomentName.Lunch,
      date: DateTime.parse("2022-06-03"),
      medicines: [
        Medicine(name: "Paracetamol", taken: false, dosage: "2 stuks, 40mg"),
        Medicine(name: "Melatonin", taken: false, dosage: "2 stuks, 40mg")
      ]),
];
