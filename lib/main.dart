
//import 'package:barberq/presentation/add-customer_page.dart';
import 'package:flutter/material.dart';
import 'package:barberq/presentation/home2_page.dart';
import 'package:barberq/config/routes.dart';
//import 'package:barberq/presentation/test_firebase.dart';
//import 'package:barberq/presentation/reservation_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigator',
      theme: ThemeData(fontFamily: 'Merienda', brightness: Brightness.light, backgroundColor: Color(0xfffc2003)),
      //initialRoute: '/',
       routes: {
         AppRoutes.home: (context) => Home2PageScreen(),
         //AppRoutes.home: (context) => MyHomePage(),
         //'/': (context) => ReservationScreen(),
       },
    );
  }
  

}

