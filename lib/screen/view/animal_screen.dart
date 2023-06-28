import 'package:advance_exam/screen/controller/animal_controller.dart';
import 'package:advance_exam/utils/api_helper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({Key? key}) : super(key: key);

  @override
  State<AnimalScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AnimalScreen> {
  HomeController animalController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    animalController.Apicall();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff152238),
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      return Obx(
                        () => Container(
                          child: animalController.i == 10
                              ? Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 50.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25)),
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Text("You Total Score",
                                            style: TextStyle(
                                              color: Colors.white70,
                                                fontSize: 35.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade900
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "${animalController.truean}",
                                                style: TextStyle(
                                                    fontSize: 35.sp,
                                                    color: Colors.white70),
                                              ),
                                              Text(
                                                " Point",
                                                style: TextStyle(
                                                    fontSize: 35.sp,
                                                    color: Colors.white70),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        ElevatedButton(
                                            onPressed: () {
                                              animalController.userans.clear();
                                              animalController.truean.value = 0;
                                              animalController.data!.value.clear();
                                              animalController.answer.clear();
                                              Get.offAndToNamed('/home');
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color(0xff152238))),
                                            child: Text(
                                              "Re Playing",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.sp),
                                            )),
                                        SizedBox(height: 20,),
                                        Container(
                                          height: 40,
                                          width: 170,
                                          decoration:
                                              BoxDecoration(color: Colors.white,
                                              borderRadius: BorderRadius.circular(10)),
                                          child: TextButton(
                                              onPressed: () {
                                                Get.toNamed('/ans');
                                              },
                                              child: Text(
                                                "Show your answer",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        Color(0xff152238)),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Spacer(),
                                      Obx(
                                        () => Text(
                                            "             Question ${animalController.i.value + 1} out of ${animalController.data!.length}",
                                            style: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp)),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Container(
                                        height: 80.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Obx(
                                              () => Text(
                                                "${animalController.data![animalController.i.value].question}",
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                animalController.userans.add(
                                                    "${animalController.answer[0]}");
                                                animalController.changei();
                                              },
                                              child: Container(
                                                height: 55,
                                                margin: EdgeInsets.all(7),
                                                width: 90.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Obx(
                                                      () => Text(
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          "${animalController.answer[0]}",
                                                          style: TextStyle(
                                                              color:
                                                                  Color(0xff152238),
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight.w600)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                animalController.userans.add(
                                                    "${animalController.answer[1]}");
                                                animalController.changei();
                                              },
                                              child: Container(
                                                height: 55,
                                                margin: EdgeInsets.all(7),
                                                width: 90.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Obx(
                                                      () => Text(
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          "${animalController.answer[1]}",
                                                          style: TextStyle(
                                                              color:
                                                                  Color(0xff152238),
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight.w600)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                animalController.userans.add(
                                                    "${animalController.answer[2]}");
                                                animalController.changei();
                                              },
                                              child: Container(
                                                height: 55,
                                                margin: EdgeInsets.all(7),
                                                width: 90.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Obx(
                                                      () => Text(
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          "${animalController.answer[2]}",
                                                          style: TextStyle(
                                                              color:
                                                                  Color(0xff152238),
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight.w600)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                animalController.userans.add(
                                                    "${animalController.answer[3]}");
                                                animalController.changei();
                                              },
                                              child: Container(
                                                height: 55,
                                                margin: EdgeInsets.all(7),
                                                width: 90.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Obx(
                                                      () => Text(
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          "${animalController.answer[3]}",
                                                          style: TextStyle(
                                                              color:
                                                                  Color(0xff152238),
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight.w600)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(child: SizedBox())
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
                  },
                  future: ApiHelper().ApiData(),
                )),
          ],
        ),
      ),
    );
  }
}
