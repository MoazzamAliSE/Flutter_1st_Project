import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:url_launcher/link.dart';
import '../widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
      (VxState.store as MyStore)
          .navigator
          .routeManager
          .push(Uri.parse(MyRoutes.homeRoute));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        //SingleChildScrollView this is good for removing the bottomOverFlow
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/heyLogin.png",
                fit: BoxFit.cover,
                height: 250,
              ),
              SizedBox(
                height: 20.0,
                // child: Text("hey"), // this is the text which is given in the space
                // SizedBox is used as an alternative of padding
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username cannot be empty";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText:
                          true, // obscure text is true so the entered text will not be visible... means dots
                      decoration: InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password cannot be empty";
                        } else if (value.length < 6) {
                          return "password length should be alteast 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    // as the container is not pressing because it is a box so we have to make it click able but how
                    // one way is justedDetector no ripple effect
                    // second is inkWell which show that button is going to pressed and a better visual is places and behaves like a button   splash color ripple effect
                    Material(
                      // inkWell has an ansestor material so there should no decoration is placed in the child it can bring errors
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        // splashColor: Colors.red,
                        onTap: () => MoveToHome(context),
                        child: AnimatedContainer(
                          // if i create animatedcontainer to ink widget then it is possible to show ripple effect
                          ////and also if we want to show ripple effect theen the widget must be and ancestor of material
                          // but Ink will not show the animation and
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  'login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                          // decoration: BoxDecoration(
                          //   color: Colors.deepPurple,
                          //   borderRadius:
                          //       BorderRadius.circular(changeButton ? 50 : 8),
                          //   // shape: changeButton? BoxShape.circle:BoxShape.rectangle
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // print("welldone keep it up");
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(120, 45)),
                    // )
                    TextButton(
                      onPressed: () {
                        context.vxNav.push(Uri.parse(MyRoutes.signupRoute));
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                          context.accentColor,
                        ),
                      ),
                      child: Text("Sign Up").text.headline6(context).make(),
                    ),
                    Link(
                        uri: Uri.parse(MyRoutes.cartRoute),
                        target: LinkTarget.blank,
                        builder: (context, followLink) {
                          return TextButton(
                              onPressed: followLink,
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      context.accentColor)),
                              child: Text("Go to CodePur"));
                        }),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //  Center(
      //   child: Text(
      //     "Login Page",
      //     style: TextStyle(
      //         fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
      //     textScaleFactor: 2.2,
      //   ),
      // ),
    );
  }
}
