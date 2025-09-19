import 'package:get/get.dart';
import 'package:tasbih_app/Quran.dart';
import 'package:tasbih_app/profile.dart';

var allpages = [
  GetPage(name: '/profile', page: () => Profile()),
  GetPage(name: '/quran', page: () => Quran()),
];
