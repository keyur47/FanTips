

import 'dart:developer';

import 'package:fantips/Model/Matches_Model/completedmodel.dart';
import 'package:fantips/Screens/Matches/Completed/Service/Completed_Service.dart';
import 'package:get/get.dart';

class CompletedController extends GetxController {
  Rx<Completedapi> getCompleted = Completedapi().obs;
  RxList<Ted> getCompletedItem = <Ted>[].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
  getData({value}) async{
    try {
      isLoading.value = true;
      log("******666**5");
      final result = await CompletedService.getCompleted(value: '');
      if (result != null) {
        getCompleted.value = result;
      }

      log("-----${getCompleted.value}");
    }catch (e) {} finally{
    isLoading.value = false;}
  }
}
