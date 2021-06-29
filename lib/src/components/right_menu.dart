import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightMenu extends StatelessWidget {
  final double width;
  const RightMenu({this.width = 150.0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "대메뉴1",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          _sideMenu("메뉴1", () {
            Get.toNamed("/flutter");
          }),
          _sideMenu("메뉴2", () {}),
          _sideMenu("메뉴3", () {}),
          _sideMenu("메뉴4", () {}),
          _sideMenu("메뉴5", () {}),
        ],
      ),
    );
  }

  Widget _sideMenu(String menuName, VoidCallback onPressed) {
    return TextButton(
      style: ButtonStyle(
        // 왼쪽 정렬
        alignment: Alignment.centerLeft,
        // 상태에 따른 paading
        padding: MaterialStateProperty.resolveWith(getPadding),
        // 상태에 따른 버튼 색상 변경
        foregroundColor: MaterialStateProperty.resolveWith(getForegroundColor),
        // hover 상태의 백그라운드 컬러
        overlayColor:
            MaterialStateProperty.resolveWith((state) => Colors.transparent),
      ),
      onPressed: onPressed,
      child: Text(
        menuName,
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  EdgeInsets getPadding(Set<MaterialState> states) {
    const interactiveState = <MaterialState>{
      MaterialState.hovered,
    };
    // hover할때 padding left 15
    if (states.any(interactiveState.contains)) {
      return EdgeInsets.only(left: 15);
    }
    return EdgeInsets.all(0);
  }

  Color getForegroundColor(Set<MaterialState> states) {
    const interactiveState = <MaterialState>{
      MaterialState.hovered,
      MaterialState.pressed,
    };
    if (states.any(interactiveState.contains)) {
      return Colors.red;
    }
    return Colors.black;
  }
}
