import 'package:flutter/material.dart';

class AddPrescriptionPage extends StatefulWidget {
  const AddPrescriptionPage({Key? key}) : super(key: key);

  @override
  State<AddPrescriptionPage> createState() => _AddPrescriptionPageState();
}

class _AddPrescriptionPageState extends State<AddPrescriptionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Add Prescription",
          style: TextStyle(
              color: Color.fromRGBO(
                26,
                176,
                96,
                1.0,
              ),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(
          255,
          255,
          255,
          0.0,
        ),
        shadowColor: Color.fromARGB(
          26,
          255,
          255,
          255,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        actions: [
          // Container(
          //   // padding: EdgeInsets.only(left: 100),
          //   child: IconButton(
          //     onPressed: () {
          //       setDay();
          //     },
          //     icon: Icon(CupertinoIcons.calendar),
          //   ),
          // )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("Medicine.jpeg").image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black38,
              BlendMode.darken,
            ),
          ),
          //backgroundBlendMode: BlendMode.
        ),
        child: ListView(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
