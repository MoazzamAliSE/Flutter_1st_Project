import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
            // child: Text("hey"), // this is the text which is given in the space
            // SizedBox is used as an alternative of padding
          ),
          Text(
            "Welcome",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter Username", labelText: "Username"),
                ),
                TextFormField(
                  obscureText:
                      true, // obscure text is true so the entered text will not be visible... means dots
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    print("welldone keep it up");
                  },
                  child: Text("Login"),
                  style: TextButton.styleFrom(),
                )
              ],
            ),
          ),
        ],
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
