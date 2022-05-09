import 'dart:developer';

import 'package:fantips/Model/NewsModel.dart';
import 'package:fantips/Screens/Home/News/Service/News_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewsController extends GetxController{
  Rx<News> getNews = News().obs;
  RxList<NewsElement> getitem = <NewsElement>[].obs;
  RxBool isLoading = false.obs;

  TextEditingController search = TextEditingController();
  ScrollController scrollController = ScrollController();


  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
  getData({value}) async{
    isLoading.value = true;
    log("********4");
    final result = await NewsService.getNews(value: '');
    if(result != null){
      getNews.value = result;
    }

    log("-----${getNews.value}");
    isLoading.value = false;
  }
}