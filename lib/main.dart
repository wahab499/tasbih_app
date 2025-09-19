import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tasbih_app/components/pagesroute.dart';
import 'package:tasbih_app/navbar.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'poppins',
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      getPages: allpages,
      home: BottomNavBar(index: 0),
    );
  }
}
