import 'package:flutter/material.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  Image _profilePhoto = Image.asset("ProfilePhoto.jpeg");

  void changeProfilePhoto() async {
    PickedFile? pickedFile;
    pickedFile =
        await ImagePickerPlugin().pickImage(source: ImageSource.gallery);
    //if (pickedFile != null) { //for some reason the null check is not necessary
    _profilePhoto = Image.network(pickedFile.path);
    // }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Color.fromRGBO(26, 176, 96, 1.0),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Color.fromARGB(26, 255, 255, 255),
        actionsIconTheme: IconThemeData(
          color: Color.fromRGBO(26, 176, 96, 1.0),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Scaffold.of(context).openDrawer();
        //       setState(() {});
        //     },
        //     icon: Icon(Icons.menu),
        //   )
        // ],
      ),
      endDrawer: Drawer(
        elevation: 5,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text(
                "Sign out",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              color: Color.fromARGB(255, 242, 242, 242),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: InkWell(
                      child: CircleAvatar(
                        backgroundImage: _profilePhoto.image,
                        radius: 70,
                      ),
                      onTap: () {
                        changeProfilePhoto();
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "James McPanCake",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromRGBO(26, 176, 96, 1.0),
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
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      "This is a mock up description.\nLong ago in a distant land. I, Aku, the shape shifting master of darkness unleashed an unspeakable evil but a foolish samurai warrior wielding a magic sword..",
                      style: TextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
