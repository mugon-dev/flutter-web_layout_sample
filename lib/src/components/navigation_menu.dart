import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_sample/src/controller/screen_layout_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationMenu extends StatelessWidget {
  final ScreenSizeType screenSizeType;
  const NavigationMenu(this.screenSizeType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.MOBILE:
        return _mobileLayout();
      case ScreenSizeType.TABLET:
        return _desktopLayout();
      case ScreenSizeType.DESKTOP:
        return _desktopLayout();
    }
  }

  Widget _desktopLayout() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/logo.jpeg",
            width: 80,
          ),
          _menuGroup(),
        ],
      ),
    );
  }

  Widget _mobileLayout() {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo.jpeg",
            width: 80,
          ),
          SizedBox(height: 20),
          _menuGroup(),
        ],
      ),
    );
  }

  Row _menuGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        menu("home", () {
          Get.toNamed("/");
        }),
        menu("blog", () {
          launch("https://mugon-devlog.tistory.com/");
        }),
        menu("youtube", () {
          launch("https://www.youtube.com/watch?v=IiuZeMXBGNU");
        }),
      ],
    );
  }

  Widget menu(String menu, GestureTapCallback onTap) {
    return InkWell(
      // cursor 효과
      mouseCursor: MaterialStateMouseCursor.clickable,
      onTap: onTap,
      // hover 효과 없애기
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          menu,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
