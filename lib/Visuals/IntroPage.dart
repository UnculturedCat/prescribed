import 'package:flutter/material.dart';
import 'package:prescribed/my_flutter_app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
          image: Image.asset(
            "MePhoto.jpg",
            //colorBlendMode: BlendMode.darken,
          ).image,
          fit: BoxFit.cover,
        ),
      ),
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
                              "Hi,\n\n Thanks for checking out this high fidelity mockup.This is built using Flutter, a crossplatform framework, and firebase as a backend\n Just click login and playaround the interface.\n",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //width: double.infinity,
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: ListTile(
                        leading: Icon(
                          MyFlutterApp.linkedin,
                          color: Colors.white,
                        ),
                        title: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            primary: Color.fromRGBO(26, 176, 96, 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Follow me on LinkedIn",
                            style: TextStyle(
                              color: Colors.white,
                              //fontWeight: FontWeight.,
                            ),
                          ),
                          onPressed: () {
                            launchUrl(Uri.parse(
                                "https://www.linkedin.com/showcase/buildnowbydeeformed/?viewAsMember=true"));
                          },
                        ),
                      ),
                    ),
                    Container(
                      //width: double.infinity,
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: ListTile(
                        leading: Icon(
                          MyFlutterApp.globe,
                          color: Colors.white,
                        ),
                        title: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            primary: Color.fromRGBO(26, 176, 96, 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "BuildNow.dev",
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            launchUrl(Uri.parse("https://www.buildnow.dev/"));
                          },
                        ),
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
    );
  }
}
