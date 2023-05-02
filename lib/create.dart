import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  GlobalKey<FormState> loginKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController user2Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  bool isActive = false;
  bool eyeActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isActive == false)
          ? Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter first your email";
                        }
                        return null;
                      },
                      controller: emailController,
                      onSaved: (val) {
                        setState(() {
                          emailController.text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'enter your email',
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter first your user";
                        }
                        return null;
                      },
                      controller: userController,
                      onSaved: (val) {
                        setState(() {
                          userController.text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'user name',
                          prefixIcon: Icon(Icons.person_outline)),
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter first your password";
                        }
                        return null;
                      },
                      controller: passwordController,
                      onSaved: (val) {
                        setState(() {
                          passwordController.text;
                        });
                      },
                      obscureText: (eyeActive == false) ? true : false,
                      decoration: InputDecoration(
                          hintText: 'create password',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                eyeActive = !eyeActive;
                              });
                            },
                            icon: (eyeActive == false)
                                ? Icon(Icons.remove_red_eye)
                                : Icon(Icons.remove_red_eye_outlined),
                          )),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (loginKey.currentState!.validate()) {
                            loginKey.currentState!.save();
                          }
                          isActive = true;

                          //Navigator.of(context).pushNamed('login');
                        },
                        child: Text("Sign in"))
                  ],
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Form(
                key: loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        setState(() {
                          user2Controller.text;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter user name";
                        }
                        return null;
                      },
                      controller: user2Controller,
                      decoration: InputDecoration(
                          hintText: 'user name',
                          prefixIcon: Icon(Icons.person_outline)),
                    ),
                    TextFormField(
                      controller: password2Controller,
                      onSaved: (val) {
                        setState(() {
                          password2Controller.text;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter password";
                        }
                        return null;
                      },
                      obscureText: (eyeActive == false) ? true : false,
                      decoration: InputDecoration(
                          hintText: 'enter your password',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                eyeActive = !eyeActive;
                              });
                            },
                            icon: (eyeActive == false)
                                ? Icon(Icons.remove_red_eye)
                                : Icon(Icons.remove_red_eye_outlined),
                          )),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (loginKey.currentState!.validate()) {
                            loginKey.currentState!.save();

                            if (user2Controller.text == userController.text &&
                                password2Controller.text ==
                                    passwordController.text) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool('isLoggedIn', true);
                              Navigator.of(context)
                                  .pushReplacementNamed('homePage');
                            } else {
                              Navigator.of(context).pushNamed('login');
                            }
                          }
                        },
                        child: Text("Log in"))
                  ],
                ),
              ),
            ),
    );
  }
}
