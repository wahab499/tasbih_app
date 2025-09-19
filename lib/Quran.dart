import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasbih_app/counter_controller.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _newscreenState();
}

final CounterController controller = Get.put(CounterController());

class _newscreenState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow),
      body: Center(
        child: Obx(
          () => Text(
            controller.numbercounter.string,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementCounter();
        },
      ).paddingOnly(bottom: 100),
    );
  }
}
