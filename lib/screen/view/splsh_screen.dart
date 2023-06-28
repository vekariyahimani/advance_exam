import 'dart:async';

import 'package:advance_exam/screen/view/animal_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Timer(Duration(minutes: 80), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => AnimalScreen(),
    //       ));
    // });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff152238),
        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Quizard",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1,000 +quizzess to challenge you and\n               your friends on all topic!",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 130,
            ),
            Center(
              child: Image.asset(
                "assets/image/e2.png",
                height: 200,
                width: 200,
              ),
            ),
            Spacer(),
            Container(
              height: 60,
              width: 220,
              alignment: Alignment.center,
              margin: EdgeInsets.all(13),
              decoration: BoxDecoration(color: Colors.cyan,
              borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/home');
                },
                  child: Text("Start playing",style: TextStyle(color: Color(0xff152238),fontWeight: FontWeight.w600,fontSize: 13.sp),)),
            ),
          ],
        ),
      ),
    );
  }
}
