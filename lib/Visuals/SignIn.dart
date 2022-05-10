import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utility/appManager.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: Image.asset("Medicine.jpeg").image,
      //     fit: BoxFit.cover,
      //   ),
      // ),
      color: Colors.white,
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
                              "Email",
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  CupertinoIcons.mail,
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
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.lock,
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
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Color.fromRGBO(26, 176, 96, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          context.read<AppManager>().setUserSignedIn(true);
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            10,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          )
                        ],
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
