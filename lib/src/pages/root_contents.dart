import 'package:flutter/material.dart';
import 'package:layout_sample/src/components/right_menu.dart';
import 'package:layout_sample/src/controller/screen_layout_controller.dart';

class RootContents extends StatelessWidget {
  // final ScrollController scrollController = ScrollController();
  final ScreenSizeType screenSizeType;
  const RootContents(this.screenSizeType, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.MOBILE:
        return _mobileLayout();
      case ScreenSizeType.TABLET:
        return _tabletLayout();
      case ScreenSizeType.DESKTOP:
        return _desktopLayout();
    }
  }

  Widget _desktopLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _contents()),
          RightMenu(screenSizeType),
        ],
      ),
    );
  }

  Widget _tabletLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _contents()),
          RightMenu(screenSizeType, width: 100.0),
        ],
      ),
    );
  }

  Widget _mobileLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _contents(hasScroll: false)),
        ],
      ),
    );
  }

  Widget _contents({bool hasScroll = true}) {
    if (hasScroll) {
      return Scrollbar(
        isAlwaysShown: true,
        // controller: scrollController,
        child: _contentsDetail(),
      );
    } else {
      return _contentsDetail();
    }
  }

  Widget _contentsDetail() {
    return SingleChildScrollView(
      // controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: screenSizeType == ScreenSizeType.MOBILE
                  ? TextAlign.center
                  : TextAlign.left,
            ),
            SizedBox(height: 15),
            Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
              style: TextStyle(fontSize: 14),
              textAlign: screenSizeType == ScreenSizeType.MOBILE
                  ? TextAlign.center
                  : TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
