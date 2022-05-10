import 'package:flutter/cupertino.dart';
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
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
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
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Prescription Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        prefixIcon: Icon(
                          CupertinoIcons.tag,
                          size: 15,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(240, 240, 240, 1.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Prescription Description",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      minLines: 5,
                      maxLines: null,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        prefixIcon: Icon(
                          CupertinoIcons.tag,
                          size: 15,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(240, 240, 240, 1.0),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            primary: Color.fromRGBO(26, 176, 96, 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(
                              10,
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
