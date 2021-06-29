import 'package:flutter/material.dart';
import 'package:layout_sample/src/components/footer.dart';
import 'package:layout_sample/src/pages/root_page.dart';

import 'components/navigation_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // size 별 레이아웃 설정
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // size별 처리

          if (constraints.biggest.width < 480) {
            // mobile size
            print("mobile");
          }

          if (constraints.biggest.width > 480 &&
              constraints.biggest.width < 768) {
            // tablet
            print("tablet");
          }
          // desktop
          return Container(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1280),
              child: Column(
                children: [
                  NavigationMenu(),
                  Expanded(child: RootPage()),
                  Footer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  // tip
  // placeholder를 사용하면 차지하는 영역을 확인 가능
}
