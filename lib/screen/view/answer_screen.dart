import 'package:advance_exam/screen/controller/animal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuiesAnswerScreen extends StatefulWidget {
  const QuiesAnswerScreen({Key? key}) : super(key: key);

  @override
  State<QuiesAnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<QuiesAnswerScreen> {
  HomeController animalController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff152238),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Right Result",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: animalController.userans[index] ==
                                animalController
                                    .data![index].correctAnswer
                                ? Colors.green.shade200
                                : Colors.red.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text("${animalController.userans[index]}",style: TextStyle( color: animalController.userans[index] ==
                              animalController
                                  .data![index].correctAnswer
                              ? Colors.green.shade900
                              : Colors.red.shade900,fontSize: 16,fontWeight: FontWeight.w500
                          ),),
                        ),
                      ),
                      itemCount: animalController.userans.length),
                ),
              ],
            ),
          )),
    );
  }
}