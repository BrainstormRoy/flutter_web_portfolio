import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'dart:io';

class TestWidgetForPlatform extends StatefulWidget {
  const TestWidgetForPlatform({super.key});

  @override
  State<TestWidgetForPlatform> createState() => _TestWidgetForPlatformState();
}

class _TestWidgetForPlatformState extends State<TestWidgetForPlatform> {
  String os = Platform.operatingSystem;
  test() {
    if (kIsWeb) {
// do the web thing
    } else {
      if (Platform.isAndroid) {
        // do the android thing
      } else if (Platform.isIOS) {
        // do the ios thing
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
