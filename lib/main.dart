

import 'package:flutter/material.dart';
import 'package:barberq/presentation/home_page.dart';
import 'package:barberq/config/routes.dart';
import 'package:barberq/Bloc/list_observer.dart';
import 'package:barberq/Bloc/CounterCubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:barberq/presentation/test_firebase.dart';

void main() {
    Bloc.observer = ListObserver();
    runApp(MyApp());
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => StoredCubit(),
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navigator',
        theme: ThemeData(fontFamily: 'Merienda', brightness: Brightness.light, backgroundColor: Color(0xfffc2003)),
        //initialRoute: '/',
         routes: {
           AppRoutes.home: (context) => HomePageScreen(),
          //  AppRoutes.home: (context) => Testpage(),
          //  AppRoutes.home: (context) => ShowList(),
         },
      ),
    );
  }
  

}

