

import 'dart:async';

import 'package:codeland_assignment/Screens/login_screen.dart';
import 'package:codeland_assignment/Utils/colors.dart';
import 'package:codeland_assignment/widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), 
    (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(),),);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: Center(
        child: Container(
          height: 280.h,
          width: 200.w,
          decoration: BoxDecoration(
            color: wColor,
            borderRadius: BorderRadius.circular(65),
            boxShadow: [
              BoxShadow(
                color: bColor,
                spreadRadius: 1,
                blurRadius: 15,
                offset: Offset(0, 4)
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img1.png"),
                
                height4,
                Image.asset("assets/img2.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}