import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ScreenSizeType { MOBILE, TABLET, DESKTOP }

class ScreenLayoutController extends GetxController {
  static ScreenLayoutController get to => Get.find();
  // 초기화
  Rx<ScreenSizeType> screenType = ScreenSizeType.DESKTOP.obs;
  void builder(BoxConstraints constraints) {
    if (constraints.biggest.width < 480) {
      // react 방식으로 상태 변경 => 다른 값으로 바뀌기 전에는 랜더링 방지
      screenType(ScreenSizeType.MOBILE);
    } else if (constraints.biggest.width > 480 &&
        constraints.biggest.width < 768) {
      // tablet
      screenType(ScreenSizeType.TABLET);
    } else {
      screenType(ScreenSizeType.DESKTOP);
    }
  }
}
