
import 'package:barberq/presentation/add-customer_page.dart';
import 'package:flutter/material.dart';
import 'package:barberq/presentation/home_page.dart';
import 'package:barberq/config/routes.dart';

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
      theme: ThemeData(fontFamily: 'Chewy', brightness: Brightness.light, backgroundColor: Color(0xfffc2003)),
      //initialRoute: '/',
       routes: {
         AppRoutes.home: (context) => HomePageScreen(),
       },
      onGenerateRoute: _registerRWP,
    );
  }
   // ignore: missing_return
   Route _registerRWP(RouteSettings settings){
     if(settings.name == AppRoutes.addcustomer){
       return MaterialPageRoute(builder: (context){
         //AddCustomerScreen param = settings.arguments;
         return AddCustomerScreen();
       });
     }
   }

}

