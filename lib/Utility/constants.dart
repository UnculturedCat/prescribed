//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MomentName {
  Ontbijt,
  Lunch,
  Werk,
  Slapen,
}

String convertMomentEnumToString(MomentName momentName) {
  String nameString = " ";
  switch (momentName) {
    case MomentName.Lunch:
      nameString = "Lunch";
      break;
    case MomentName.Ontbijt:
      nameString = "Ontbijt";
      break;
    case MomentName.Slapen:
      nameString = "Voor het slapen";
      break;
    case MomentName.Werk:
      nameString = "Op 't werk";
      break;
  }
  return nameString;
}

// int getTimeFromMoment(MomentName momentName) {
//   int time = 0000;
//   switch (momentName) {
//     case MomentName.Lunch:
//       time = 1200;
//       break;
//     case MomentName.Ontbijt:
//       time = 0800;
//       break;
//     case MomentName.Slapen:
//       time = 2200;
//       break;
//     case MomentName.Werk:
//       time = 1500;
//       break;
//   }
//   return time;
// }

//There's a better way of doing this. Merge all Moment properties.
String getTimeStringFromMoment(MomentName momentName) {
  String time = "0000";
  switch (momentName) {
    case MomentName.Lunch:
      time = "12:00";
      break;
    case MomentName.Ontbijt:
      time = "08:00";
      break;
    case MomentName.Slapen:
      time = "22:00";
      break;
    case MomentName.Werk:
      time = "15:00";
      break;
  }
  return time;
}

IconData getIconFromMoment(MomentName momentName) {
  IconData icon = Icons.error;
  switch (momentName) {
    case MomentName.Lunch:
      icon = Icons.coffee;
      break;
    case MomentName.Ontbijt:
      icon = Icons.breakfast_dining;
      break;
    case MomentName.Slapen:
      icon = Icons.bed;
      break;
    case MomentName.Werk:
      icon = Icons.work;
      break;
  }
  return icon;
}
