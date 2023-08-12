import 'package:chatapp/component/My_Button.dart';
import 'package:chatapp/component/custom_text_form_field.dart';
import 'package:chatapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScren extends StatefulWidget {
  const LoginScren({super.key});

  @override
  State<LoginScren> createState() => _LoginScrenState();
}

class _LoginScrenState extends State<LoginScren> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool loading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formkey,
          child: Center(
              child: ModalProgressHUD(
            inAsyncCall: loading,
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
                                  SizedBox(
                                    height: 23,
                                  ),
                                  TextFormField(
                                    validator: (data) {
                                      if (data!.isEmpty) {
                                        return ("field is required");
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        hintText: "Enter your email",
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.orange)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 2)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    validator: (data) {
                                      if (data!.isEmpty) {
                                        return ("field is required");
                                      }
                                    },
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    obscureText: true,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.password),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        hintText: "Enter your password",
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.orange)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 2)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MyButtom(
                                      color: Colors.blue[800]!,
                                      tittle: "LogIn",
                                      onpressed: () async {
                                        if (formkey.currentState!.validate()) {
                                          loading = true;
                                          setState(() {});
                                          try {
                                            final newUser = await _auth
                                                .signInWithEmailAndPassword(
                                                    email: email!,
                                                    password: password!);
                                          } on FirebaseAuthException catch (ex) {
                                            if (ex.code == 'user-not-found') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "weak password")));
                                            } else if (ex.code ==
                                                'email-already-in-use') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "email already is used")));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content:
                                                          Text("successed")));
                                              Navigator.pushNamed(
                                                  context, "ChatScrean",
                                                  arguments: email);
                                            }
                                          } catch (ex) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "there was an error")));
                                          }
                                          loading = false;
                                          setState(() {});
                                        }
                                      })
                                ]))))),
          )),
        ));
  }
}
