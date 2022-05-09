import 'package:fantips/Util/AppStrings.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../Widgets/MyContainer.dart';
import '../Experts/Experts.dart';
import '../Experts/controller/ExpertsController.dart';

class WishListScreen extends StatelessWidget {
  // Ask Get to find our "controller"
  ExpertsController expertsController = Get.find();

  WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppString.favouriteExperts),
        ),
        body: Obx(
              () => ListView.builder(
            itemCount: expertsController.wishListItems.length,
            itemBuilder: (context, index) {
              final Experts = expertsController.wishListItems[index];
              return  Column(
                children: [
                  AppSizebox.h10,
                  Obx(()=>MyContainer22(
                    headerText:
                    "${Experts.name!.length >= 25 ? Experts.name?.substring(0, 12) : Experts.name}",
                    pr: "${Experts.totalPredictions ?? " "}",
                    ave: "${Experts.avgScore ?? ""}",
                    wins: "${Experts.top3}",
                    subscribers: '${Experts.subscriberCount}',
                    backgroundImage: Experts.profileUrl ?? "",
                    onTap: () {
                      if (Experts.inWishList?.value ==
                          false) {
                        expertsController
                            .addItem(Experts.name ?? "");
                      } else {
                        expertsController
                            .removeItem(Experts.name ?? "");
                      }
                    },
                    iconButton: expertsController.getitem
                        .value[index].inWishList == true
                        ? const Icon(Icons.favorite_border,color: Colors.green,)
                        : const Icon(Icons.favorite,color: Colors.green,),
                  ),),
                  AppSizebox.h10,
                ],
              );
            },
          ),
        ));
  }
}