import 'package:chatapp/component/My_Button.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/pages/Login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:flutter/material.dart';

class WelcomeScrean extends StatefulWidget {
  const WelcomeScrean({super.key});

  @override
  State<WelcomeScrean> createState() => _WelcomeScreanState();
}

class _WelcomeScreanState extends State<WelcomeScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Container(
            margin: EdgeInsets.all(25),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: 90,
                                  backgroundImage:
                                      AssetImage("images/massage.png"),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Message Me",
                                  style: TextStyle(
                                      fontFamily: "Pacifico",
                                      color: Colors.white,
                                      fontSize: 40),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              MyButtom(
                                color: Colors.yellow[900]!,
                                tittle: "SignIn",
                                onpressed: () {
                                  Navigator.pushNamed(context, "LoginScren");
                                },
                              ),
                              MyButtom(
                                color: Colors.blue[800]!,
                                tittle: "Register",
                                onpressed: () {
                                  Navigator.pushNamed(
                                      context, "RegisterScrean");
                                },
                              )
                            ])))),
          ),
        ));
  }
}
