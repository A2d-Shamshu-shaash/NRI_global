import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nri_global/globals/colors.dart';
import 'package:nri_global/views/Authentication/signin/forgotpassword.dart';
import 'package:nri_global/views/Authentication/signin/signin.dart';
import 'package:nri_global/views/Authentication/signin/verify_email.dart';
import 'package:nri_global/views/Authentication/signup/SignUpScreen.dart';
import 'package:nri_global/views/onboard_screens/onboard_screen.dart';
import 'package:nri_global/views/splash_screen/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.spaceGroteskTextTheme(),

        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}

