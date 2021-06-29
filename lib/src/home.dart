import 'package:flutter/material.dart';

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
              child: _contents(),
            ),
            _footer(),
          ],
        ),
      ),
    );
  }
  // tip
  // placeholder를 사용하면 차지하는 영역을 확인 가능

  Widget _footer() {
    return Placeholder(
      fallbackHeight: 80,
    );
  }

  Widget _contents() {
    return Placeholder();
  }
}
