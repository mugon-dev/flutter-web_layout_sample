import 'package:flutter/material.dart';
import 'package:layout_sample/src/components/right_menu.dart';
import 'package:layout_sample/src/controller/screen_layout_controller.dart';

class FlutterContents extends StatelessWidget {
  // final ScrollController scrollController = ScrollController();
  final ScreenSizeType screenSizeType;
  const FlutterContents(this.screenSizeType, {Key? key}) : super(key: key);
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
              'PRODUCTIVITY, PERFORMANCE AND ORGANIZATION',
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
              'Generally, the developer should be concerned with removing controllers from memory. With GetX this is not necessary because resources are removed from memory when they are not used by default. If you want to keep it in memory, you must explicitly declare "permanent: true" in your dependency. That way, in addition to saving time, you are less at risk of having unnecessary dependencies on memory. Dependency loading is also lazy by default.',
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
