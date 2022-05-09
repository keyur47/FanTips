import 'dart:developer';

import 'package:fantips/Model/Matches_Model/UpcomingModel.dart';
import 'package:fantips/Model/Matches_Model/completedmodel.dart';
import 'package:get/get.dart';

import '../Service/Upcoming_Service.dart';

class UpcomingController extends GetxController {
  Rx<Upcomingapi> getUpcoming = Upcomingapi().obs;
  RxList<Ted> getUpcomingItem = <Ted>[].obs;
  RxBool isLoading = false.obs;
  RxInt matchSelect = 0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  getData({value}) async {
    try {
      isLoading.value = true;
      log("******666**5");
      final result = await UpcomingService.getUpcoming(value: '');
      if (result != null) {
        getUpcoming.value = result;
      }
      log("-----${getUpcoming.value}");
    } catch (e) {} finally {
      isLoading.value = false;
    }
  }
}