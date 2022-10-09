// ignore_for_file: prefer_const_constructors

import 'package:ecmapp/screens/bottomnav.dart';
import 'package:ecmapp/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      )),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNav(),
          //body: MainScreen(),
        ),
      ),
    );
  }
}
