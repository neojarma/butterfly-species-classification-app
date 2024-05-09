import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/modules/home/widgets/card_menu.dart';
import 'package:butterfly_classification/app/modules/home/widgets/big_circle_decoration.dart';
import 'package:butterfly_classification/app/modules/home/widgets/home_user_header.dart';
import 'package:butterfly_classification/app/modules/home/widgets/small_circle_decoration.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BigCircleDecoration(),
          const SmallCircleDecoration(
            heightDivider: 17,
            left: -50,
          ),
          const SmallCircleDecoration(
            heightDivider: 9,
            right: -50,
          ),
          Container(
            margin: const EdgeInsets.only(top: 90, left: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hello !',
                    style: headline4.copyWith(color: baseWhite),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                controller.obx(
                  (state) => HomeUserHeader(
                    fullName: controller.fullName,
                    imagePath: controller.imgProfile,
                    key: key,
                  ),
                  onLoading: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 3,
            ),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 5,
              children: [
                CardMenu(
                  icon: Icons.camera,
                  marginLeft: 20,
                  marginRight: 5,
                  title: 'Observe',
                  key: key,
                  callback: () => Get.toNamed(
                    Routes.OBSERVE,
                  ),
                ),
                CardMenu(
                  icon: Icons.map,
                  marginLeft: 5,
                  marginRight: 20,
                  title: 'Geographic',
                  key: key,
                  callback: () => Get.toNamed(
                    Routes.GEOGRAPHIC,
                  ),
                ),
                CardMenu(
                  icon: Icons.stacked_bar_chart,
                  marginLeft: 20,
                  marginRight: 5,
                  title: 'Statistic',
                  key: key,
                  callback: () => Get.toNamed(
                    Routes.STATISTIC,
                  ),
                ),
                CardMenu(
                  icon: Icons.book,
                  marginLeft: 5,
                  marginRight: 20,
                  title: 'Butterflies',
                  key: key,
                  callback: () => Get.toNamed(
                    Routes.BUTTERFLY,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
