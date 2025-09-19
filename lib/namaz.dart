import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasbih_app/exampletwo_controller.dart';

class Namaz extends StatefulWidget {
  const Namaz({super.key});

  @override
  State<Namaz> createState() => _NamazState();
}

final ExampletwoController exampletwoController = Get.put(
  ExampletwoController(),
);
final Examplethree examplethree = Get.put(Examplethree());

class _NamazState extends State<Namaz> {
  double opacity = .4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(
                  exampletwoController.opacity.value,
                ),
              ),
            ),
            Obx(
              () => Slider(
                value: exampletwoController.opacity.value,
                onChanged: (value) {
                  exampletwoController.setOpacity(value);
                },
              ),
            ),
            Obx(
              () => Switch(
                value: examplethree.notification.value,
                onChanged: (value) {
                  examplethree.notification.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Examplethree extends GetxController {
  RxBool notification = false.obs;
  setNotification(bool value) {
    notification.value = value;
  }
}
