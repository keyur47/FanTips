

import 'dart:developer';

import 'package:fantips/Model/Matches_Model/UpcomingModel.dart';
import 'package:fantips/Model/Matches_Model/completedmodel.dart';
import 'package:fantips/Model/Matches_Model/livemodel.dart';
import 'package:fantips/Screens/Matches/Live/Service/Live_Service.dart';
import 'package:get/get.dart';


class LiveController extends GetxController {
  Rx<Liveapi> getLive = Liveapi().obs;
  RxList<Ted> getLiveItem = <Ted>[].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
  getData({value}) async{
    isLoading.value = true;
    log("******646466**5");
    final result = await LiveService .getLive(value: '');
    if(result != null){
      getLive.value = result;
    }

    log("-----${getLive.value}");
    isLoading.value = false;
  }
}
