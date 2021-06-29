import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ScreenSizeType { MOBILE, TABLET, DESKTOP }

class ScreenLayoutController extends GetxController {
  static ScreenLayoutController get to => Get.find();
  // 초기화
  // 빈번하게 바뀌는 상태는 내부에서 관리
  Rx<ScreenSizeType> _screenType = ScreenSizeType.DESKTOP.obs;
  // 최종적으로 사용하는 상태값
  Rx<ScreenSizeType> type = ScreenSizeType.DESKTOP.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    // 일정 시간 후 외부로 최종 상태값 넘겨줌
    debounce(_screenType, (_) {
      type(_screenType.value);
    }, time: Duration(milliseconds: 200));
    super.onInit();
  }

  void builder(BoxConstraints constraints) {
    if (constraints.biggest.width < 480) {
      // react 방식으로 상태 변경 => 다른 값으로 바뀌기 전에는 랜더링 방지
      _screenType(ScreenSizeType.MOBILE);
    } else if (constraints.biggest.width > 480 &&
        constraints.biggest.width < 768) {
      // tablet
      _screenType(ScreenSizeType.TABLET);
    } else {
      _screenType(ScreenSizeType.DESKTOP);
    }
  }
}
