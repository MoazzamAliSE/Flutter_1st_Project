import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_Detail_page.dart';
import 'package:flutter_application_1/pages/loginPage.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'pages';
import 'core/store.dart';
import 'pages/home_page.dart';
// import 'pages/loginpage.dart';
// import 'package:flutter_catalog/utils/routes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'widgets/themes.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(
      store: MyStore(),
      // interceptors: [],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vxNavigator = VxNavigator(routes: {
      "/": (_, __) => MaterialPage(child: HomePage()),
      MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
      MyRoutes.homeDetailsRoute: (uri, _) {
        final catalog = (VxState.store as MyStore)
            .catalog
            .getById(int.parse(uri.queryParameters["id"].toString()));
        return MaterialPage(
            child: HomeDetailPage(
          catalog: catalog,
        ));
      },
      MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
      MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
      // MyRoutes.signupRoute: (_, __) => MaterialPage(child: SignUpPage()),
      MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
    });
    (VxState.store as MyStore).navigator = vxNavigator;

    //naming connventions as for function ftnName() first word's letter is small and other all words letters are capital
    // buildContext is paramater ..
    // int days = 30;
    // double pi = 3.14; // it can be change because it is not final or const
    // String name = "Moazzam";
    // bool isMale = true;
    // num anyDecimalValue = 30.5; // any numerical value
    // var day = "tuesday"; // var can be any value it can be string or num
    // const piVakue = 3.14; //let the value that will never change
    // final list = [
    //   2,
    //   4
    // ]; // final is modifiable means a list can be modifiable after a while
    // bringVegetables(thaila: true);  // method

    return MaterialApp.router(
      // home: Homepage(), // i havve removed or comment this route because i use it in below by "/" because it is homepage
      themeMode: ThemeMode.system,
      theme: Mytheme.lightTheme(context),
      // ThemeData(
      // primarySwatch: Colors.deepPurple,
      // fontFamily: GoogleFonts.lato().fontFamily,
      // appBarTheme: AppBarTheme(
      //     color: Colors.white,
      //     elevation: 0,
      //     iconTheme: IconThemeData(color: Colors.black),
      //     textTheme: Theme.of(context).textTheme)

      // primaryTextTheme: GoogleFonts.latoTextTheme()
      // ),
      debugShowCheckedModeBanner: false, // this remain good till development
      darkTheme: Mytheme.darkTheme(context),
      // ThemeData(
      // brightness: Brightness.light, primarySwatch: Colors.green
      // ),
      routeInformationParser: VxInformationParser(),
      routerDelegate: vxNavigator,
      // initialRoute: "/login",
      // // initialRoute: MyRoutes.homeRoute,
      // routes: {
      //   "/": (context) =>
      //       new LoginPage(), //naming connventions as for object NameObject() first word's letter and all words letters are capital
      //   MyRoutes.homeRoute: (context) => Homepage(),
      //   MyRoutes.loginRoute: (context) => LoginPage(),
      //   MyRoutes.cartRoute: (context) => CartPage(),
      //},
    );
  }

  // bringVegetables({required bool thaila,int rupees=100}) {
  //   // take bike

  //   // go to mandi
  // }
}
