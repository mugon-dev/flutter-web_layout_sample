import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/logo.jpeg",
            width: 80,
          ),
          Row(
            children: [
              menu("home", () {}),
              menu("blog", () {}),
              menu("youtube", () {}),
            ],
          ),
        ],
      ),
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
