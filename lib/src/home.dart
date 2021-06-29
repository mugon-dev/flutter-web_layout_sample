import 'package:flutter/material.dart';
import 'package:layout_sample/src/components/footer.dart';
import 'package:layout_sample/src/pages/root_page.dart';

import 'components/navigation_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            NavigationMenu(),
            Expanded(
              child: RootPage(),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
  // tip
  // placeholder를 사용하면 차지하는 영역을 확인 가능
}
