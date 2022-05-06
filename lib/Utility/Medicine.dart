class Medicine {
  bool taken;
  String name;
  String dosage;
  Medicine({this.name = " ", this.taken = false, this.dosage = " "});
  void setToTaken(bool setTaken) {
    taken = setTaken;
  }
}
