import 'dart:convert';
import 'dart:math';

import 'package:advance_exam/screen/modal/animal_modal.dart';
import 'package:advance_exam/utils/api_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{

  RxInt i=0.obs;
  RxInt truean=0.obs;
  RxList<Result>? data=<Result>[].obs;
  RxList answer=[].obs;

  List userans=[];

  Future<void> Apicall()
  async {
    ApiHelper apiHelper  =ApiHelper();
    data!.value = (await apiHelper.
    ApiData())!;
    answ();
  }

  void answ()
  {
    List answerlist=[
      "${data![i.value].incorrectAnswers![0]}",
      "${data![i.value].incorrectAnswers![1]}",
      "${data![i.value].incorrectAnswers![2]}",
    ];

    Random random =Random();
    int a = random.nextInt(4);
    answerlist.insert(a,"${data![i.value].correctAnswer}");
    answer.value = answerlist;
  }

  void changei()
  {
    if(i==data!.length-1)
    {
      for(int l=0;l<userans.length;l++)
      {

        if(data![l].correctAnswer==userans[l])
        {
          truean++;
        }
      }
    }
    i++;
    answ();
  }
}