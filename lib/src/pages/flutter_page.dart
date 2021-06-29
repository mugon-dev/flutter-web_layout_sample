import 'package:flutter/material.dart';
import 'package:layout_sample/src/controller/screen_layout_controller.dart';
import 'package:layout_sample/src/pages/flutter_contents.dart';
import 'package:layout_sample/src/templete/default_templete.dart';

class FlutterPage extends StatelessWidget {
  FlutterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTemplate(
      FlutterContents(ScreenLayoutController.to.type.value),
    );
  }
}
