import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  // final ScrollController scrollController = ScrollController();
  const RootPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _contents()),
          SizedBox(width: 40),
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "대메뉴1",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                _sideMenu("메뉴1", () {}),
                _sideMenu("메뉴2", () {}),
                _sideMenu("메뉴3", () {}),
                _sideMenu("메뉴4", () {}),
                _sideMenu("메뉴5", () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton _sideMenu(String menuName, VoidCallback onPressed) {
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

  Widget _contents() {
    return Scrollbar(
      isAlwaysShown: true,
      // controller: scrollController,
      child: SingleChildScrollView(
        // controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
