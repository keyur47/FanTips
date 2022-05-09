import 'dart:developer';
import 'package:fantips/Model/Matches_Model/Searchmodel.dart';
import 'package:fantips/Screens/Experts/Search/Service/SearchService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class SearchController extends GetxController {

  Rx<Profile?> service = Profile().obs;
  RxList<Tipster> service1 = <Tipster>[].obs;

  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  RxInt page = 0.obs;
  RxBool isPaginationLoader = false.obs;
  RxBool isLoadMoreRunning = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
    super.onInit();
  }

  getMoreData() async {
    isLoadMoreRunning.value = true;

    page.value++;
    final result =
    await ApiServices.login(page: page.value, value: controller.text);
    if (result != null) {
      service.value = result;
      if (page.value == 1) {
        // service1.clear();
      }
      log("-----000000000000000${result.tipsters}");
      service1.addAll(service.value?.tipsters ?? []);
      isLoadMoreRunning.value = false;
    }
  }

  Future fetchProducts({
    required String value,
  }) async {
    final result = await ApiServices.login(page: 0, value: value);
    service1.clear();
    if (result != null) {
      service.value = result;
      service1.addAll(service.value?.tipsters ?? []);
    }
  }

// Future fetchMethod(String value) async{
//   final submit = await ApiServices.login(value);
//   if(submit != null) {
//     if (_hasNextPage == true && _isFirstLoadRunning == false &&
//         _isLoadMoreRunning == false) {
//       _isLoadMoreRunning.value = true;
//       service.value?.totalPages;
//       log("-----------------------------------------------${service.value?.totalPages}");
//     }
//   }
// }
}
