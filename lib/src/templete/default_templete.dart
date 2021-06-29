import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_sample/src/components/footer.dart';
import 'package:layout_sample/src/components/navigation_menu.dart';
import 'package:layout_sample/src/components/right_menu.dart';
import 'package:layout_sample/src/controller/screen_layout_controller.dart';

class DefaultTemplate extends StatelessWidget {
  Widget contents;
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  DefaultTemplate(this.contents);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // size 별 레이아웃 설정
      // build를 계속 호출하는 문제를 피하기위해 stack을 통해 뒷편에서 사이즈를 체크
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // getX를 통해 화면 사이즈 변경 확인
              // 현재 상태에서 사이즈 변동이 일어날때 마다 build를 지속적으로 호출하기 때문에 랜더링이 계속 발생
              ScreenLayoutController.to.builder(constraints);
              return Container();
            },
          ),
          // screen size type을  위젯에 넘겨줌
          Obx(
            () => Scaffold(
              key: _key,
              drawer: Container(
                color: Colors.white,
                width: Get.size.width * 0.7,
                child: Container(
                  margin: const EdgeInsets.only(top: 50, left: 20),
                  child: RightMenu(ScreenLayoutController.to.type.value),
                ),
              ),
              body: Container(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1280),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              _key.currentState!.openDrawer();
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              child: Icon(Icons.menu),
                            ),
                          ),
                          // widget 별로 사이즈 상태 넘겨줌
                          NavigationMenu(ScreenLayoutController.to.type.value),
                        ],
                      ),
                      Expanded(
                        child: contents,
                      ),
                      Footer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
