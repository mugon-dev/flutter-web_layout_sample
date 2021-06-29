import 'package:flutter/material.dart';
import 'package:layout_sample/src/components/footer.dart';
import 'package:layout_sample/src/controller/screen_layout_controller.dart';
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
          // getX를 통해 화면 사이즈 변경 확인
          // 현재 상태에서 사이즈 변동이 일어날때 마다 build를 지속적으로 호출하기 때문에 랜더링이 계속 발생
          ScreenLayoutController.to.builder(constraints);
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
