import 'package:advance_exam/screen/view/animal_screen.dart';
import 'package:advance_exam/screen/view/answer_screen.dart';
import 'package:advance_exam/screen/view/splsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => SplashScreen(),),
          GetPage(name: '/home', page: () => AnimalScreen(),),
          GetPage(name: '/ans', page: () => QuiesAnswerScreen(),),
        ],
      ),
    )

  );
}