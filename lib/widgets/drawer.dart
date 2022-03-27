import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageURl =
        "https://avatars.githubusercontent.com/u/102206806?s=400&u=cf0fedb9f6e8e3c105d8b7f4d632b531d4137c6e&v=4";
    // final imageasset =
    // "E:\flutter_Catalog\flutter_application_1\assets\images\IMG_20211130_163357_HDR~2.jpg";
    // final imageassetrelative = "assets\images\IMG_20211130_163357_HDR~2.jpg";
    return Drawer(
      child: Container(
        color:  context.canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                // decoration: BoxDecoration(color: Colors.blue),
                accountName: Text("Moazzam Ali"),
                accountEmail: Text("moazzamali0304@gmail.com"),
                currentAccountPicture:
                //understand constraints in docs read them
                    //  Image.asset(imageassetrelative), // not working
                    CircleAvatar(
                  backgroundImage: NetworkImage(imageURl),
                  // backgroundImage: AssetImage(imageassetrelative),// not working
                  // backgroundImage: AssetImage(imageasset),// not working
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: context.theme.accentColor,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: context.theme.accentColor),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: context.theme.accentColor,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: context.theme.accentColor),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: context.theme.accentColor,
              ),
              title: Text(
                "Email",
                style: TextStyle(color: context.theme.accentColor),
                textScaleFactor: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
