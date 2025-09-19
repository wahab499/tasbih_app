import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt numbercounter = 1.obs;

  incrementCounter() {
    numbercounter.value++;
  }
}
